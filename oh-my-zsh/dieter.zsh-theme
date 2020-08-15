ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"

PROMPT='%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[green]%}${HOST} %{$fg[yellow]%}%~% %{$fg[green]%}$(git_prompt_info)%{$reset_color%} '
