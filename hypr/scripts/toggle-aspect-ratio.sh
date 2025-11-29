#!/bin/sh
STATE_FILE="/tmp/hypr-aspect-toggle"

if [ -f "$STATE_FILE" ]; then
    hyprctl keyword dwindle:single_window_aspect_ratio 0 0 >/dev/null 2>&1
    rm -f "$STATE_FILE"
else
    hyprctl keyword dwindle:single_window_aspect_ratio 1 1 >/dev/null 2>&1
    touch "$STATE_FILE"
fi
