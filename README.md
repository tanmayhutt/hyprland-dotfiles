# Hyprland Dotfiles 🪄

My personal Hyprland + shell configuration setup on Arch Linux.
This repo contains my **window manager config**, **shell configs**, and helper scripts — all tuned for a clean, efficient, and visually aesthetic Linux workspace.

---

## Screenshot

Here’s a glimpse of how my environment looks with these configs:

![Hyprland Preview](hyprland.png)

---

## What’s Inside

- **`.config/`** — Hyprland and related config files
- **`~/.zshrc` & `~/.zprofile`** — shell startup & environment settings
- **Helper scripts**:
  - `deploy.sh` — quick deploy of configs
  - `push.sh` — push local changes to GitHub
  - `power-toggle.sh` — custom power / sleep toggler
- **`hyprland.png`** — preview screenshot

---

## Highlights & Unique Tweaks

Here’s what makes this setup stand out:

- **Modular Config Structure** — Hyprland files are neatly organized inside `.config/`
- **Shell Harmony** — Zsh setup complements Hyprland layout (aliases, prompt, environment variables)
- **One-command Scripts** — Use `deploy.sh` and `push.sh` for effortless config syncing
- **Power Toggle Script** — `power-toggle.sh` gives quick control over system state (sleep, shutdown, etc.)
- **Visual Design** — The screenshot reflects my UI theming, spacing, gaps, transparency, and panel placements
- **Arch-focused** — Optimized for Arch Linux + Hyprland stack

---

## Installation / Usage

1. **Backup your current configs** (important!).
2. Clone this repo:

   ```bash
   git clone https://github.com/tanmayhutt/hyprland-dotfiles.git
   ```
3. Run the deploy script to copy configs into place (may require sudo or correct permissions):

   ```bash
   ~/hyprland-dotfiles/deploy.sh
   ```

4. Restart or reload Hyprland, or log out & log in again to see changes.

5. Run the push script to quickly push updates when you tweak configs:

   ```bash
   ~/hyprland-dotfiles/push.sh
   ```
