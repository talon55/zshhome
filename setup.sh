#!/usr/bin/env zsh

# Pull down the Prezto repo from Github
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Autogenerate symlinks to default rcfiles
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Array of custom rcfiles
rcfiles=(zpreztorc zprofile zshrc tmux.conf vim)

# Replace autogenerated links with symlinks to custom rcfiles
for file in $rcfiles; do
  rm -f "${ZDOTDIR:-$HOME}/.$file"
  ln -s "${ZDOTDIR:-$HOME}/.zsh/$file" "${ZDOTDIR:-$HOME}/.$file"
done

# Create symlink to custom prompt theme
ln -s "${ZDOTDIR:-$HOME}/.zsh/prompt_talon_setup" \
  "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/functions/prompt_talon_setup"

# Vim-specific setup
ln -s "${ZDOTDIR:-$HOME}/.zsh/vim/vimrc" "${ZDOTDIR:-$HOME}/.vimrc"
zsh "${ZDOTDIR:-$HOME}/.zsh/vim/setup.sh"

# OSX-specific setup
if [[ "$(uname -s)" == 'Darwin'  ]]; then
  brew install reattach-to-user-namespace
fi

# WSL-specific setup
# WSL detection based on https://superuser.com/a/1749811
if [[ -f "/proc/sys/fs/binfmt_misc/WSLInterop"]]; then
  sudo add-apt-repository ppa:wslutilities/wslu
  sudo apt update
  sudo apt install wslu
fi
