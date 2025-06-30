#!/bin/bash

echo "🧪 Pushing your riced-out dotfiles to GitHub, biatch..."

cd "$HOME/dotfiles" || {
  echo "❌ Could not enter dotfiles directory"
  exit 1
}

# Stage everything you care about, including this script
git add .config/hypr .config/hyprlock .config/waybar .zshrc .zprofile push.sh

# Commit with timestamp
git commit -m "🔁 Dotfiles updated on $(date '+%Y-%m-%d %H:%M')" || {
  echo "ℹ️ Nothing to commit."
  exit 0
}

# Push to GitHub
git push

echo "✅ GitHub updated. You’re cooking with 🔥 now."
