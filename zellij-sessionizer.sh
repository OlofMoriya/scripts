#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/versioned/work/ ~/versioned/personal/ ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi
selected_name=$(basename "$selected" | tr . _)

if ! zellij list | grep -q "$selected_name"; then
    zellij --session-name=$selected_name --exec-str "cd $selected"
fi

if [[ -n $ZELLIJ_PIPE ]]; then
    zellij detach
fi

zellij attach --session-name $selected_name

