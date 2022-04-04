#!/bin/bash

# Check if git is available
git --version 2>&1 >/dev/null

GIT_IS_AVAILABLE=$?

# TODO: get the path from settings
FILE=~/.gitignore_global

if [ -f "$FILE" ]; then
	echo "$FILE already exists. Backing up ..."
	mv "$FILE" "${FILE}.bak_"$(date +"%Y%m%d_%H%M%S")
fi

cp ./.gitignore "$FILE"

if [[ $GIT_IS_AVAILABLE -eq 0 ]]
then
	git config --global core.excludesfile ~/.gitignore_global
else
	echo "Git binary not found in your path."
	exit 1;
fi

exit 0;
