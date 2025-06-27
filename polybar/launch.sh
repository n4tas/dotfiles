#!/bin/bash

# Terminate already running bar instances
killall -q polybar
killall -q i3bar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITORS=("DisplayPort-1" "HDMI-1-0" "eDP")

# Launch Polybar instance per monitor
for MON in "${MONITORS[@]}"; do
    MONITOR=$MON polybar main -c ~/.config/polybar/config.ini &
done
