#!/bin/sh
prompt_to_link()
{
	echo "Link Windows User Directories to Linux Equivalents? [y]es/[n]o"
	while true; do
		local yn
	    read yn
	    case $yn in
	        [Yy]* ) link_it_up; break;;
	        [Nn]* ) exit;;
	        * ) echo "Please answer yes or no.";;
	    esac
	done
}

link_it_up(){
	local winhome
	if [ $(command -v cygpath) ]; then 
		winhome=$(cygpath $USERPROFILE)
	else
		winhome=$(cmd.exe /c "<nul set /p=%UserProfile%" | sed -e 's|^\(\w\):|/mnt/\L\1|g' -e 's|\\|/|g')
		if [ ! -d $winhome ]; then
			echo "No Windows profile found"
			exit
		fi
	fi


	for dir in Desktop Documents Music Pictures Downloads Videos; do
		local target="$winhome/$dir"
		if [ -L $dir ]; then
			if [ $(readlink $dir) = $target ]; then
				continue;
			else
				echo "$dir is currently linked to $(readlink $dir)..."
				echo "Replacing exiting link..."
				rm $dir
			fi
		fi
		if [ -e $dir ]; then
			echo "$dir Exists"
			if [ -z "$(ls -A $dir)" ]; then
				rm -d $dir;
			else
				echo "$dir is not empty, no action taken"
				continue;
			fi
			echo "Failed to process $dir"
			continue;
		fi
		echo "Linking $dir to windows"
		ln -s $target $dir
	done
}

prompt_to_link
