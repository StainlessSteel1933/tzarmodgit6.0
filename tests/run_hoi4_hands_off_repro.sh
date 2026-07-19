#!/usr/bin/env bash
set -euo pipefail

timeout_seconds="${HOI4_TIMEOUT:-300}"
log_file="${HOI4_REPRO_LOG:-/tmp/hoi4-hands-off-navy-repro.log}"
hoi4_user_dir="${HOI4_USER_DIR:-$HOME/.local/share/Paradox Interactive/Hearts of Iron IV}"
start_tag="${HOI4_START_TAG:-HOL}"
start_speed="${HOI4_START_SPEED:-5}"
crash_dir="$hoi4_user_dir/crashes"

latest_crash() {
	find "$crash_dir" -maxdepth 1 -type d -name 'hoi4_*' -printf '%T@ %p\n' 2>/dev/null \
		| sort -nr \
		| awk 'NR == 1 { sub(/^[^ ]+ /, ""); print }'
}

before="$(latest_crash || true)"

echo "Running HOI4 hands-off repro for ${timeout_seconds}s"
echo "Command: hoi4 -data-crash-log -debug -hands_off -start_tag=${start_tag} -start_speed=${start_speed} -human_ai"
echo "Log: $log_file"
echo "Before crash: ${before:-none}"

set +e
timeout "${timeout_seconds}s" hoi4 \
	-data-crash-log \
	-debug \
	-hands_off \
	-start_tag="$start_tag" \
	-start_speed="$start_speed" \
	-human_ai \
	>"$log_file" 2>&1
status=$?
set -e

after="$(latest_crash || true)"
new_crash=0
if [[ -n "${after:-}" && "$after" != "${before:-}" ]]; then
	new_crash=1
fi

echo "Exit status: $status"
echo "After crash: ${after:-none}"
echo "New crash: $new_crash"

game_log="$hoi4_user_dir/logs/game.log"
error_log="$hoi4_user_dir/logs/error.log"

if [[ -f "$game_log" ]]; then
	echo
	echo "Game log naval test marker:"
	grep -E "Starting (UK/HOL|HOL) AI naval mission assignment test" "$game_log" | tail -3 || true
fi

if [[ -f "$error_log" ]]; then
	echo
	echo "Recent naval/map warnings:"
	grep -E "Trying to move navy|naval|port|province|building" "$error_log" | tail -40 || true
fi

exit "$status"
