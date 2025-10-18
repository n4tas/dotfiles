#!/usr/bin/env bash
set -euo pipefail

THRESHOLD=10   # warn at <= 10%
RESET=16       # clear warning flag once back to >= 16% or charging

BAT_PATH="$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -n1)"
[ -z "${BAT_PATH:-}" ] && exit 0

capacity="$(cat "$BAT_PATH/capacity" 2>/dev/null || echo 100)"
status="$(cat "$BAT_PATH/status" 2>/dev/null || echo Unknown)"

STATE_FILE="/tmp/battery-notify.state"
[ -f "$STATE_FILE" ] && warned="$(cat "$STATE_FILE")" || warned="0"

if [ "$status" = "Discharging" ] && [ "$capacity" -le "$THRESHOLD" ]; then
  if [ "$warned" != "1" ]; then
    notify-send -u critical "Battery low (${capacity}%)" "Connect power."
    # Optional sound:
    # paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga >/dev/null 2>&1 || true
    echo "1" > "$STATE_FILE"
  fi
else
  if [ "$status" = "Charging" ] || [ "$capacity" -ge "$RESET" ]; then
    echo "0" > "$STATE_FILE"
  fi
fi

echo ""

