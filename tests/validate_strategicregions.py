#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import re
from collections import defaultdict
from pathlib import Path


REGION_RE = re.compile(r"strategic_region\s*=\s*\{(?P<body>.*)\}\s*$", re.S)
ID_RE = re.compile(r"\bid\s*=\s*(\d+)")
PROVINCES_RE = re.compile(r"\bprovinces\s*=\s*\{(?P<provinces>[^}]*)\}", re.S)
NAVAL_RE = re.compile(r"\bnaval_terrain\s*=")
STATE_RE = re.compile(r"\bstate\s*=\s*\{(?P<body>.*)\}\s*$", re.S)


def strip_comments(text: str) -> str:
    return "\n".join(line.split("#", 1)[0] for line in text.splitlines())


def read_definitions(path: Path) -> dict[int, str]:
    definitions: dict[int, str] = {}
    with path.open(newline="", encoding="utf-8-sig") as handle:
        for row in csv.reader(handle, delimiter=";"):
            if not row or not row[0].strip().isdigit():
                continue
            definitions[int(row[0])] = row[4].strip()
    return definitions


def read_regions(path: Path) -> dict[int, dict[str, object]]:
    regions: dict[int, dict[str, object]] = {}
    for file_path in sorted(path.glob("*.txt")):
        text = strip_comments(file_path.read_text(encoding="utf-8-sig"))
        match = REGION_RE.search(text)
        if not match:
            raise ValueError(f"{file_path}: missing strategic_region block")
        body = match.group("body")
        id_match = ID_RE.search(body)
        province_match = PROVINCES_RE.search(body)
        if not id_match or not province_match:
            raise ValueError(f"{file_path}: missing id or provinces block")
        region_id = int(id_match.group(1))
        provinces = [int(value) for value in re.findall(r"\d+", province_match.group("provinces"))]
        regions[region_id] = {
            "path": file_path,
            "provinces": provinces,
            "naval": NAVAL_RE.search(body) is not None,
        }
    return regions


def read_states(path: Path) -> dict[int, list[int]]:
    states: dict[int, list[int]] = {}
    for file_path in sorted(path.glob("*.txt")):
        text = strip_comments(file_path.read_text(encoding="utf-8-sig"))
        match = STATE_RE.search(text)
        if not match:
            continue
        body = match.group("body")
        id_match = ID_RE.search(body)
        province_match = PROVINCES_RE.search(body)
        if not id_match or not province_match:
            continue
        states[int(id_match.group(1))] = [int(value) for value in re.findall(r"\d+", province_match.group("provinces"))]
    return states


def province_owners(regions: dict[int, dict[str, object]]) -> dict[int, list[int]]:
    owners: dict[int, list[int]] = defaultdict(list)
    for region_id, region in regions.items():
        for province in region["provinces"]:
            owners[province].append(region_id)
    return owners


def collect_anomalies(regions: dict[int, dict[str, object]], definitions: dict[int, str]) -> dict[str, object]:
    owners = province_owners(regions)
    duplicate_provinces = {province: ids for province, ids in owners.items() if len(ids) > 1}
    naval_bad: list[tuple[int, int, str, Path]] = []
    land_bad: list[tuple[int, int, str, Path]] = []
    unknown: list[tuple[int, int, Path]] = []

    for region_id, region in sorted(regions.items()):
        path = region["path"]
        for province in region["provinces"]:
            province_type = definitions.get(province)
            if province_type is None:
                unknown.append((region_id, province, path))
                continue
            if region["naval"] and province_type != "sea":
                naval_bad.append((region_id, province, province_type, path))
            if not region["naval"] and province_type == "sea":
                land_bad.append((region_id, province, province_type, path))

    return {
        "owners": owners,
        "duplicate_provinces": duplicate_provinces,
        "naval_bad": naval_bad,
        "land_bad": land_bad,
        "unknown": unknown,
    }


def summarize(label: str, regions: dict[int, dict[str, object]], definitions: dict[int, str]) -> list[str]:
    lines: list[str] = []
    anomalies = collect_anomalies(regions, definitions)
    duplicate_provinces = anomalies["duplicate_provinces"]
    naval_bad = anomalies["naval_bad"]
    land_bad = anomalies["land_bad"]
    unknown = anomalies["unknown"]

    lines.append(f"{label}: {len(regions)} regions, {sum(1 for r in regions.values() if r['naval'])} naval")
    lines.append(f"{label}: {len(duplicate_provinces)} duplicate province assignments")
    lines.append(f"{label}: {len(naval_bad)} non-sea provinces in naval regions")
    lines.append(f"{label}: {len(land_bad)} sea provinces in non-naval regions")
    lines.append(f"{label}: {len(unknown)} unknown province ids")

    for title, rows in (
        ("duplicate", [(0, p, ",".join(map(str, ids)), Path("")) for p, ids in sorted(duplicate_provinces.items())]),
        ("naval_non_sea", naval_bad),
        ("land_has_sea", land_bad),
        ("unknown", [(r, p, "unknown", path) for r, p, path in unknown]),
    ):
        for region_id, province, detail, path in rows[:50]:
            location = f" region={region_id}" if region_id else ""
            file_text = f" file={path}" if str(path) else ""
            lines.append(f"{label}: {title}: province={province}{location} detail={detail}{file_text}")
        if len(rows) > 50:
            lines.append(f"{label}: {title}: ... {len(rows) - 50} more")
    return lines


def compare_anomalies(
    mod_regions: dict[int, dict[str, object]],
    vanilla_regions: dict[int, dict[str, object]],
    mod_definitions: dict[int, str],
    vanilla_definitions: dict[int, str],
    states: dict[int, list[int]],
) -> tuple[list[str], bool]:
    lines: list[str] = []
    mod_anomalies = collect_anomalies(mod_regions, mod_definitions)
    vanilla_anomalies = collect_anomalies(vanilla_regions, vanilla_definitions)

    vanilla_naval_bad = {(region_id, province, detail) for region_id, province, detail, _ in vanilla_anomalies["naval_bad"]}
    vanilla_land_bad = {(region_id, province, detail) for region_id, province, detail, _ in vanilla_anomalies["land_bad"]}
    mod_extra_naval_bad = [
        row for row in mod_anomalies["naval_bad"] if (row[0], row[1], row[2]) not in vanilla_naval_bad
    ]
    mod_extra_land_bad = [
        row for row in mod_anomalies["land_bad"] if (row[0], row[1], row[2]) not in vanilla_land_bad
    ]

    lines.append(f"compare: mod duplicate province assignments: {len(mod_anomalies['duplicate_provinces'])}")
    lines.append(f"compare: mod unknown province ids: {len(mod_anomalies['unknown'])}")
    lines.append(f"compare: mod extra non-sea provinces in naval regions vs vanilla: {len(mod_extra_naval_bad)}")
    lines.append(f"compare: mod extra sea provinces in non-naval regions vs vanilla: {len(mod_extra_land_bad)}")

    owners = province_owners(mod_regions)
    state_splits = []
    for state_id, provinces in sorted(states.items()):
        region_ids = sorted({owners[province][0] for province in provinces if province in owners})
        if len(region_ids) > 1:
            state_splits.append((state_id, region_ids))
    lines.append(f"compare: mod states split across strategic regions: {len(state_splits)}")

    for title, rows in (
        ("extra_naval_non_sea", mod_extra_naval_bad),
        ("extra_land_has_sea", mod_extra_land_bad),
    ):
        for region_id, province, detail, path in rows[:50]:
            lines.append(f"compare: {title}: province={province} region={region_id} detail={detail} file={path}")
        if len(rows) > 50:
            lines.append(f"compare: {title}: ... {len(rows) - 50} more")

    failed = bool(
        mod_anomalies["duplicate_provinces"]
        or mod_anomalies["unknown"]
        or mod_extra_naval_bad
        or mod_extra_land_bad
        or state_splits
    )
    return lines, failed


def compare_mod_to_vanilla(mod_regions: dict[int, dict[str, object]], vanilla_regions: dict[int, dict[str, object]]) -> list[str]:
    lines: list[str] = []
    mod_ids = set(mod_regions)
    vanilla_ids = set(vanilla_regions)
    lines.append(f"compare: ids only in mod: {sorted(mod_ids - vanilla_ids)}")
    lines.append(f"compare: ids missing from mod: {sorted(vanilla_ids - mod_ids)}")

    changed_naval = []
    changed_provinces = []
    for region_id in sorted(mod_ids & vanilla_ids):
        mod_region = mod_regions[region_id]
        vanilla_region = vanilla_regions[region_id]
        if mod_region["naval"] != vanilla_region["naval"]:
            changed_naval.append(region_id)
        if set(mod_region["provinces"]) != set(vanilla_region["provinces"]):
            added = sorted(set(mod_region["provinces"]) - set(vanilla_region["provinces"]))
            removed = sorted(set(vanilla_region["provinces"]) - set(mod_region["provinces"]))
            changed_provinces.append((region_id, len(added), len(removed), added[:25], removed[:25]))

    lines.append(f"compare: regions with changed naval flag: {changed_naval}")
    lines.append(f"compare: regions with changed province sets: {len(changed_provinces)}")
    for region_id, added_count, removed_count, added, removed in changed_provinces[:80]:
        lines.append(
            "compare: province_delta:"
            f" region={region_id} added_count={added_count} removed_count={removed_count}"
            f" added_sample={added} removed_sample={removed}"
        )
    if len(changed_provinces) > 80:
        lines.append(f"compare: province_delta: ... {len(changed_provinces) - 80} more")
    return lines


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--mod", type=Path, default=Path("."))
    parser.add_argument("--vanilla", type=Path, required=True)
    args = parser.parse_args()

    mod_regions = read_regions(args.mod / "map" / "strategicregions")
    vanilla_regions = read_regions(args.vanilla / "map" / "strategicregions")
    mod_definitions = read_definitions(args.mod / "map" / "definition.csv")
    vanilla_definitions = read_definitions(args.vanilla / "map" / "definition.csv")
    states = read_states(args.mod / "history" / "states")

    output = []
    output.extend(summarize("mod", mod_regions, mod_definitions))
    output.extend(summarize("vanilla", vanilla_regions, vanilla_definitions))
    anomaly_output, failed = compare_anomalies(mod_regions, vanilla_regions, mod_definitions, vanilla_definitions, states)
    output.extend(anomaly_output)
    output.extend(compare_mod_to_vanilla(mod_regions, vanilla_regions))
    print("\n".join(output))
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
