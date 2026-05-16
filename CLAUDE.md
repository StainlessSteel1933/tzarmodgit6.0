# TZARMOD — Hearts of Iron IV Total Conversion Mod

## Project
- Full total conversion alt-history HOI4 mod, competitive multiplayer focused, **balance is a priority**
- Target version **1.18.x**, Steam Workshop ID: `3008796636`
- Old codebase — some files are outdated/unused. Verify before assuming something is active.
- Some directories selectively replace vanilla files (not full `replace_path`). When adding new content, always check if vanilla files in that directory are being loaded first.

## Working style
- No comments unless explaining *why* (non-obvious constraints, subtle invariants, workarounds)
- Look at existing files/docs first, understand the pattern, then write

## File Encoding
- **Script files (.txt)**: UTF-8 **without** BOM
- **Defines files (.lua)**: UTF-8 **without** BOM
- **Localisation files (.yml)**: UTF-8 **with** BOM
- File/folder names are case-sensitive on Linux; no non-ASCII characters
- Images: DDS (ARGB8, no mipmaps) or 32-bit TGA (no RLE, bottom-left origin)
- Thumbnail: PNG, <1MB, 1:1 ratio

## Naming Conventions
- `tzar_` — main TZARMOD content
- `zz_` — late-loading files (ASCII load order)
- `TBE_`, `HMP_`, `horst_`, `jaeger_`, `GDU_`, `SEA_`, `SR_`, `MB_`, `mdi_`, `AXMTIE_`, `EMI_` — various feature/author prefixes
- `00_` — early-load base files
- DLC prefixes follow vanilla: `BBA_`, `MTG_`, `NSB_`, `DOD_`, `BFTB_`, `AAT_`
- Country tags: `GER_`, `FRA_`, `SOV_`, `JAP_`, `ENG_`, `CHI_`, etc. for country-specific content

## Directory Structure

### Mod Root
Each mod needs two `.mod` files — one `descriptor.mod` inside the mod folder, and a user-specific one in the parent `mod/` directory with a `path` field (`tzarmodgit6.0.mod`).

```
common/             — Game logic (see below for subdirectories)
events/             — Country events (flat directory, no subdirs)
history/            — Starting conditions
  countries/        — Country history files (AFG - Afghanistan.txt, etc.)
  states/           — State definitions
  units/            — OOBs and unit placements
    sr/             — Special units OOB
gfx/                — Graphics assets
  entities/         — 3D model entity definitions (.asset/.gfx)
  flags/            — Country flags (medium/, small/)
  interface/        — UI element icons (.dds)
    equipmentdesigner/  — Tank/plane/naval module icons + graphic_db
  leaders/          — Leader portraits by country tag
  loadingscreens/   — Loading screen images
  map/              — Map related graphics
  minimap/          — Minimap graphics
  models/units/     — 3D unit models
  sp_events/        — Special event graphics
  technologies/     — Tech icon graphics
  texticons/        — Text icon graphics
interface/          — GUI layouts (.gui) and sprite definitions (.gfx)
  equipmentdesigner/  — Tank/plane/ship designer GUI
localisation/       — Localisation files by language
map/                — Map data: adjacencies, provinces, terrain, heightmap,
                    railways, rivers, strategic regions, supply, weather
music/menu/         — Menu music tracks
sound/menu/         — Menu sound effects
tests/              — Python validation scripts, C helper, hands-off replay
```

### `common/` Subdirectories
```
abilities/            — Character abilities
acclimatation.txt     — Acclimatation settings
achievements.txt      — Achievement definitions
ai_attitudes.txt      — AI attitude modifiers
ai_navy/goals/        — AI navy strategy goals
ai_personalities.txt  — AI personality templates
alerts.txt            — Game alerts
autonomous_states/    — Autonomous state categories
bookmarks/            — Start date bookmarks
bop/                  — Balance of Power mechanics
buildings/            — Building definitions
characters/           — Character/advisor/corps commander definitions
colors/               — Country colors
combat_tactics.txt    — Combat tactics
continuous_focus/     — Continuous national focus trees
countries/            — Country definitions (tags, flags, etc.)
country_leader/       — Leader types and traits
country_tags/         — Dynamic country tag registration
decisions/            — National decisions + categories/
defines/              — Lua defines (01_career_profile.lua, etc.)
difficulty_settings/  — Difficulty modifiers
doctrines/            — Land/naval/air doctrine trees (folders/, grand_doctrines/, etc.)
dynamic_modifiers/    — Dynamic modifiers
equipment_groups/     — Equipment category groups
event_modifiers.txt   — Event-sourced modifiers
factions/goals/       — Faction goals
focus_inlay_windows/  — Custom focus tooltip windows
graphicalculturetype.txt — Graphics culture mapping
ideas/                — National spirits and ideas
ideas_disabled/       — Disabled ideas (can be enabled mid-game)
idea_tags/            — Idea tag definitions
ideologies/           — Ideology definitions (fascist, democratic, etc.)
intelligence_agencies/ — Intelligence agency definitions
military_industrial_organization/ — MIOs (organizations/, policies/, ai_bonus_weights/)
modifiers/            — Static modifier definitions
names/                — Ship/aircraft/etc. name lists
national_focus/       — National focus trees
occupation_laws/      — Occupation law definitions
on_actions/           — On-action event triggers
operations/           — Special operations
opinion_modifiers/    — Opinion modifier definitions
peace_conference/     — Peace conference categories and cost modifiers
profile_pictures/     — Profile picture definitions
raids/                — Raid definitions (air raids, etc.)
region_colors.txt     — Strategic region colors
resistance_activity/  — Resistance activity definitions
ribbons/              — Unit ribbon/medal graphics
script_enums.txt      — Script enumerations
scripted_effects/     — Reusable scripted effects
scripted_guis/        — Dynamic GUI scripts
scripted_localisation/ — Dynamic localisation
scripted_triggers/    — Reusable scripted trigger conditions
state_category/       — State category definitions (urban, rural, etc.)
technologies/         — Technology trees
technology_sharing/   — Tech sharing groups
technology_tags/      — Tech tag mappings
terrain/              — Terrain definitions
unit_leader/          — Leader skill definitions
unit_medals/          — Unit medal definitions
units/                — Equipment, unit modifiers, codenames, names
weather.txt           — Weather definitions
```

### File Loading
- The game merges files from all mods and vanilla by directory. Same filename + path = overwrite the file entirely (no line-level merge).
- `replace_path` unloads every previously-loaded file in the specified folder at menu load — must be in **both** `.mod` files.
- Files load in ASCII order by filename. Prefix with `0` or `00` to load early, `zz_` to load late.
- To add new content without conflict, use unique filenames (e.g. `tzar_my_ideas.txt` instead of overwriting vanilla files). But for balance-relevant overrides, using the same filename to override vanilla is intentional.
- **Note**: The `.mod` files currently have duplicate `replace_path` entries (`common/units`, `common/units/equipment/modules`, `common/scripted_localisation` each appear 2x) — these are redundant but harmless.

## .mod Descriptor Format

The actual `descriptor.mod` (inside mod folder) uses ~46 `replace_path` entries covering most `common/` subdirs, `history/`, `map/`, `events/`, `gfx/`, and `tests/`. The user-specific `tzarmodgit6.0.mod` mirrors it exactly and adds the `path=` field.

Key points:
- `replace_path` must be in **both** files or it won't work
- No `dependencies=` — this mod has no hard dependencies
- `supported_version="1.18.*"`, `remote_file_id="3008796636"`

## Scripting Language (PDXscript)

### Syntax
- Assignment: `attribute = value` or `attribute = { block }`
- Curly braces `{}` delimit blocks, brackets align vertically, each nesting level indents
- Indentation is conventional (not syntactic) but required for readability
- Booleans: lowercase `yes` / `no`
- Strings: double quotes only `"like this"` when containing spaces; unquoted tokens otherwise
- No commas as separators — whitespace separates list items: `target = { GER ITA JAP }`
- Comments: `#` — rest of line is ignored (no multi-line comments)
- String limit: 255 characters max

### Scopes
- `ROOT` — top-level scope of current context (e.g. country receiving an event)
- `THIS` — current scope
- `PREV` — enclosing scope; chainable: `PREV.PREV`
- `FROM` — secondary scope (e.g. event sender)
- Scope by tag: `GER = { }`, by state ID: `123 = { }`, by character: `TAG_char_name`
- Iteration: `every_possible_country`, `random_country`, `every_state`, `every_owned_state`, etc. — all accept `limit = { }` with triggers

### Flow Control
- `AND = { }` — all true (default, implicit)
- `OR = { }` — at least one true
- `NOT = { }` — none true (NOR)
- `if = { limit = { } }` / `else_if = { }` / `else = { }` — conditional
- `count_triggers = { amount = N ... }` — true if ≥N sub-triggers are true
- `hidden_trigger = { }` — like AND but hidden from tooltips

### Variables
```
set_variable = { var = my_var value = 100 }
add_to_variable = { var = my_var value = 50 }
check_variable = { var = my_var value = 10 compare = greater_than_or_equals }
```
- Prefix with `var:` for variable scope references (can omit in most cases)
- `temp_variable` for temporary values
- Arrays: `add_to_array`, `remove_from_array`, `clear_array`

### Modifiers & Ideas
- Modifier values are always numeric: `political_power_gain = 0.15`
- Block form: `modifier = { ... }` inside ideas, national spirits, etc.
- `hidden_modifier = { ... }` hides from tooltips
- `custom_modifier_tooltip = loc_key_tt` for custom tooltip text

### Events
```
add_namespace = my_events

country_event = {
    id = my_events.1
    title = my_events.1.t
    desc = my_events.1.desc
    picture = GFX_report_event_speech

    is_triggered_only = yes
    fire_only_once = yes
    major = yes
    hidden = yes

    trigger = { ... }
    mean_time_to_happen = { days = 30 modifier = { factor = 0.5 ... } }

    immediate = { }  # fires before option selection
    after = { }      # fires after option selection (1.16.9+)

    option = {
        name = my_events.1.a
        trigger = { ... }
        ai_chance = { base = 10 modifier = { ... factor = 0 } }
        # effects
    }
}
```
- `add_namespace` declared before any event using it, outside event block
- `is_triggered_only = yes` disables auto-fire; `trigger = {}` checked every 20 days
- Conditional titles: `title = { text = key.t.a trigger = { } }`
- `hidden = yes` auto-picks first option, needs no title/desc

### Localisation
```
l_english:
 GER_fascism:0 "German Reich"
 GER_fascism_DEF:0 "the German Reich"
 GER_fascism_ADJ:0 "German"
 my_modifier: "My Modifier"
 my_modifier_desc: "§GDescription with color§!"
```
- Key: alphanumeric, underscores, dots, hyphens only — no spaces, no diacritics
- Value: single line, double-quoted, `\n` for newlines, `\"` for inner quotes
- `$KEY$` nests another localisation key
- `[Scope.GetProperty]` for dynamic values; `\|` for formatting (e.g. `\|%+0`)
- Color codes: `§Rred§!`, `§Ggreen§!`, `§Bblue§!`, `§Hyellow§!`, `§Corange§!`
- `replace/` subfolder overrides keys without copying the whole file
- File name must contain the language: `filename_l_english.yml`

## Defines (Lua)
Defines live in `common/defines/*.lua` (not `.txt`). Standard HOI4 Lua syntax for modifying engine constants. Current files:
- `01_career_profile.lua` — Character career traits
- `cw_graphics.lua` — Graphics settings
- `nsb_defines.lua` — No Step Back DLC defines
- `performance_defines.lua` — Performance tweaks
- `sr_defines.lua` — SSR/define overrides

## Debugging
- Launch with `-debug` flag (Steam launch option) for automatic file reloading, extended error logs, and Nudger access
- Check `~/.local/share/Paradox Interactive/Hearts of Iron IV/logs/error.log` for script errors

## Testing
- `tests/validate_map_files.py` — Map file validation
- `tests/validate_strategicregions.py` — Strategic region validation
- `tests/fix_state_strategicregions.py` — Fix state-region mismatches
- `tests/run_hoi4_hands_off_repro.sh` — Hands-off replay (observers)
- `tests/run_hoi4_hands_off_unpause_repro.sh` — Hands-off replay (unpaused)
- `tests/xsend_key.c` — Helper for sending key inputs during testing
- `tests/README.md` — Documents why vanilla tests are replaced (total conversion breaks vanilla test references)

## Git
- Short commit messages, branch from `main`
- 845 commits as of 2026-05, active development
