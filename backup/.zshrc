
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' format '%d'
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose false
zstyle :compinstall filename '/home/jp/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


WORDCHARS='-'

bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;5~' delete-word
bindkey '^H' backward-kill-word
bindkey '^L' clear-screen

bindkey '^[[5~' history-beggining-search-backward
bindkey '^[[6~' history-beggining-search-forward



bindkey -e



alias on-lap="swaymsg output eDP-1 enable"
alias off-lap="swaymsg output eDP-1 disable"
alias zed="zedit"
alias dsway="dbus-launch sway"
alias ls="ls --color"
alias cls="clear"
alias py="python3"



export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export STARSHIP_CONFIG=~/.config/starship/starship.toml

setopt INC_APPEND_HISTORY SHARE_HISTORY

eval "$(starship init zsh)"
