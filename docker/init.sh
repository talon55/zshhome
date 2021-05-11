#!/usr/bin/env zsh

# Create symlinks if none exist
if [[ ! -s "${ZDOTDIR:-$HOME}/.zsh/docker/completion"  ]]; then
  mkdir "${ZDOTDIR:-$HOME}/.zsh/docker/completion"
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion \
    "${ZDOTDIR:-$HOME}/.zsh/docker/completion/_docker"
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion \
    "${ZDOTDIR:-$HOME}/.zsh/docker/completion/_docker-compose"
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.zsh-completion \
    "${ZDOTDIR:-$HOME}/.zsh/docker/completion/_docker-machine"
fi

# Clean out redundant zPrezto completion file
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/modules/completion/external/src/_docker-machine" ]]; then
  rm -f "${ZDOTDIR:-$HOME}/.zprezto/modules/completion/external/src/_docker-machine"
fi

# Add completion dir to path
fpath=($fpath "${ZDOTDIR:-$HOME}/.zsh/docker/completion/")

# Re-init autocomplete with new files
autoload -Uz compinit && compinit -i

# Set some options
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
