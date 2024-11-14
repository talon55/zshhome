#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

if [[ -s "${ZDOTDIR:-$HOME}/.zsh/imports" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh/imports"
fi

# If anything needs to reload compinit
if [ "$load_compinit" = true ];then
  unset load_compinit # ensure we clean up when we're done
  autoload -Uz compinit && compinit -i
fi

##########################
# DON'T ADD TO THIS FILE #
##########################
