#!/bin/bash
#!/usr/bin/env bash

# 1. Search for text in files using Ripgrep
# 2. Interactively narrow down the list using fzf
# 3. Open the file in Vim

if [[ $# -eq 1 ]]; then
    rg --color=always --line-number --no-heading --smart-case "${*:-}" ~/versioned/personal/notes/ |
        fzf --ansi \
          --color "hl:-1:underline,hl+:-1:underline:reverse" \
          --delimiter : \
          --preview 'bat --color=always {1} --highlight-line {2}' \
          --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
          --bind 'enter:become(vim {1} +{2})'
else
    selected=$(find ~/versioned/personal/notes -mindepth 1 -maxdepth 2 | fzf)

    gum format --type markdown < $selected
    exit 0
fi

