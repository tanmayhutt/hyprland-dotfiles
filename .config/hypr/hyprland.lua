-- Hyprland configuration.
-- Keep hyprland.conf as a fallback while the Lua configuration settles.

require("binds")

hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "auto",
    scale = 1,
    mirror = "eDP-1",
})

hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("GTK_THEME", "Materia-dark")
hl.env("XCURSOR_THEME", "Papirus-Dark")

hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/bin/gnome-keyring-daemon --start --components=secrets,ssh,gpg,pkcs11")
    hl.exec_cmd("waybar")
    hl.exec_cmd("mako")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("copyq")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("kdeconnect-indicator")
    hl.exec_cmd('/usr/lib/ibus/ibus-ui-gtk3 --enable-wayland-im --exec-daemon --daemon-args "--xim --panel disable"')
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("xdg-desktop-portal-hyprland")
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("hyprlock --config ~/.config/hyprlock/hyprlock.conf")
end)

hl.config({
    input = {
        kb_layout = "us",
        kb_options = "",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            tap_to_click = true,
            drag_lock = true,
            tap_and_drag = true,
        },
    },
    general = {
        gaps_in = 10,
        gaps_out = 15,
        border_size = 0,
        col = {
            active_border = "rgba(00000000)",
            inactive_border = "rgba(00000000)",
        },
        resize_on_border = false,
        extend_border_grab_area = 0,
        layout = "master",
    },
    decoration = {
        rounding = 20,
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
        smart_split = true,
        smart_resizing = true,
    },
    misc = {
        focus_on_activate = true,
        mouse_move_enables_dpms = true,
        disable_hyprland_logo = true,
        animate_manual_resizes = true,
    },
})

hl.curve("fastsmooth", {
    type = "bezier",
    points = { {0.4, 0.0}, {0.2, 1} },
})

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "fastsmooth" })
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "fastsmooth" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "fastsmooth" })
hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "fastsmooth" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 2, bezier = "fastsmooth" })

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.device({
    name = "syna2ba6:00-06cb:ce2d-mouse",
    natural_scroll = true,
})

hl.device({
    name = "syna2ba6:00-06cb:ce2d-touchpad",
    natural_scroll = true,
})

-- CAVA stays disabled at startup to avoid idle CPU use.
-- Launch it manually while using the display: kitty --class cava -e cava

hl.window_rule({
    name = "cava_rules",
    match = { class = "^(cava)$" },
    float = true,
    pin = true,
    no_focus = true,
    no_anim = true,
    no_initial_focus = true,
    no_blur = true,
    opacity = 0.5,
    size = "monitor_w monitor_h*0.1",
    move = "monitor_w*0.2 monitor_h",
})

hl.window_rule({
    name = "wfrec_rules",
    match = { class = "^(wfrec_timer)$" },
    float = true,
    stay_focused = true,
    pin = true,
    no_anim = true,
    no_blur = true,
    opacity = 0.8,
    no_focus = true,
    no_initial_focus = true,
})
