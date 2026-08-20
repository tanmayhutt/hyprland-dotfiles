# ⚡ TanmayHutt's Hyprland Dotfiles

My personal, high-performance **Hyprland** and **Zsh** configuration, tuned for **Arch Linux**. Built for speed, aesthetics, and a powerful, keyboard-driven workflow.

---

## 📸 Showcase

![Hyprland Preview](hyprland.png)

---

## ✨ Features & Highlights

* **Window Manager**: `Hyprland` with dynamic tiling — **10px inner gaps**, **15px outer gaps**, **20px window rounding**.
* **Aesthetics**: System-wide theming via **Pywal** (`wal -R` on every shell start). Set a new theme anytime with `theme`.
* **Terminal**: `Kitty` — GPU-accelerated, uses Pywal colors. Displays system info via `fastfetch` on launch.
* **Shell**: `Zsh` + Oh My Zsh with `zsh-autosuggestions`, `zsh-syntax-highlighting`, `z`, and `sudo` plugins.
* **Visualizer**: `CAVA` with custom shaders (`eye_of_phi.frag`, `northern_lights.frag`, `winamp_line_style_spectrum.frag`).
* **App Launcher**: `Wofi` — transparent dark window with frosted glass blur and shadow. Prompt: `"Yo, search it!"`.
* **Bar**: `Waybar` — colors inherit from Pywal.
* **Lockscreen**: `Hyprlock` — shows time, date, battery, network, profile picture.
* **Platform**: Wayland env vars set (`QT_QPA_PLATFORM=wayland;xcb`) + `fcitx` input method.

---

## 📂 Repository Structure

```text
hyprland-dotfiles/
├── README.md
├── deploy.sh               # Symlink all configs to ~/.config
├── push.sh                 # Git auto-commit/push helper
├── power-toggle.sh         # Custom power profile cycler
├── .zprofile               # Zsh login shell (auto-starts Hyprland on TTY1)
├── .zshrc                  # Zsh interactive shell config
└── .config/
    ├── hypr/               # Hyprland compositor config
    ├── waybar/             # Status bar config + Pywal styling
    ├── wofi/               # App launcher styling
    ├── kitty/              # Terminal emulator config
    ├── hyprlock/           # Lockscreen config
    └── cava/               # Audio visualizer + shaders
```

---

## 🚀 Deployment

```bash
git clone https://github.com/tanmayhutt/hyprland-dotfiles
cd hyprland-dotfiles
bash deploy.sh
```

`deploy.sh` symlinks all configs into `~/.config` so updates to the repo are reflected instantly.

---

## ⌨️ Key Bindings

| Key | Action |
|-----|--------|
| `Super + T` | Open terminal (kitty) |
| `Super + A` | App launcher (wofi) |
| `Super + E` | File manager |
| `Super + B` | Browser (brave) |
| `Super + Q` | Kill active window |
| `Super + L` | Lock screen (hyprlock) |
| `Print` | Screenshot (grim) |

---

## 🎨 Theming

Pywal generates a color scheme from your wallpaper and applies it system-wide (terminal, Waybar, GTK).

```bash
# Set theme from wallpaper
theme

# Or manually
wal -i ~/Downloads/wallpaper.png
```

Colors reload automatically on every new shell via `wal -R` in `.zshrc`.

---

## 📝 Notes

- This machine now runs headless as a server — Hyprland config is preserved but the desktop is dormant. See [arch-server](https://github.com/tanmayhutt/arch-server) for the server setup.
- `fastfetch` replaced `neofetch` for system info display.
