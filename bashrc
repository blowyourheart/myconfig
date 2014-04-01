#!/bin/sh

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

########### set flag when get into a git dir ######
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# User specific aliases and functions
export PS1='[\u@\h:\w]$(parse_git_branch)\$'
# alias ll='ls -lh'
# alias la='ls -a'
if [ -f ~/.alias ]; then
  . ~/.alias
fi

# 指示python不生成pyc文件
export PYTHONDONTWRITEBYTECODE=x
shopt -s cdspell cdable_vars

source /opt/local/etc/bash_completion.d/git-completion.bash

set -o vi
