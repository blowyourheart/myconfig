# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export PS1='[\u@\h:\w]\$'
alias ll='ls -lh --color=auto'
alias la='ls -a --color=auto'

# 指示python不生成pyc文件
export PYTHONDONTWRITEBYTECODE=x
