#!/bin/bash

grep -B 1 -A 1 -n "${*:-}" $(find . -type f ! -path "*/.git/*") | sed "s/^--/\n/" | sed "s/${*:-}/$(tput setaf 1)${*:-}$(tput op)/g" | sed "s/\(^.*[:\-][0-9]*\)[:\-]\(.*\)/$(tput setaf 2)\1: $(tput op)\2/"
