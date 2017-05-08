export TERM='xterm-256color'
export NCURSES_NO_UTF8_ACS=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$HOME/bin:$HOME/.cargo/bin:$PATH
export EDITOR=vim
export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt histignorealldups share_history prompt_subst
unsetopt auto_name_dirs
autoload -Uz compinit
fpath+=~/.zfunc
compinit
bindkey -e
# Allow Ctrl-s and Ctrl-q in Vim
stty -ixon

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
PROMPT="%F{240}\$(repeat \$COLUMNS printf '·')%f"
PROMPT+='%B%F{blue}%n%F{green}:%F{blue}%(3~|…|)%2~%F{green} ♞ %b%f'

export _Z_DATA=$HOME/.z/z-data
[[ -s $HOME/.z/z.sh ]] && . $HOME/.z/z.sh

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
