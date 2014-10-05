export TERM="xterm-256color"
export NCURSES_NO_UTF8_ACS=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="cloud"

# Set to this to use case-sensitive completion
CASE_SENSITIVE=true

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew brew-cask bundler command-not-found debian gem git gradle npm nyan pip rails rvm vagrant virtualenvwrapper)

# plugin options
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
# System specific
export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:/usr/local/bin:$PATH

unsetopt auto_name_dirs

# Allow Ctrl-s in vim
stty -ixon

# Some other useful aliases
alias gs='git status'
compdef _git gs=git-status
alias glr='git pull --rebase'
compdef _git glr=git-pull
alias o='open'
unalias ag

# Enable colors in ant
export ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"

################################################################################
### Additional scripts
################################################################################

# Z script (https://github.com/rupa/z)
export _Z_DATA=$HOME/.z/z-data
[[ -s $HOME/.z/z.sh ]] && source $HOME/.z/z.sh

# NVM
[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh

# virtualenwrapper
[[ -s /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# RVM
export PATH=$PATH:$HOME/.rvm/bin
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Enable `hitch` for pair programming commits
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
