#
# User configuration sourced by interactive shells
#

if [ -e ~/.debug ]; then
  alias dp=echo
else
  alias dp=true
fi
dp Debug Printing is Active and working!


dp Add my local binaries/scripts to the path
export PATH="$HOME/bin:$PATH"

dp Source zim
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


function LibLoad () {
  dp "Loading $1 Libraries...";
  for file in `find $2 -name "*.zsh" -maxdepth 1 2> /dev/null`; do
    dp $file
    . $file;
  done;
  dp "Done!"
}

unamestr=`uname`
LibLoad Common ~/lib
LibLoad $unamestr ~/lib/$unamestr

dp Cleanup.

unfunction LibLoad
unalias dp
