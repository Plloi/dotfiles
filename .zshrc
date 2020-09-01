#
# User configuration sourced by interactive shells
#

set echo off
if [ -e ~/.debug ]; then
  set echo on
fi

echo Debug Printing is Active and working!


echo Add my local binaries/scripts to the path
export PATH="$HOME/bin:$PATH"

if [[ -d "$HOME/go/bin" ]]; then
  export PATH="$HOME/go/bin:$PATH"
fi

if [[ -s ${ZIM_HOME}/zimfw.zsh ]]; then
  if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
    # Update static initialization script if it's outdated, before sourcing it
    source ${ZIM_HOME}/zimfw.zsh init -q
  fi
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


function LibLoad () {
  echo "Loading $1 Libraries...";
  for file in `find $2 -name "*.zsh" -maxdepth 1 2> /dev/null`; do
    echo $file
    . $file;
  done;
  echo "Done!"
}

unamestr=`uname`
LibLoad Common ~/lib
LibLoad $unamestr ~/lib/$unamestr

echo Cleanup.

unfunction LibLoad
