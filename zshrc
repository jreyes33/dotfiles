export TERM='xterm-256color'
export NCURSES_NO_UTF8_ACS=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


if [[ $(uname) == 'Linux' ]] ; then
  export LINUX=1
else
  export OSX=1
fi

export PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
export PATH=$HOME/bin:/usr/local/heroku/bin:/usr/local/sbin:$PATH
[[ $OSX == '1' ]] && export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH
export EDITOR=vim

setopt histignorealldups share_history prompt_subst
unsetopt auto_name_dirs
autoload -Uz compinit
compinit

alias please='sudo'
alias gs='git status'
alias glr='git pull --rebase'
alias gw='./gradlew'

[[ $OSX == '1' ]] && alias o='open'
[[ $LINUX == '1' ]] && alias o='xdg-open'

# Allow Ctrl-s and Ctrl-q in Vim
stty -ixon

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
PROMPT="%F{240}\$(repeat \$COLUMNS printf '·')%f"
PROMPT+='%B%F{blue}%n%F{green}:%F{blue}%(3~|…|)%2~%F{green} ♞ %b%f'

export _Z_DATA=$HOME/.z/z-data
[[ -s $HOME/.z/z.sh ]] && . $HOME/.z/z.sh

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

[[ -s /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh

export PATH=$PATH:$HOME/.rvm/bin
[[ -s $HOME/.rvm/scripts/rvm ]] && . $HOME/.rvm/scripts/rvm
