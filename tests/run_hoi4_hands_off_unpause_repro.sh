#!/usr/bin/env bash
set -euo pipefail

timeout_seconds="${HOI4_TIMEOUT:-180}"
log_file="${HOI4_REPRO_LOG:-/tmp/hoi4-hands-off-unpause-repro.log}"
hoi4_user_dir="${HOI4_USER_DIR:-$HOME/.local/share/Paradox Interactive/Hearts of Iron IV}"
start_tag="${HOI4_START_TAG:-HOL}"
start_speed="${HOI4_START_SPEED:-5}"
crash_dir="$hoi4_user_dir/crashes"
game_log="$hoi4_user_dir/logs/game.log"
error_log="$hoi4_user_dir/logs/error.log"
xsend_key="${XSEND_KEY:-/tmp/xsend_key}"

latest_crash() {
	find "$crash_dir" -maxdepth 1 -type d -name 'hoi4_*' -printf '%T@ %p\n' 2>/dev/null \
		| sort -nr \
		| awk 'NR == 1 { sub(/^[^ ]+ /, ""); print }'
}

if [[ ! -x "$xsend_key" || tests/xsend_key.c -nt "$xsend_key" ]]; then
	gcc -O2 -Wall -Wextra tests/xsend_key.c -o "$xsend_key" -lX11 /usr/lib/x86_64-linux-gnu/libXtst.so.6
fi

before="$(latest_crash || true)"

echo "Running HOI4 hands-off unpause repro for ${timeout_seconds}s"
echo "Command: hoi4 -data-crash-log -debug -hands_off -start_tag=${start_tag} -start_speed=${start_speed} -human_ai"
echo "Log: $log_file"
echo "Before crash: ${before:-none}"

rm -f "$log_file"
set +e
hoi4 -data-crash-log -debug -hands_off -start_tag="$start_tag" -start_speed="$start_speed" -human_ai >"$log_file" 2>&1 &
pid=$!
set -e

display=""
unpaused=0
status=124
deadline=$((SECONDS + timeout_seconds))

while (( SECONDS < deadline )); do
	if ! kill -0 "$pid" 2>/dev/null; then
		wait "$pid"
		status=$?
		break
	fi

	if [[ -z "$display" && -f "$log_file" ]]; then
		display="$(grep -oE 'DISPLAY=:[0-9]+' "$log_file" | tail -1 | cut -d= -f2 || true)"
	fi

	if [[ "$unpaused" == 0 && -n "$display" && -f "$game_log" ]] \
		&& grep -q 'Launching SINGLEPLAYER-game' "$game_log" \
		&& grep -q 'Starting HOL AI naval mission assignment test' "$game_log"; then
		sleep 2
		echo "Sending Space to unpause on DISPLAY=$display"
		DISPLAY="$display" "$xsend_key" space || true
		unpaused=1
	fi

	sleep 1
done

if kill -0 "$pid" 2>/dev/null; then
	kill "$pid" 2>/dev/null || true
	wait "$pid" 2>/dev/null || true
fi

after="$(latest_crash || true)"
new_crash=0
if [[ -n "${after:-}" && "$after" != "${before:-}" ]]; then
	new_crash=1
fi

echo "Exit status: $status"
echo "After crash: ${after:-none}"
echo "New crash: $new_crash"
echo "Unpause sent: $unpaused"

if [[ -f "$game_log" ]]; then
	echo
	echo "Game log tail:"
	tail -80 "$game_log" || true
fi

if [[ -f "$error_log" ]]; then
	echo
	echo "Recent naval/map warnings:"
	grep -E "Trying to move navy|naval|port|province|building|MAP_ERROR|Invalid" "$error_log" | tail -80 || true
fi

exit "$status"
