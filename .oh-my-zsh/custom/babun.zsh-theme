local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"

# PROMPT='%{$fg[red]%}{ %h } \
PROMPT=' \
%{$fg[blue]%}{ %c } \
%{$fg[green]%}$( git rev-parse --abbrev-ref HEAD 2> /dev/null || arc info 2> /dev/null | grep branch  || echo ""  )%{$reset_color%}\
$(parse_git_dirty) %{$fg[white]%}%(!.#.»)%{$reset_color%} '

PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

# RPS1='%{$fg[blue]%}%~%{$reset_color%} ${return_code} %{$fg[yellow]%}{node-$(nvm_prompt_info)}%{$reset_color%}'
RPS1='%{$fg[blue]%}%~%{$reset_color%} ${return_code} %{$fg[yellow]%}{$(date +%T)}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}:: %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"


# /home/tzota/.oh-my-zsh/themes/mira.zsh-theme - посмотреть вывод версии ноды
# local nvm_node=''
# nvm_node='%{$fg[green]%}‹node-$(nvm_prompt_info)›%{$reset_color%}'
