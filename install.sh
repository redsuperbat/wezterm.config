#!/bin/bash

SOURCE_FILE=~/.wezterm.lua
SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.wezterm.lua"

if [ -f $SOURCE_FILE ]; then
	echo "backing up file"
	mv $SOURCE_FILE "$SOURCE_FILE.bak"
fi
echo $SCRIPT_DIRECTORY

ln -s $SCRIPT_DIRECTORY $SOURCE_FILE
