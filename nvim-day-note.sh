#!/bin/bash

FOLDER="/Users/olofmoriya/versioned/personal/notes/journal"

TODAY=$(date +"%Y-%m-%d")
FILE="${FOLDER}/${TODAY}.md"

nvim $FILE
