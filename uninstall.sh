#!/bin/bash

# Check if git is available
git --version 2>&1 >/dev/null

GIT_IS_AVAILABLE=$?

# TODO: get the path from settings
FILE=~/.gitignore_global

if [ -f "$FILE" ]; then
	rm "$FILE" 
fi

if [[ $GIT_IS_AVAILABLE -eq 0 ]]
then
	git config --global core.excludesfile ''
fi

exit 0;
