#
# User configuration sourced by interactive shells
#

# Add my local binaries/scripts to the path
export PATH="$HOME/bin:$PATH"

# Source zim
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
if [[ -s ${ZIM_HOME}/init.zsh ]]; then
  source ${ZIM_HOME}/init.zsh
else
  echo "No Zim Fixing this crap..."
  if (git clone --recursive https://github.com/zimfw/zimfw ~/.zim); then                                                                                                                              ~
    echo "Zim installed";
    source ${ZDOTDIR:-${HOME}}/.zlogin
    echo "Attempting to install 3rd party modules..."a
    zmodules-fetch.zsh
    source ~/.zshrc
    return 0
  else
    echo "GIR! What have you done?\!?"
  fi

fi

unamestr=`uname`

echo "Loading Common Libraries...";
for file in `find ~/lib -name "*.sh" -maxdepth 1 2> /dev/null`; do
	echo $file
	. $file;
done;
echo "Done!"

echo "Loading $unamestr Libraries";
for file in `find ~/lib/$unamestr -name "*.sh" -maxdepth 1 2> /dev/null`; do
	echo $file
	. $file;
done;
echo "Done!"
