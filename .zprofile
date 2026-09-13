export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORM="wayland;xcb"

eval $(ssh-agent -s)

if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    while true; do
        if grep -q "^connected" /sys/class/drm/card*-HDMI-*/status 2>/dev/null; then
            start-hyprland
        fi
        sleep 2
    done
fi


# Added by Antigravity CLI installer
export PATH="/home/tanmay/.local/bin:$PATH"
