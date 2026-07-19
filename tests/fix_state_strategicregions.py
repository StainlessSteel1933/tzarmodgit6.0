#!/usr/bin/env python3
from __future__ import annotations

import re
from collections import Counter, defaultdict
from pathlib import Path

from validate_strategicregions import read_regions


STATE_RE = re.compile(r"\bstate\s*=\s*\{(?P<body>.*)\}\s*$", re.S)
ID_RE = re.compile(r"\bid\s*=\s*(\d+)")
PROVINCES_RE = re.compile(r"\bprovinces\s*=\s*\{(?P<provinces>[^}]*)\}", re.S)


def strip_comments(text: str) -> str:
    return "\n".join(line.split("#", 1)[0] for line in text.splitlines())


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


def format_province_block(provinces: list[int]) -> str:
    lines: list[str] = []
    row: list[str] = []
    for province in provinces:
        row.append(str(province))
        if len(row) == 24:
            lines.append("\t\t" + " ".join(row) + " ")
            row = []
    if row:
        lines.append("\t\t" + " ".join(row) + " ")
    return "provinces={\n" + "\n".join(lines) + "\n\t}"


def main() -> int:
    root = Path(".")
    regions = read_regions(root / "map" / "strategicregions")
    states = read_states(root / "history" / "states")

    province_owner: dict[int, int] = {}
    region_provinces: dict[int, list[int]] = {}
    for region_id, region in regions.items():
        provinces = list(region["provinces"])
        region_provinces[region_id] = provinces
        for province in provinces:
            province_owner[province] = region_id

    moves: dict[int, int] = {}
    for state_id, provinces in sorted(states.items()):
        owners = [province_owner.get(province) for province in provinces if province in province_owner]
        owners = [owner for owner in owners if owner is not None]
        if len(set(owners)) <= 1:
            continue
        non_naval = [owner for owner in owners if not regions[owner]["naval"]]
        pool = non_naval or owners
        counts = Counter(pool)
        target = counts.most_common(1)[0][0]
        for province in provinces:
            owner = province_owner.get(province)
            if owner is not None and owner != target:
                moves[province] = target

    if not moves:
        print("No state strategic-region splits found.")
        return 0

    by_source: dict[int, set[int]] = defaultdict(set)
    by_target: dict[int, list[int]] = defaultdict(list)
    for province, target in moves.items():
        source = province_owner[province]
        by_source[source].add(province)
        by_target[target].append(province)

    for region_id, removed in by_source.items():
        region_provinces[region_id] = [province for province in region_provinces[region_id] if province not in removed]
    for region_id, added in by_target.items():
        existing = set(region_provinces[region_id])
        region_provinces[region_id].extend(province for province in added if province not in existing)
        region_provinces[region_id].sort()

    for region_id, provinces in region_provinces.items():
        path: Path = regions[region_id]["path"]
        text = path.read_text(encoding="utf-8-sig")
        new = re.sub(r"provinces\s*=\s*\{[^}]*\}", format_province_block(provinces), text, count=1, flags=re.S)
        path.write_text(new, encoding="utf-8")

    print(f"Moved {len(moves)} provinces across strategic regions to keep state provinces together.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
