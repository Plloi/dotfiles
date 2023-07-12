export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
