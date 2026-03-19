#!/usr/bin/env bash
set -euo pipefail

source ~/.config/tmux/theme.sh
load_theme "dawn"

separator=""
right_cap="█"

status_bg="default"
if [[ -z "$status_bg" || "$status_bg" == "default" ]]; then
   status_bg=$(tmux show -gqv status-bg)
  status_bg=black
fi

prev_bg="$status_bg"

# Time segment
seg_bg="$thm_surface"
seg_fg="$thm_foam"
seg_val=$(date '+%H:%M')
time_segment=$(printf '#[fg=%s,bg=%s]%s#[fg=%s,bg=%s] %s ' \
   "$seg_bg" "$prev_bg" "$separator" \
   "$seg_fg" "$seg_bg" "$seg_val")
prev_bg="$seg_bg"
# Date segment
seg_bg="$thm_base"
seg_fg="$thm_pine"
seg_val=$(date '+%a %b %d, %Y')
date_segment=$(printf '#[fg=%s,bg=%s]%s#[fg=%s,bg=%s] %s ' \
   "$seg_bg" "$prev_bg" "$separator" \
   "$seg_fg" "$seg_bg" "$seg_val")
prev_bg="$seg_bg"

# Directory segment
current_path="${1:-$PWD}"
seg_bg="$thm_hl_low"
seg_fg="$thm_gold"
seg_val=$(basename "$current_path")
dir_segment=$(printf '#[fg=%s,bg=%s]%s#[fg=%s,bg=%s] %s ' \
   "$seg_bg" "$prev_bg" "$separator" \
   "$seg_fg" "$seg_bg" "$seg_val")
prev_bg="$seg_bg"

# Username segment
seg_bg="$thm_overlay"
seg_fg="$thm_love"
seg_val=$(whoami)
usrnm_segment=$(printf '#[fg=%s,bg=%s]%s#[fg=%s,bg=%s] %s ' \
   "$seg_bg" "$prev_bg" "$separator" \
   "$seg_fg" "$seg_bg" "$seg_val")
prev_bg="$seg_bg"

# Hostname segment
#seg_bg="${TMUX_THEME_COLOR:-#b294bb}"
#seg="#1d1f21"
seg_bg="$thm_hl_high"
seg_fg="$thm_text"
seg_val=$(hostnamectl hostname)
host_segment=$(printf '#[fg=%s,bg=%s]%s#[fg=%s,bg=%s] %s ' \
   "$seg_bg" "$prev_bg" "$separator" \
   "$seg_fg" "$seg_bg" "$seg_val")
prev_bg="$seg_bg"

printf '%s%s%s%s%s#[fg=%s,bg=%s]%s' \
   "$time_segment" \
   "$date_segment" \
   "$dir_segment" \
   "$usrnm_segment" \
   "$host_segment" \
   "$prev_bg" "$status_bg" "$right_cap"
