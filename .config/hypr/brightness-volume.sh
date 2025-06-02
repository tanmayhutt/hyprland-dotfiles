#!/bin/bash

TYPE="$1"
ARG="$2"

BAR() {
    local val=$1
    local max=100
    local bars=10
    local filled=$(( val * bars / max ))
    local empty=$(( bars - filled ))
    local bar=""
    for ((i=0; i<filled; i++)); do bar+="█"; done
    for ((i=0; i<empty; i++)); do bar+="░"; done
    echo "$bar"
}

if [ "$TYPE" = "brightness" ]; then
    brightnessctl -d intel_backlight set "$ARG"
    cur=$(cat /sys/class/backlight/intel_backlight/brightness)
    max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    perc=$(( cur * 100 / max ))
    bar=$(BAR $perc)
    notify-send -r 911 -h int:value:"$perc" -h string:x-dunst-stack-tag:brightness "💡 Brightness: $perc%" "$bar"

elif [ "$TYPE" = "volume" ]; then
    # Unmute before changing volume
    pactl set-sink-mute @DEFAULT_SINK@ 0
    
    # Change volume
    pactl set-sink-volume @DEFAULT_SINK@ "$ARG"
    
    # Get current volume percentage
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\{1,3\}%' | head -1 | tr -d '%')
    
    # Generate volume bar
    bar=$(BAR $vol)
    
    # Send notification
    notify-send -r 912 -h int:value:"$vol" -h string:x-dunst-stack-tag:volume "🔊 Volume: $vol%" "$bar"

elif [ "$TYPE" = "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    if [ "$muted" = "yes" ]; then
        notify-send -r 913 -h string:x-dunst-stack-tag:mute "🔇 Muted" "Volume muted"
    else
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\{1,3\}%' | head -1 | tr -d '%')
        bar=$(BAR $vol)
        notify-send -r 912 -h int:value:"$vol" -h string:x-dunst-stack-tag:volume "🔊 Volume: $vol%" "$bar"
    fi
fi
