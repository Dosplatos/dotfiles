#!/usr/bin/env bash
choice=$(cliphist list | rofi -dmenu -p "Clipboard")
if [ -n "$choice" ]; then
    printf '%s' "$choice" | cliphist decode | wl-copy
fi
