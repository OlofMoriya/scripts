#!/bin/bash

# Check if a directory is a git repository
is_git_repo() {
  git -C "$1" rev-parse --is-inside-work-tree &> /dev/null
}

# Check if a git repository has changes
has_changes() {
  test -n "$(git -C "$1" status --porcelain)"
}

# Check if a git repository is synced with its remote
is_synced() {
  local branch remote_branch
  branch="$(git -C "$1" branch --show-current)"
  remote_branch="$(git -C "$1" config branch.$branch.merge | sed 's/^refs\///')"
  if [ -z "$remote_branch" ]; then
    return 1
  fi
  git -C "$1" diff --quiet "refs/heads/$branch" "refs/remotes/$remote_branch" &> /dev/null
}

# Set colors
RED='\e[31m'
GREEN='\e[32m'
RESET='\e[0m'

# Loop through subdirectories with a maximum depth of 1
path="${1:-.}"
find "$path" -maxdepth 1 -mindepth 1 -type d | while read -r dir; do
  if is_git_repo "$dir"; then
    if has_changes "$dir"; then
      printf "${RED}%s${RESET} - Uncommitted changes\n" "$dir"
    elif ! is_synced "$dir"; then
      printf "${RED}%s${RESET} - Not synced with the remote\n" "$dir"
    else
      printf "${GREEN}%s${RESET} - Synced\n" "$dir"
    fi
  fi
done
