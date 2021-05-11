#!/bin/sh
check_commands() {
	fail=0
	NEEDED=""
	NEEDED="${NEEDED} git"

	for NEEDS in "${NEEDED}"; do
		if [ ! $(command -v $NEEDS) ]; then
			echo "$NEEDS not found"
			fail=1
		fi
	done
	unset NEEDED
	if [ $fail -eq 1 ]; then
		# TODO: Ask/Attempt to fix mising software.
		exit 1
	fi
}


echo "New System Prep..."
check_commands

# Go Home
cd ~

# Pull dotfiles repo into $HOME
if [ -e .git ]; then
	echo "Home dir is a git repo"
else
	git init
	git remote add origin https://github.com/Plloi/dotfiles.git
	if ! git pull origin master
	then
		while true; do
		    read -r -n 1 -p "Fail to populate home dir from repo force? " yn
		    case $yn in
		        [Yy]* ) git reset --hard origin/master; break;;
		        [Nn]* ) exit;;
		        * ) echo "Please answer yes or no.";;
		    esac
		done
	fi
fi

# TODO: Define more setup scripts
echo "Running Setup Scripts...";
for file in $(find lib/Setup -maxdepth 1 -name "*.sh"); do
	$file;
done;
