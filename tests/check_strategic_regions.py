"""Check that no state spans multiple strategic regions."""
import os, re, sys

MOD_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SR_DIR = os.path.join(MOD_DIR, "map", "strategicregions")
STATE_DIR = os.path.join(MOD_DIR, "history", "states")

def extract_blocks(text, name):
    pattern = name + r'\s*='
    blocks, i = [], 0
    while i < len(text):
        m = re.search(pattern, text[i:])
        if not m: break
        start = i + m.start()
        brace = text.find('{', start)
        if brace < 0: break
        depth, pos = 1, brace + 1
        while depth > 0 and pos < len(text):
            if text[pos] == '{': depth += 1
            elif text[pos] == '}': depth -= 1
            pos += 1
        blocks.append(text[start:pos])
        i = pos
    return blocks

def parse_provinces(text):
    m = re.search(r'provinces\s*=\s*\{([^}]+)\}', text, re.DOTALL)
    return [int(x) for x in re.findall(r'\d+', m.group(1))] if m else []

def parse_int_field(text, field):
    m = re.search(rf'(?<!\w){field}\s*=\s*(\d+)', text)
    return int(m.group(1)) if m else None

def parse_name(text):
    m = re.search(r'name\s*=\s*"([^"]*)"', text)
    return m.group(1) if m else None

def load_strategic_regions():
    prov_map = {}
    for fname in sorted(os.listdir(SR_DIR)):
        if not fname.endswith(".txt"): continue
        with open(os.path.join(SR_DIR, fname), encoding="utf-8") as f:
            text = f.read()
        for block in extract_blocks(text, "strategic_region"):
            rid = parse_int_field(block, "id")
            if rid is None: continue
            rname = parse_name(block) or f"region_{rid}"
            for pid in parse_provinces(block):
                prov_map[pid] = (rid, rname, fname)
    return prov_map

def load_states():
    states = []
    for fname in sorted(os.listdir(STATE_DIR)):
        if not fname.endswith(".txt"): continue
        with open(os.path.join(STATE_DIR, fname), encoding="utf-8") as f:
            text = f.read()
        for block in extract_blocks(text, "state"):
            sid = parse_int_field(block, "id")
            if sid is None: continue
            sname = parse_name(block) or f"state_{sid}"
            states.append((sid, sname, parse_provinces(block), fname))
    return states

def main():
    prov_map = load_strategic_regions()
    states = load_states()
    print(f"Loaded {len(prov_map)} province->region mappings, {len(states)} states\n")
    bad = 0
    for sid, sname, provinces, fname in states:
        if len(provinces) < 2: continue
        assigned = {}
        for pid in provinces:
            info = prov_map.get(pid)
            key = "UNMAPPED" if info is None else f"{info[1]}({info[0]})"
            assigned.setdefault(key, []).append(pid)
        if len(assigned) > 1:
            bad += 1
            print(f"STATE {sid} ({sname}) in {fname}:")
            for desc, pids in sorted(assigned.items()):
                ids = " ".join(str(p) for p in pids[:8])
                extra = f" ...+{len(pids)-8}" if len(pids) > 8 else ""
                print(f"  {len(pids)}x prov {ids}{extra} in {desc}")
    print(f"\n{bad}/{len(states)} states have conflicts" if bad else "No conflicts")
    return 1 if bad > 0 else 0

if __name__ == "__main__":
    sys.exit(main())
