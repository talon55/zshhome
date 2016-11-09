#!/usr/bin/env zsh

if [[ ! -s "${ZDOTDIR:-$HOME}/.zsh/docker/completion/_docker-compose"  ]]; then
  echo "Downloading docker autocompletion file"
  mkdir "${ZDOTDIR:-$HOME}/.zsh/docker/completion"
  curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > "${ZDOTDIR:-$HOME}/.zsh/docker/completion/_docker-compose"
fi

fpath=("${ZDOTDIR:-$HOME}/.zsh/docker/completion/" $fpath)

