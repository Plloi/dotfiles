#!/bin/zsh
zmodload zsh/mapfile
pushd ${ZIM_HOME}/modules
pwd

local zimmodfile=~/.zmodules
local zimmodules=( "${(f)mapfile[$zimmodfile]}" )
local zmodule


for zmodule in $zimmodules; do
  zmodule=("${(@s/ /)zmodule}") 
  if [[ ! -d ${ZIM_HOME}/modules/${zmodule[1]} ]]; then
    print "${zmodule[1]} Not found, attempting look and install..."
    if (( ${+zmodule[2]} )); then
      git clone --recursive ${zmodule[2]} ${zmodule[1]}
    else
      print "${zmodule[1]} has no repository defined."
    fi
  else
    #TODO Update Module
    print "${zmodule[1]} Exists, skpping..."
  fi
done
popd
