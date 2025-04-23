#!/bin/bash

# Define the folder path and the input text
FOLDER="/Users/olofmoriya/versioned/personal/notes/journal"
INPUT_TEXT=$(gum write --placeholder "note")

# Get today's date and create a file with that name in the specified folder
TODAY=$(date +"%Y-%m-%d")
FILE="${FOLDER}/${TODAY}.md"

 # Create the file if it does not exist
if [ ! -f "${FILE}" ]; then
  echo -e "# $TODAY" >> "${FILE}"
  echo -e "" >> "${FILE}"
fi

# Append the input text to the file
echo -e "${INPUT_TEXT}" >> "${FILE}"
echo -e "---" >> "${FILE}"
