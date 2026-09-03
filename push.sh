#!/usr/bin/env bash

set -Eeuo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
MESSAGE="updated config"
STAGE_ALL=false
ASSUME_YES=false
PATHS=()

usage() {
    cat <<'EOF'
Usage: push.sh [--all] [--yes] [-m MESSAGE] [PATH ...]

By default, only modifications and deletions to tracked files are staged.
Pass paths to stage specific files, or --all to include every untracked file.
EOF
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --all)
            STAGE_ALL=true
            shift
            ;;
        --yes|-y)
            ASSUME_YES=true
            shift
            ;;
        -m|--message)
            [[ $# -ge 2 ]] || { printf 'Missing commit message.\n' >&2; exit 2; }
            MESSAGE="$2"
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        --)
            shift
            PATHS+=("$@")
            break
            ;;
        -*)
            printf 'Unknown option: %s\n' "$1" >&2
            usage >&2
            exit 2
            ;;
        *)
            PATHS+=("$1")
            shift
            ;;
    esac
done

if [[ ! -d "$DOTFILES_DIR/.git" ]]; then
    printf 'Dotfiles repository not found: %s\n' "$DOTFILES_DIR" >&2
    exit 1
fi

cd "$DOTFILES_DIR"

if [[ ${#PATHS[@]} -gt 0 ]]; then
    git add -- "${PATHS[@]}"
elif [[ "$STAGE_ALL" == true ]]; then
    git add -A
else
    git add -u
fi

if git diff --cached --quiet; then
    printf 'Nothing staged.\n'
    if [[ "$STAGE_ALL" == false && ${#PATHS[@]} -eq 0 ]]; then
        untracked="$(git ls-files --others --exclude-standard)"
        if [[ -n "$untracked" ]]; then
            printf 'Untracked files were skipped:\n%s\n' "$untracked"
            printf 'Review them, then use --all or pass explicit paths.\n'
        fi
    fi
    exit 0
fi

git diff --cached --check
git status --short

if [[ "$ASSUME_YES" == false ]]; then
    if [[ ! -t 0 ]]; then
        printf 'Refusing to commit without an interactive terminal. Use --yes after reviewing the staged changes.\n' >&2
        exit 1
    fi
    read -r -p 'Commit and push these changes? [y/N] ' answer
    [[ "$answer" == "y" || "$answer" == "Y" ]] || { printf 'Cancelled.\n'; exit 0; }
fi

git commit -m "$MESSAGE"
git push
printf 'Changes pushed successfully.\n'
