#!/bin/bash
# Switch to the Japanese layout for the Magic Keyboard
setxkbmap -layout jp

# Apply key remappings (for Kana/Alphanumeric keys)
xmodmap ~/.Xmodmap

# Enable the Fn key behavior for the Magic Keyboard (Function keys without pressing Fn)
echo 2 | pkexec tee /sys/module/hid_apple/parameters/fnmode

# Show a notification with increased display time (e.g., 5000 milliseconds = 5 seconds)
notify-send -t 1500 "Keyboard Layout" "Switched to Magic Keyboard Layout"