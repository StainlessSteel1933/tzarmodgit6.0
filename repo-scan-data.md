# Repo Scan Pre-Scan Report

- **Target**: `/home/alex/.local/share/Paradox Interactive/Hearts of Iron IV/mod/tzarmodgit6.0`
- **Scan Time**: 2026-05-16 23:09:09

## 1. Overall Statistics

| Metric | Value |
|--------|-------|
| Total Files | 7357 |
| Total Size (raw) | 489.61 MB |
| **Project Source Files** | **5426** |
| **Project Source Size** | **312.12 MB** |
| Third-Party Files | 0 |
| Third-Party Size | 0 B |
| Noise Files (build artifacts) | 1931 |
| Noise Size (build artifacts) | 177.49 MB |
| Project Code Ratio | 63.7% |
| Oldest Source File | 2026-05-15 |
| Newest Source File | 2026-05-15 |

## 2. Top-Level Directory Breakdown

| Directory | Project Files | Project Size | Total Size | Build Systems | Notes |
|-----------|--------------|-------------|------------|---------------|-------|
| `common` | 817 | 9.07 MB | 9.07 MB | - |  |
| `events` | 86 | 816.94 KB | 816.94 KB | - |  |
| `gfx` | 2536 | 158.24 MB | 158.24 MB | - |  |
| `history` | 1256 | 2.23 MB | 2.23 MB | - |  |
| `interface` | 315 | 3.20 MB | 3.20 MB | - |  |
| `localisation` | 67 | 2.79 MB | 2.79 MB | - |  |
| `map` | 314 | 81.63 MB | 81.63 MB | - |  |
| `music` | 15 | 51.76 MB | 51.76 MB | - |  |
| `sound` | 7 | 2.35 MB | 2.35 MB | - |  |
| `tests` | 7 | 36.83 KB | 49.93 KB | - |  |

## 3. Source File Statistics by Tech Stack (project files only)

| Tech Stack | File Count | Total Size |
|------------|------------|------------|
| C/C++ | 1 | 3.32 KB |
| Java/Android | 0 | 0 B |
| iOS (OC/Swift) | 0 | 0 B |
| C#/.NET | 0 | 0 B |
| Web/JS/TS | 0 | 0 B |
| CSS/Style | 0 | 0 B |

## 4. Third-Party Dependencies Detected

No known third-party libraries detected.

## 5. Suspected Code Duplication (directories appearing 3+ times)

### `modules/` (4 occurrences)
- `common/units/equipment/modules`
- `gfx/interface/equipmentdesigner/naval/modules`
- `gfx/interface/equipmentdesigner/planes/modules`
- `gfx/interface/equipmentdesigner/tanks/modules`

### `ROM/` (4 occurrences)
- `gfx/interface/equipmentdesigner/tanks/designer/ROM`
- `gfx/interface/ideologies/ROM`
- `gfx/interface/technologies/ROM`
- `gfx/leaders/ROM`

### `units/` (3 occurrences)
- `common/units`
- `gfx/models/units`
- `history/units`

### `technologies/` (3 occurrences)
- `common/technologies`
- `gfx/interface/technologies`
- `gfx/technologies`

### `ideas/` (3 occurrences)
- `common/ideas`
- `gfx/interface/ideas`
- `gfx/interface/ideas/ideas`

### `goals/` (3 occurrences)
- `common/ai_navy/goals`
- `common/factions/goals`
- `gfx/interface/goals`

### `categories/` (3 occurrences)
- `common/decisions/categories`
- `common/peace_conference/categories`
- `common/raids/categories`

### `FIN/` (3 occurrences)
- `gfx/interface/equipmentdesigner/tanks/designer/FIN`
- `gfx/interface/ideologies/FIN`
- `gfx/interface/technologies/FIN`

### `HUN/` (3 occurrences)
- `gfx/interface/equipmentdesigner/tanks/designer/HUN`
- `gfx/interface/ideologies/HUN`
- `gfx/interface/technologies/HUN`

### `tanks/` (3 occurrences)
- `gfx/interface/equipmentdesigner/tanks`
- `gfx/models/units/tanks`
- `interface/equipmentdesigner/tanks`


## 6. Directory Tree (noise filtered, third-party marked)

```text
tzarmodgit6.0/
├── common/
│   ├── abilities/
│   ├── ai_navy/
│   │   └── goals/
│   ├── autonomous_states/
│   ├── bookmarks/
│   ├── bop/
│   ├── buildings/
│   ├── characters/
│   ├── colors/
│   ├── continuous_focus/
│   ├── countries/
│   ├── country_leader/
│   ├── country_tags/
│   ├── decisions/
│   │   └── categories/
│   ├── defines/
│   ├── difficulty_settings/
│   ├── doctrines/
│   │   ├── folders/
│   │   ├── grand_doctrines/
│   │   ├── subdoctrines/
│   │   └── tracks/
│   ├── dynamic_modifiers/
│   ├── equipment_groups/
│   ├── factions/
│   │   └── goals/
│   ├── focus_inlay_windows/
│   ├── idea_tags/
│   │   └── game_rules/
│   ├── ideas/
│   ├── ideas_disabled/
│   ├── ideologies/
│   ├── intelligence_agencies/
│   ├── military_industrial_organization/
│   │   ├── ai_bonus_weights/
│   │   ├── organizations/
│   │   └── policies/
│   ├── modifiers/
│   ├── names/
│   ├── national_focus/
│   ├── occupation_laws/
│   ├── on_actions/
│   ├── operations/
│   ├── opinion_modifiers/
│   ├── peace_conference/
│   │   ├── ai_peace/
│   │   ├── categories/
│   │   └── cost_modifiers/
│   ├── profile_pictures/
│   ├── raids/
│   │   └── categories/
│   ├── resistance_activity/
│   ├── ribbons/
│   ├── scripted_effects/
│   ├── scripted_guis/
│   ├── scripted_localisation/
│   ├── scripted_triggers/
│   ├── state_category/
│   ├── technologies/
│   ├── technology_sharing/
│   ├── technology_tags/
│   ├── terrain/
│   ├── unit_leader/
│   ├── unit_medals/
│   └── units/
│       ├── codenames_operatives/
│       ├── critical_parts/
│       ├── equipment/
│       ├── names/
│       ├── names_divisions/
│       ├── names_railway_guns/
│       ├── names_ships/
│       └── unit_modifiers/
├── events/
├── gfx/
│   ├── entities/
│   ├── flags/
│   │   ├── medium/
│   │   └── small/
│   ├── interface/
│   │   ├── counters/
│   │   ├── equipmentdesigner/
│   │   ├── goals/
│   │   ├── ideas/
│   │   ├── ideologies/
│   │   ├── imperial_influence/
│   │   ├── inner_circle/
│   │   ├── scripted_gui/
│   │   ├── state_modifiers/
│   │   ├── technologies/
│   │   └── terrains/
│   ├── leaders/
│   │   ├── CRO/
│   │   ├── ESR/
│   │   ├── GER/
│   │   ├── ISR/
│   │   ├── JAP/
│   │   ├── RAJ/
│   │   ├── RHS/
│   │   ├── ROM/
│   │   └── SOV/
│   ├── loadingscreens/
│   ├── map/
│   ├── minimap/
│   ├── models/
│   │   └── units/
│   ├── sp_events/
│   ├── technologies/
│   └── texticons/
├── history/
│   ├── countries/
│   ├── general/
│   ├── states/
│   └── units/
│       └── sr/
├── interface/
│   └── equipmentdesigner/
│       ├── planes/
│       ├── ships/
│       └── tanks/
├── localisation/
│   ├── braz_por/
│   ├── english/
│   ├── french/
│   ├── german/
│   ├── japanese/
│   ├── polish/
│   ├── russian/
│   ├── simp_chinese/
│   └── spanish/
├── map/
│   ├── strategicregions/
│   └── terrain/
├── music/
│   └── menu/
├── sound/
│   └── menu/
└── tests/
```

## 7. Git Repositories & Activity

Found **1** git repositories.

| Repository | Total Commits | Recent (1yr) | Last Commit |
|-----------|---------------|-------------|-------------|
| `(root)` | 845 | 448 | 2026-05-16 |

## 8. Noise Directory Summary

| Type | Occurrences (files) | Total Size |
|------|--------------------:|------------|
| `.git/` | 1930 | 177.47 MB |
| `__pycache__/` | 1 | 13.10 KB |