
#!/bin/bash


issue=$(jira issue list -a$(jira me) -s"to do" -s"in progress" --plain | fzf | sed "s/^.*\(AX-[0-9]\{4\}\).*/\1/g")

action=$(printf "View\nBranch" | fzf)

if [ "$action" = 'View' ]; then
    jira issue view $issue
fi

if [ "$action" = 'Branch' ]; then
    read -p "Description: " input
    # echo "$issue-$(echo "$input" | sed "s/ /-/g")" 
    git checkout -b "$issue-$(echo "$input" | sed "s/ /-/g")"
fi

if [[ -z "$action" ]]; then
    exit 1
fi 
