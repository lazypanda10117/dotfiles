ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[green]%}${HOST} %{$fg[yellow]%}%~% $(git_prompt_info)%{$reset_color%} '
