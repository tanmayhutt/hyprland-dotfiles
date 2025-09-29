#!/bin/bash
echo "Deploying the rice..."

DOTFILES_DIR="$HOME/dotfiles"

ln -sf "$DOTFILES_DIR/.config/hypr" "$HOME/.config/hypr"
ln -sf "$DOTFILES_DIR/.config/waybar" "$HOME/.config/waybar"
ln -sf "$DOTFILES_DIR/.config/hyprlock" "$HOME/.config/hyprlock"
ln -sf "$DOTFILES_DIR/.config/cava" "$HOME/.config/cava"
ln -sf "$DOTFILES_DIR/.config/wofi" "$HOME/.config/wofi"
ln -sf "$DOTFILES_DIR/.config/kitty" "$HOME/.config/kitty"

ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
ln -sf "$DOTFILES_DIR/power-toggle.sh" "$HOME/.local/bin/power-toggle.sh"

echo "All set, You're riced."
