#!/usr/bin/env bash
set -euo pipefail

MODE=${1:-full}
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
STAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FILE="$DIR/Screenshot_$STAMP.png"

notify() {
    if command -v notify-send >/dev/null 2>&1; then
        notify-send "Screenshot saved" "$1"
    fi
}

copy_to_clipboard() {
    if command -v wl-copy >/dev/null 2>&1; then
        wl-copy < "$1"
    fi
}

case "$MODE" in
    full)
        if grim "$FILE"; then
            copy_to_clipboard "$FILE"
            notify "Copied & saved to $FILE"
        fi
        ;;
    area)
        GEOM=$(slurp)
        [ -z "${GEOM:-}" ] && exit 0
        if grim -g "$GEOM" "$FILE"; then
            copy_to_clipboard "$FILE"
            notify "Region copied & saved to $FILE"
        fi
        ;;
    area-edit)
        GEOM=$(slurp)
        [ -z "${GEOM:-}" ] && exit 0
        if grim -g "$GEOM" "$FILE"; then
            copy_to_clipboard "$FILE"
            notify "Region copied, saved to $FILE, opening Swappy"
            if command -v swappy >/dev/null 2>&1; then
                swappy -f "$FILE"
            fi
        fi
        ;;
    *)
        echo "Unknown screenshot mode: $MODE" >&2
        exit 1
        ;;
 esac
