#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'

export PS1='\[\033[1;34m\]\u\[\033[0;30m\]@\[\033[1;36m\]\w \[\033[1;32m\]$(__git_ps1) \[\033[1;35m\]\$ \[\033[0;30m\]'
alias __git_ps1="git branch 2>/dev/null | grep '^\*' | sed 's/^\* *//'"

alias vi='vim'

