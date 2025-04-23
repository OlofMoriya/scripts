#!/bin/bash

context=$(tmux display-message -p '#S')
if [[ -z sessionName ]]; then
    context="misc"
fi

if [ "$1" == "-c" ]; then
    message=$(pbpaste)
elif [ "$1" == "-i" ]; then
    read -p "question: " message
elif [ -n "$1" ]; then
    message="${*:-}"
else
    read -p "question: " message
fi

~/versioned/personal/chat/target/release/chat --context_name="$context" --prompot="$message" --stream --history=5

if [ "$#" -eq 0 ]; then
    printf "\nFinished"
    read -p "" waiting
fi

