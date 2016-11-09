#!/usr/bin/env zsh

if [[ ! -s "${ZDOTDIR:-$HOME}/.zsh/docker/completion"  ]]; then
  mkdir "${ZDOTDIR:-$HOME}/.zsh/docker/completion"
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion \
    "${ZDOTDIR:-$HOME}/.zsh/docker/completion/_docker"
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion \
    "${ZDOTDIR:-$HOME}/.zsh/docker/completion/_docker-compose"
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.zsh-completion \
    "${ZDOTDIR:-$HOME}/.zsh/docker/completion/_docker-machine"
fi

fpath=($fpath "${ZDOTDIR:-$HOME}/.zsh/docker/completion/")

autoload -Uz compinit && compinit -i

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

