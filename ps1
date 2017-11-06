#!/usr/bin/env bash

# colors
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;37m\]"
NO_COLOR="\[\033[0;00m\]"

# fetch current ruby version
__ruby_ps1 () {
  if command -v ruby > /dev/null; then
    printf "$1" "$(ruby -v | awk '{ print $2 }')"
  else
    printf "$1" "$(rbenv version-name)"
  fi
}

#if ! command -v __git_ps1 > /dev/null; then
#  __git_ps1 () {
#    :
#  }
#fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# ~/Developer (1.9.3-p327) (master)
# ¥
PS1="\h$\w $RED\$(__ruby_ps1 '(%s)') $GREEN\$(parse_git_branch)\n${WHITE}¥$NO_COLOR "