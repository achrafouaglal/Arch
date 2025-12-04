#!/bin/bash

LOCKFILE="/tmp/wofi.lock"

if [ -e "$LOCKFILE" ] && kill -0 "$(cat "$LOCKFILE")" 2>/dev/null; then
    notify-send "Wofi is already running"
    exit 0
fi

# Create lock file with current PID
echo $$ > "$LOCKFILE"

# Run Wofi
wofi --show drun

# Remove lock file when Wofi exits
rm -f "$LOCKFILE"
