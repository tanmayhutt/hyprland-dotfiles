#!/bin/bash

echo "🧪 Pushing your riced-out dotfiles to GitHub, biatch..."

cd "$HOME/dotfiles" || {
  echo "❌ Could not enter dotfiles directory"
  exit 1
}

# Stage all tracked and untracked changes
git add .

# Commit with timestamp
git commit -m "🔁 Dotfiles updated on $(date '+%Y-%m-%d %H:%M')" || {
  echo "ℹ️ Nothing to commit."
  exit 0
}

# Push via authenticated GitHub CLI
git push

echo "✅ GitHub updated. You’re cooking with 🔥 now."
