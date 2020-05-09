export ZSH="/home/plasma/.oh-my-zsh"
ZSH_THEME="geoffgarside"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PROMPT="[%*] %{$fg[cyan]%}%n@%m%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) %($)"

test -r "~/.dir_colors" && eval $(gdircolors ~/.dir_colors)

alias vi="nvim"
alias vim="nvim"
alias ls="ls -G"
