#!/bin/bash

# Check if a directory is a git repository
is_git_repo() {
  git -C "$1" rev-parse --is-inside-work-tree &> /dev/null
}

# Set colors
BLUE='\e[34m'
RESET='\e[0m'

# Loop through subdirectories with a maximum depth of 1
path="${1:-.}"
find "$path" -maxdepth 1 -mindepth 1 -type d | while read -r dir; do
  if is_git_repo "$dir"; then
    printf "\n${BLUE}==== %s ====${RESET}\n\n" "$dir"
    git -C "$dir" status
  else
    echo "not a git repo"
  fi
done
