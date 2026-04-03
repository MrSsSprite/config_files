#!/bin/bash

/bin/bash ./dwm-status.sh &
/bin/bash ./wp-autochange.sh &
picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b
#picom -b
/bin/bash ./startup-scripts.sh &
#/bin/bash ~/scripts/setxmodmap-colemak.sh &
#nm-applet &
xfce4-power-manager &
#xfce4-volumed-pulse &
#/bin/bash ~/scripts/run-mailsync.sh &
systemctl --user restart wireplumber pipewire pipewire-pulse
./autostart_wait.sh &
