#!/bin/bash

# Publish website
#

# Check for input
#
if [[ -z "${1}" ]]; then
    printf "ERROR: No user provided\n"
    exit 1
fi

# Build output
nikola3 build

rsync -avz -e "ssh" --progress \
    "$(dirname "${0}")"/output/* \
    "${1}"@maxamillion.sh:/var/www/html/