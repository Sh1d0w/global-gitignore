# Check if git is available
git --version 2>&1 >/dev/null

GIT_IS_AVAILABLE=$?

# TODO: get the path from settings
cp ./.gitignore ~/.gitignore_global

if [[ $GIT_IS_AVAILABLE -eq 0 ]]
then
	git config --global core.excludesfile ~/.gitignore_global
else
	echo "Git binary not found in your path."
	exit 1;
fi

exit 0;
