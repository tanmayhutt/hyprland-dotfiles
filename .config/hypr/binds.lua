local function run(keys, command, options)
    hl.bind(keys, hl.dsp.exec_cmd(command), options)
end

run("SUPER + A", "wofi --show drun")
hl.bind("SUPER + Q", hl.dsp.window.close())
run("SUPER + T", "kitty")
run("SUPER + E", "thunar")
run("SUPER + M", "/usr/bin/foot btop")
run("SUPER + L", "hyprlock --config ~/.config/hyprlock/hyprlock.conf")
run("SUPER + ESCAPE", "systemctl suspend")

run("SHIFT + Print", 'grim -g "$(slurp)" - | wl-copy && wl-paste > /home/tanmay/Videos/Captures/Screenshot-$(date +%F_%H-%M-%S).png && notify-send "Region screenshot saved"')
run("Print", 'grim - | wl-copy && wl-paste > /home/tanmay/Videos/Captures/Screenshot-$(date +%F_%H-%M-%S).png && notify-send "Fullscreen screenshot saved"')
run("SUPER + SHIFT + T", "~/.config/OCR4Linux/OCR4Linux.sh")

run("XF86MonBrightnessDown", "~/.config/hypr/brightness-volume.sh brightness 2%-", { repeating = true })
run("XF86MonBrightnessUp", "~/.config/hypr/brightness-volume.sh brightness 2%+", { repeating = true })
run("XF86AudioLowerVolume", "~/.config/hypr/brightness-volume.sh volume -5%", { repeating = true })
run("XF86AudioRaiseVolume", "~/.config/hypr/brightness-volume.sh volume +5%", { repeating = true })
run("XF86AudioMute", "~/.config/hypr/brightness-volume.sh mute")

run("SUPER + R", "~/.local/bin/toggle-record.sh")
run("SUPER + P", "hyprpicker -a")
