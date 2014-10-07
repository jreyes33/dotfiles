export TERM='xterm-256color'
export NCURSES_NO_UTF8_ACS=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH=$HOME/.oh-my-zsh
ZSH_THEME='cloud'
CASE_SENSITIVE=true
COMPLETION_WAITING_DOTS=true

plugins=(brew brew-cask bundler command-not-found debian gem git gradle npm nyan pip rails rvm vagrant)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

. $ZSH/oh-my-zsh.sh

if [[ $(uname) == 'Linux' ]] ; then
  export LINUX=1
else
  export OSX=1
fi

export PATH=$PATH:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
export PATH=/usr/local/heroku/bin:$PATH
[[ $OSX == '1' ]] && export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:/usr/local/bin:$PATH
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'

unsetopt auto_name_dirs
unalias ag
alias gs='git status'
compdef _git gs=git-status
alias glr='git pull --rebase'
compdef _git glr=git-pull
alias gsinit='git submodule update --init --recursive'
alias gspull='git submodule foreach git pull origin master'
[[ $OSX == '1' ]] && alias o='open'
[[ $LINUX == '1' ]] && alias o='xdg-open'

# Allow Ctrl-s in vim
stty -ixon

export _Z_DATA=$HOME/.z/z-data
[[ -s $HOME/.z/z.sh ]] && . $HOME/.z/z.sh

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

[[ -s /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh

export PATH=$PATH:$HOME/.rvm/bin
[[ -s $HOME/.rvm/scripts/rvm ]] && . $HOME/.rvm/scripts/rvm
