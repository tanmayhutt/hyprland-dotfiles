#!/bin/bash

echo "🧪 Pushing your riced-out dotfiles to GitHub, biatch..."

cd "$HOME/dotfiles" || {
  echo "❌ Failed to cd into ~/dotfiles"
  exit 1
}

# Stage updated files only
git add .config/hypr .config/waybar .config/hyprlock .zshrc .zprofile

# Commit if there's anything to commit
if ! git diff --cached --quiet; then
  git commit -m "🔁 Dotfiles updated on $(date '+%Y-%m-%d %H:%M')"
  git push
  echo "✅ Dotfiles pushed, Jesse style!"
else
  echo "ℹ️ Nothing new to commit."
fi
