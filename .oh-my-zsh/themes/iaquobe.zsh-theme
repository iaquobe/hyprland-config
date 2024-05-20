
PROMPT="%(?:%{$fg_bold[cyan]%}➜ :%{$fg_bold[magenta]%}➜ )"
PROMPT+="%{$fg[magenta]%}%T %{$fg[cyan]%}%c%{$reset_color%} "
PROMPT+='$(git_prompt_info) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%} %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} 󰚽"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%} 󰄳"
#󰄳󰅙󰆗󰆕󱕝󰞑󰝧󰚽
