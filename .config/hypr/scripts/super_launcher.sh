#!/usr/bin/env bash
sleep 0.15

if ! devices_json="$(hyprctl -j devices 2>/dev/null)"; then
  exit 0
fi

active_count=$(
  printf '%s' "$devices_json" | python - <<'PY'
import json, sys
data = json.load(sys.stdin)
count = 0
for kb in data.get("keyboards", []):
    count += len(kb.get("active_keysyms", []) or [])
print(count)
PY
)
active_count=${active_count//$'\n'/}

if [ "${active_count:-0}" -eq 0 ]; then
  if pgrep -x rofi >/dev/null 2>&1; then
    pkill -x rofi
  else
    dir="$HOME/.config/rofi/launchers/type-6"
    theme="style-4"
    rofi -show drun -theme "${dir}/${theme}.rasi"
  fi
fi

