#!/bin/bash

# Export necessary variables just in case
export DISPLAY=:1
export XDG_RUNTIME_DIR=/run/user/1000

# Restore pywal theme
wal -R

# If you use colors in shell apps
[[ -f ~/.cache/wal/colors.sh ]] && source ~/.cache/wal/colors.sh

# Optional: set wallpaper with feh/swww etc
# feh --bg-scale ~/.cache/wal/wallpaper.jpg
