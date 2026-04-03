pipewire &
pipewire-pulse &
wireplumber &
fcitx5 &

# Source xinitrc.d scripts (imports DISPLAY/XAUTHORITY into systemd)
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Also propagate DBUS session bus for ghostty +new-window
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY DBUS_SESSION_BUS_ADDRESS

# Start ghostty daemon now that DISPLAY is set
systemctl --user start app-com.mitchellh.ghostty.service

exec dwm
