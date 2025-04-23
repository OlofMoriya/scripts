#!/bin/bash

# Define the folder path and the input text
FOLDER="/Users/olofmoriya/versioned/personal/notes/journal"

# Get today's date and create a file with that name in the specified folder
TODAY=$(date +"%Y-%m-%d")
FILE="${FOLDER}/${TODAY}.md"

nvim "${FILE}"

