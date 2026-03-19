#!/usr/bin/env bash

source ~/.config/tmux/theme.sh
load_theme "dawn"

#separator=""
separator=""
win_nm="${1:-"bar"}"

status_bg="default"
if [[ -z "$status_bg" || "$status_bg" == "default" ]]; then
   status_bg=$(tmux show -gqv status-bg)
  status_bg=black
fi

seg_bg="$thm_surface"
seg_fg="$thm_gold"

left_sep=$(printf '#[fg=%s,bg=%s]%s' "$status_bg" "$seg_bg" "$separator")
name_seg=$(printf '#[fg=%s,bg=%s]%s' "$seg_fg" "$seg_bg" "$win_nm")
right_sep=$(printf '#[fg=%s,bg=%s]%s' "$seg_bg" "$status_bg" "$separator")

printf '%s%s%s' "$left_sep" "$name_seg" "$right_sep"
