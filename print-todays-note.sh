#!/bin/bash

# Define the folder path and the input text
FOLDER="/Users/olofmoriya/versioned/personal/notes/journal"

# Get today's date and create a file with that name in the specified folder
TODAY=$(date +"%Y-%m-%d")
FILE="${FOLDER}/${TODAY}.md"

 # Create the file if it does not exist
if [ ! -f "${FILE}" ]; then
    echo -e "No note created for today"
    touch "${FILE}"
else
    gum format --type markdown < "${FILE}"
fi

