#!/bin/bash

# Get current active profile without colon
current=$(powerprofilesctl | grep '^\*' | cut -d ' ' -f2 | tr -d ':')

# Cycle through the modes
case "$current" in
  performance)
    powerprofilesctl set balanced
    notify-send "🟢 Switched to Balanced"
    ;;
  balanced)
    powerprofilesctl set power-saver
    notify-send "🔋 Switched to Power Saver"
    ;;
  power-saver)
    powerprofilesctl set performance
    notify-send "⚡ Switched to Performance"
    ;;
  *)
    notify-send "❌ Unknown profile: $current"
    ;;
esac
