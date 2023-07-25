#!/bin/bash

if [[ $# -eq 1 ]]; then
    rg $1 ~/versioned/personal/notes/
    exit 0
else
    selected=$(find ~/versioned/personal/notes -mindepth 1 -maxdepth 1 | fzf)
    batcat $selected
    exit 0
fi

