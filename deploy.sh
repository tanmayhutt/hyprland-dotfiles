#!/bin/bash

echo "🧪 Deploying your riced-out dotfiles, biatch..."

DOTFILES_DIR="$HOME/dotfiles"

# Symlink config folders
ln -sf "$DOTFILES_DIR/.config/hypr" "$HOME/.config/hypr"
ln -sf "$DOTFILES_DIR/.config/waybar" "$HOME/.config/waybar"
ln -sf "$DOTFILES_DIR/.config/hyprlock" "$HOME/.config/hyprlock"

# Symlink Zsh configs
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"

echo "💥 All set, homes! You're riced and nice."
