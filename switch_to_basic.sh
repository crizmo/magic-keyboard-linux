#!/bin/bash
# Switch to the basic keyboard layout (e.g., US)
setxkbmap -layout us

# Reset the Fn key behavior for the laptop's built-in keyboard
echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
