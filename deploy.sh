#!/usr/bin/env bash

set -Eeuo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
DRY_RUN=false
BACKUP_ROOT=""

if [[ "${1:-}" == "--dry-run" ]]; then
    DRY_RUN=true
elif [[ $# -gt 0 ]]; then
    printf 'Usage: %s [--dry-run]\n' "$0" >&2
    exit 2
fi

if [[ ! -d "$DOTFILES_DIR/.git" ]]; then
    printf 'Dotfiles repository not found: %s\n' "$DOTFILES_DIR" >&2
    exit 1
fi

backup_path() {
    local destination="$1"
    local relative="${destination#"$HOME"/}"

    if [[ -z "$BACKUP_ROOT" ]]; then
        BACKUP_ROOT="${XDG_STATE_HOME:-$HOME/.local/state}/dotfiles-deploy/backups/$(date +%Y%m%d-%H%M%S)"
    fi

    printf 'Back up %s -> %s/%s\n' "$destination" "$BACKUP_ROOT" "$relative"
    if [[ "$DRY_RUN" == false ]]; then
        mkdir -p "$BACKUP_ROOT/$(dirname "$relative")"
        mv -- "$destination" "$BACKUP_ROOT/$relative"
    fi
}

link_path() {
    local source="$1"
    local destination="$2"

    if [[ ! -e "$source" && ! -L "$source" ]]; then
        printf 'Missing source: %s\n' "$source" >&2
        return 1
    fi

    if [[ -L "$destination" && "$(readlink "$destination")" == "$source" ]]; then
        printf 'Already linked: %s\n' "$destination"
        return
    fi

    if [[ -e "$destination" || -L "$destination" ]]; then
        backup_path "$destination"
    fi

    printf 'Link %s -> %s\n' "$destination" "$source"
    if [[ "$DRY_RUN" == false ]]; then
        mkdir -p "$(dirname "$destination")"
        ln -sfnT -- "$source" "$destination"
    fi
}

printf 'Deploying dotfiles from %s\n' "$DOTFILES_DIR"

link_path "$DOTFILES_DIR/.config/hypr" "$HOME/.config/hypr"
link_path "$DOTFILES_DIR/.config/waybar" "$HOME/.config/waybar"
link_path "$DOTFILES_DIR/.config/hyprlock" "$HOME/.config/hyprlock"
link_path "$DOTFILES_DIR/.config/cava" "$HOME/.config/cava"
link_path "$DOTFILES_DIR/.config/wofi" "$HOME/.config/wofi"
link_path "$DOTFILES_DIR/.config/kitty" "$HOME/.config/kitty"
link_path "$DOTFILES_DIR/.config/yazi" "$HOME/.config/yazi"
link_path "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_path "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
link_path "$DOTFILES_DIR/power-toggle.sh" "$HOME/.local/bin/power-toggle.sh"

if [[ "$DRY_RUN" == true ]]; then
    printf 'Dry run complete. No files were changed.\n'
elif [[ -n "$BACKUP_ROOT" ]]; then
    printf 'Deployment complete. Replaced paths were saved in %s\n' "$BACKUP_ROOT"
else
    printf 'Deployment complete. All links were already correct.\n'
fi
