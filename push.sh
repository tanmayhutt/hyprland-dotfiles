echo "Pushing the ricing"
cd ~/dotfiles || { echo "dotfiles folder not found"; exit 1; }

git add .
git commit -m "Auto update: $(date '+%Y-%m-%d %H:%M:%S')" 2>/dev/null && \
echo "Committed changes." || echo "Nothing to commit."

git push && echo "All pushed, Heisenberg style!" || echo "Push failed."
