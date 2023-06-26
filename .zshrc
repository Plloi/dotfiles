#
# User configuration sourced by interactive shells
#

set echo off
if [ -e ~/.debug ]; then
  set echo on
fi

echo Debug Printing is Active and working!

zstyle ':zim:ssh' ids 'id_rsa'
echo Add my local binaries/scripts to the path
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

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
  # Download zimfw script
  local -r ztarget=${ZIM_HOME}/zimfw.zsh
  if (
    command mkdir -p ${ZIM_HOME} || return 1
    local -r zurl=https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
    if (( ${+commands[curl]} )); then
      command curl -fsSL -o ${ztarget} ${zurl} || return 1
    elif (( ${+commands[wget]} )); then
      command wget -nv -O ${ztarget} ${zurl} || return 1
    else
      print -u2 -P '%F{red}x Either %Bcurl%b or %Bwget%b are required to download the Zim script.%f'
      return 1
    fi
  ); then
    print -PR "%F{green})%f Downloaded the Zim script to %B${ztarget}%b"
  else
    command rm -rf ${ZIM_HOME}
    print -u2 -PR "%F{red}x Could not download the Zim script to %B${ztarget}%b%f"
    return 1
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
