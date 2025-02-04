#!/bin/bash
# Switch to the Japanese layout for the Magic Keyboard
setxkbmap -layout jp

# Apply key remappings (for Kana/Alphanumeric keys)
xmodmap ~/.Xmodmap

# Enable the Fn key behavior for the Magic Keyboard (Function keys without pressing Fn)
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode