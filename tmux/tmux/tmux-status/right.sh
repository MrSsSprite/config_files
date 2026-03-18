#!/usr/bin/env bash
set -euo pipefail

theme="dawn"
if [[ $theme == main ]]; then

   thm_base="#191724";
   thm_surface="#1f1d2e";
   thm_overlay="#26233a";
   thm_muted="#6e6a86";
   thm_subtle="#908caa";
   thm_text="#e0def4";
   thm_love="#eb6f92";
   thm_gold="#f6c177";
   thm_rose="#ebbcba";
   thm_pine="#31748f";
   thm_foam="#9ccfd8";
   thm_iris="#c4a7e7";
   thm_hl_low="#21202e";
   thm_hl_med="#403d52";
   thm_hl_high="#524f67";

elif [[ $theme == dawn ]]; then

   thm_base="#faf4ed";
   thm_surface="#fffaf3";
   thm_overlay="#f2e9e1";
   thm_muted="#9893a5";
   thm_subtle="#797593";
   thm_text="#575279";
   thm_love="#b4637a";
   thm_gold="#ea9d34";
   thm_rose="#d7827e";
   thm_pine="#286983";
   thm_foam="#56949f";
   thm_iris="#907aa9";
   thm_hl_low="#f4ede8";
   thm_hl_med="#dfdad9";
   thm_hl_high="#cecacd";

elif [[ $theme == moon ]]; then

   thm_base="#232136";
   thm_surface="#2a273f";
   thm_overlay="#393552";
   thm_muted="#6e6a86";
   thm_subtle="#908caa";
   thm_text="#e0def4";
   thm_love="#eb6f92";
   thm_gold="#f6c177";
   thm_rose="#ea9a97";
   thm_pine="#3e8fb0";
   thm_foam="#9ccfd8";
   thm_iris="#c4a7e7";
   thm_hl_low="#2a283e";
   thm_hl_med="#44415a";
   thm_hl_high="#56526e";

fi

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
seg_bg="$thm_hl_low"
seg_fg="$thm_gold"
seg_val=$(basename "$PWD")
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
