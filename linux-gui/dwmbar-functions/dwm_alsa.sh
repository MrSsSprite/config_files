#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_alsa () {
   #VOL=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
         #head -n $(( $SINK + 1 )) | tail -n 1 | \
         #sed -e 's,.* \([0-9][0-9]*\)%.*,\1,');
   VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | \
         sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
   MUTE_STATUS=$(pactl get-sink-mute 0 | awk '{print $2}')
    printf "%s" "$SEP1";
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [[ "$VOL" -eq 0 || "$MUTE_STATUS" == "yes" ]]; then
            printf "";
        elif [ "$VOL" -le 33 ]; then
            printf " %s%%" "$VOL";
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf " %s%%" "$VOL";
        else
            printf " %s%%" "$VOL";
        fi
    else
        if [ "$VOL" -eq 0 ]; then
            printf "MUTE";
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "VOL %s%%" "$VOL";
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "VOL %s%%" "$VOL";
        else
            printf "VOL %s%%" "$VOL";
        fi
    fi
    printf "%s\n" "$SEP2";
}

