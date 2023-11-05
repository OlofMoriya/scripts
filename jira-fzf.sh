#!/bin/bash

# echo "list status" 
status=$(printf "To do\nIn progress\nReview (To be done by DEV)\nReview (To be done by MTD)\nNew\nDone/Accepted in production" | fzf)

if [[ -z "$status" ]]; then
    exit 1
fi 

issue=$(jira issue list -s"$status" --plain | fzf | sed "s/^.*\(AX-[0-9]\{4\}\).*/\1/g")
# echo "jira issue view $issue"
jira issue view $issue

