#!/bin/bash

echo "🧪 Deploying your riced-out dotfiles, biatch..."

DOTFILES="$HOME/dotfiles"

# Create config dir if missing
mkdir -p "$HOME/.config"

# Remove only if they are symlinks
remove_if_symlink() {
  [ -L "$1" ] && rm "$1"
}

remove_if_symlink "$HOME/.config/hypr"
remove_if_symlink "$HOME/.config/waybar"
remove_if_symlink "$HOME/.config/hyprlock"
remove_if_symlink "$HOME/.zshrc"
remove_if_symlink "$HOME/.zprofile"

# Symlink safely
ln -sf "$DOTFILES/.config/hypr" "$HOME/.config/hypr"
ln -sf "$DOTFILES/.config/waybar" "$HOME/.config/waybar"
ln -sf "$DOTFILES/.config/hyprlock" "$HOME/.config/hyprlock"
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.zprofile" "$HOME/.zprofile"

echo "💥 Dotfiles deployed! You're riced and spicy, bitch!"
