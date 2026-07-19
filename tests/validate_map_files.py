#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import re
import struct
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path


ID_RE = re.compile(r"\bid\s*=\s*(\d+)")
PROVINCES_RE = re.compile(r"\bprovinces\s*=\s*\{(?P<provinces>[^}]*)\}", re.S)
STATE_RE = re.compile(r"\bstate\s*=\s*\{(?P<body>.*)\}\s*$", re.S)
HISTORY_RE = re.compile(r"\bhistory\s*=\s*\{")
BUILDINGS_RE = re.compile(r"\bbuildings\s*=\s*\{")
PROVINCE_BUILDING_RE = re.compile(r"^\s*(\d+)\s*=\s*\{")


@dataclass(frozen=True)
class StateInfo:
    state_id: int
    path: Path
    provinces: set[int]


@dataclass(frozen=True)
class ProvinceInfo:
    province_id: int
    province_type: str


class BmpProvinceMap:
    def __init__(self, path: Path, colors: dict[tuple[int, int, int], int]) -> None:
        data = path.read_bytes()
        if data[:2] != b"BM":
            raise ValueError(f"{path}: not a BMP file")
        self._data = data
        self._offset = struct.unpack_from("<I", data, 10)[0]
        header_size = struct.unpack_from("<I", data, 14)[0]
        if header_size < 40:
            raise ValueError(f"{path}: unsupported BMP header size {header_size}")
        self.width = struct.unpack_from("<i", data, 18)[0]
        height = struct.unpack_from("<i", data, 22)[0]
        self.height = abs(height)
        self._top_down = height < 0
        self._bpp = struct.unpack_from("<H", data, 28)[0]
        compression = struct.unpack_from("<I", data, 30)[0]
        if self._bpp not in (24, 32) or compression != 0:
            raise ValueError(f"{path}: unsupported BMP format bpp={self._bpp} compression={compression}")
        self._bytes_per_pixel = self._bpp // 8
        self._row_stride = ((self.width * self._bpp + 31) // 32) * 4
        self._colors = colors

    def province_at(self, x: float, z: float) -> int | None:
        px = int(round(x))
        pz = int(round(z))
        if px < 0 or px >= self.width or pz < 0 or pz >= self.height:
            return None
        # HOI map coordinates use bottom-left origin; BMP rows are stored from top.
        y = self.height - 1 - pz
        file_row = y if self._top_down else self.height - 1 - y
        pos = self._offset + file_row * self._row_stride + px * self._bytes_per_pixel
        b, g, r = self._data[pos : pos + 3]
        return self._colors.get((r, g, b))


def strip_comments(text: str) -> str:
    return "\n".join(line.split("#", 1)[0] for line in text.splitlines())


def find_matching_brace(text: str, open_index: int) -> int:
    depth = 0
    for index in range(open_index, len(text)):
        if text[index] == "{":
            depth += 1
        elif text[index] == "}":
            depth -= 1
            if depth == 0:
                return index
    raise ValueError("unclosed brace")


def extract_block_after(match: re.Match[str], text: str) -> tuple[str, int, int]:
    open_index = text.find("{", match.start())
    close_index = find_matching_brace(text, open_index)
    return text[open_index + 1 : close_index], open_index, close_index


def read_definitions(path: Path) -> tuple[dict[int, ProvinceInfo], dict[tuple[int, int, int], int]]:
    provinces: dict[int, ProvinceInfo] = {}
    colors: dict[tuple[int, int, int], int] = {}
    with path.open(newline="", encoding="utf-8-sig") as handle:
        for row in csv.reader(handle, delimiter=";"):
            if len(row) < 5 or not row[0].strip().isdigit():
                continue
            province_id = int(row[0])
            color = (int(row[1]), int(row[2]), int(row[3]))
            provinces[province_id] = ProvinceInfo(province_id=province_id, province_type=row[4].strip())
            colors[color] = province_id
    return provinces, colors


def read_states(path: Path) -> dict[int, StateInfo]:
    states: dict[int, StateInfo] = {}
    for file_path in sorted(path.glob("*.txt")):
        text = strip_comments(file_path.read_text(encoding="utf-8-sig", errors="replace"))
        match = STATE_RE.search(text)
        if not match:
            continue
        body = match.group("body")
        id_match = ID_RE.search(body)
        province_match = PROVINCES_RE.search(body)
        if not id_match or not province_match:
            continue
        state_id = int(id_match.group(1))
        provinces = {int(value) for value in re.findall(r"\d+", province_match.group("provinces"))}
        states[state_id] = StateInfo(state_id=state_id, path=file_path, provinces=provinces)
    return states


def build_province_to_state(states: dict[int, StateInfo]) -> tuple[dict[int, int], dict[int, list[int]]]:
    province_to_state: dict[int, int] = {}
    duplicate_owners: dict[int, list[int]] = defaultdict(list)
    for state in states.values():
        for province in state.provinces:
            if province in province_to_state:
                duplicate_owners[province].append(province_to_state[province])
                duplicate_owners[province].append(state.state_id)
            else:
                province_to_state[province] = state.state_id
    return province_to_state, {province: sorted(set(ids)) for province, ids in duplicate_owners.items()}


def check_state_files(
    root: Path,
    states: dict[int, StateInfo],
    province_to_state: dict[int, int],
    duplicate_owners: dict[int, list[int]],
    vanilla_states: dict[int, StateInfo] | None,
) -> list[str]:
    errors: list[str] = []
    path_by_id: dict[int, list[Path]] = defaultdict(list)
    for file_path in sorted((root / "history" / "states").glob("*.txt")):
        text = strip_comments(file_path.read_text(encoding="utf-8-sig", errors="replace"))
        id_match = ID_RE.search(text)
        if id_match:
            path_by_id[int(id_match.group(1))].append(file_path)

    for state_id, paths in sorted(path_by_id.items()):
        if len(paths) > 1:
            errors.append(f"STATE_DUPLICATE_ID state={state_id} files={','.join(str(path) for path in paths)}")

    for province, owners in sorted(duplicate_owners.items()):
        errors.append(f"STATE_DUPLICATE_PROVINCE province={province} states={owners}")

    max_state = max(states) if states else 0
    for state_id in range(1, max_state + 1):
        if state_id not in states:
            errors.append(f"STATE_ID_GAP state={state_id} max_state={max_state}")

    if vanilla_states is not None:
        missing = sorted(set(vanilla_states) - set(states))
        for state_id in missing:
            errors.append(f"STATE_MISSING_VANILLA state={state_id} vanilla_file={vanilla_states[state_id].path}")

    for state in sorted(states.values(), key=lambda item: item.state_id):
        text = strip_comments(state.path.read_text(encoding="utf-8-sig", errors="replace"))
        history_match = HISTORY_RE.search(text)
        if not history_match:
            continue
        try:
            history_body, _, _ = extract_block_after(history_match, text)
        except ValueError as exc:
            errors.append(f"STATE_PARSE_ERROR file={state.path} error={exc}")
            continue
        buildings_match = BUILDINGS_RE.search(history_body)
        if not buildings_match:
            continue
        try:
            buildings_body, _, _ = extract_block_after(buildings_match, history_body)
        except ValueError as exc:
            errors.append(f"STATE_PARSE_ERROR file={state.path} state={state.state_id} error={exc}")
            continue
        for line_offset, line in enumerate(buildings_body.splitlines(), start=1):
            block_match = PROVINCE_BUILDING_RE.match(line)
            if not block_match:
                continue
            province = int(block_match.group(1))
            actual_state = province_to_state.get(province)
            if actual_state != state.state_id:
                errors.append(
                    "STATE_HISTORY_PROVINCE_BUILDING_WRONG_STATE"
                    f" file={state.path} state={state.state_id} province={province}"
                    f" actual_state={actual_state} local_buildings_line={line_offset}"
                )
    return errors


def check_buildings(
    root: Path,
    province_map: BmpProvinceMap,
    provinces: dict[int, ProvinceInfo],
    province_to_state: dict[int, int],
) -> list[str]:
    errors: list[str] = []
    buildings_path = root / "map" / "buildings.txt"
    sea_coordinate_buildings = {"naval_base", "naval_base_spawn", "dockyard", "coastal_bunker"}
    placement_only_buildings = {"floating_harbor"}
    with buildings_path.open(encoding="utf-8-sig", errors="replace") as handle:
        for line_number, raw_line in enumerate(handle, start=1):
            line = raw_line.split("#", 1)[0].strip()
            if not line:
                continue
            parts = [part.strip() for part in line.split(";")]
            if len(parts) != 7:
                errors.append(f"BUILDINGS_BAD_FIELD_COUNT file={buildings_path} line={line_number} fields={len(parts)} text={line}")
                continue
            try:
                scripted_state = int(parts[0])
                building_type = parts[1]
                x = float(parts[2])
                z = float(parts[4])
                explicit_province = int(float(parts[6]))
            except ValueError:
                errors.append(f"BUILDINGS_BAD_VALUE file={buildings_path} line={line_number} text={line}")
                continue
            province = explicit_province if explicit_province > 0 else province_map.province_at(x, z)
            if province is None:
                errors.append(f"BUILDINGS_UNKNOWN_COORD file={buildings_path} line={line_number} state={scripted_state} x={x} z={z}")
                continue
            actual_state = province_to_state.get(province)
            province_type = provinces.get(province).province_type if province in provinces else "unknown"
            if building_type in placement_only_buildings:
                continue
            if building_type in sea_coordinate_buildings and province_type in {"sea", "unknown"}:
                continue
            if actual_state != scripted_state:
                errors.append(
                    "BUILDINGS_WRONG_STATE"
                    f" file={buildings_path} line={line_number} building={building_type}"
                    f" scripted_state={scripted_state} actual_state={actual_state}"
                    f" province={province} province_type={province_type} x={x} z={z}"
                )
    return errors


def read_building_sites(root: Path) -> dict[int, set[str]]:
    sites: dict[int, set[str]] = defaultdict(set)
    buildings_path = root / "map" / "buildings.txt"
    with buildings_path.open(encoding="utf-8-sig", errors="replace") as handle:
        for raw_line in handle:
            line = raw_line.split("#", 1)[0].strip()
            if not line:
                continue
            parts = [part.strip() for part in line.split(";")]
            if len(parts) < 2:
                continue
            try:
                state_id = int(parts[0])
            except ValueError:
                continue
            sites[state_id].add(parts[1])
    return sites


def check_required_building_sites(root: Path, states: dict[int, StateInfo]) -> list[str]:
    errors: list[str] = []
    sites = read_building_sites(root)
    required_sites = {
        "air_base": "MAPSITE_MISSING_AIR_BASE",
        "rocket_site_spawn": "MAPSITE_MISSING_ROCKET_SITE",
    }
    for state in sorted(states.values(), key=lambda item: item.state_id):
        if not state.provinces:
            continue
        for building_type, error_name in required_sites.items():
            if building_type not in sites.get(state.state_id, set()):
                errors.append(f"{error_name} state={state.state_id} file={state.path}")
    return errors


def check_railways(root: Path, known_provinces: set[int]) -> list[str]:
    errors: list[str] = []
    railways_path = root / "map" / "railways.txt"
    with railways_path.open(encoding="utf-8-sig", errors="replace") as handle:
        for line_number, raw_line in enumerate(handle, start=1):
            line = raw_line.split("#", 1)[0].strip()
            if not line:
                continue
            parts = line.split()
            if len(parts) < 3:
                errors.append(f"RAILWAY_BAD_FIELD_COUNT file={railways_path} line={line_number} text={line}")
                continue
            try:
                level = int(parts[0])
                count = int(parts[1])
                provinces = [int(part) for part in parts[2:]]
            except ValueError:
                errors.append(f"RAILWAY_BAD_VALUE file={railways_path} line={line_number} text={line}")
                continue
            if level < 1 or level > 5:
                errors.append(f"RAILWAY_BAD_LEVEL file={railways_path} line={line_number} level={level}")
            if count != len(provinces):
                errors.append(f"RAILWAY_COUNT_MISMATCH file={railways_path} line={line_number} declared={count} actual={len(provinces)}")
            for province in provinces:
                if province not in known_provinces:
                    errors.append(f"RAILWAY_UNKNOWN_PROVINCE file={railways_path} line={line_number} province={province}")
    return errors


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate HOI4 state/map files without launching the game.")
    parser.add_argument("--root", type=Path, default=Path("."), help="Mod root")
    parser.add_argument(
        "--vanilla",
        type=Path,
        default=Path("/home/alex/.local/share/Steam/steamapps/common/Hearts of Iron IV"),
        help="Vanilla HOI4 root used with --compare-vanilla-states",
    )
    parser.add_argument("--compare-vanilla-states", action="store_true", help="Also report all vanilla state ids missing from the mod")
    args = parser.parse_args()

    root = args.root.resolve()
    provinces, colors = read_definitions(root / "map" / "definition.csv")
    states = read_states(root / "history" / "states")
    province_to_state, duplicate_owners = build_province_to_state(states)
    vanilla_states = read_states(args.vanilla / "history" / "states") if args.compare_vanilla_states else None
    province_map = BmpProvinceMap(root / "map" / "provinces.bmp", colors)

    errors: list[str] = []
    errors.extend(check_state_files(root, states, province_to_state, duplicate_owners, vanilla_states))
    errors.extend(check_buildings(root, province_map, provinces, province_to_state))
    errors.extend(check_required_building_sites(root, states))
    errors.extend(check_railways(root, set(provinces)))

    for error in errors:
        print(error)
    print(
        f"SUMMARY states={len(states)} provinces_with_states={len(province_to_state)}"
        f" building_errors={sum(1 for error in errors if error.startswith('BUILDINGS_'))}"
        f" mapsite_errors={sum(1 for error in errors if error.startswith('MAPSITE_'))}"
        f" state_errors={sum(1 for error in errors if error.startswith('STATE_'))}"
        f" railway_errors={sum(1 for error in errors if error.startswith('RAILWAY_'))}"
    )
    return 1 if errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
