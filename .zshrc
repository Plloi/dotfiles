#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# fiexport ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh

export PATH="$HOME/bin:$PATH"

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
