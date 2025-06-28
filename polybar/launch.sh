#!/bin/bash

# Terminate already running bar instances
killall -q polybar
killall -q i3bar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


# Launch Polybar instance per monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected"); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
