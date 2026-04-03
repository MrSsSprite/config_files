#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ra='ranger'
PS1='[\u@\h \W]\$ '

set -o vi

# vim Gruvbox Coloring
source ~/.vim/plugged/gruvbox/gruvbox_256palette.sh

# Volume Functions
function volset {
   pactl set-sink-volume @DEFAULT_SINK@ "$1"
}
function volget {
   pactl get-sink-volume @DEFAULT_SINK@
}
function volmute {
   pactl set-sink-mute @DEFAULT_SINK@ toggle
}
function volgmute {
   pactl get-sink-mute @DEFAULT_SINK@
}
