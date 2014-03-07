# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
CASE_SENSITIVE=true

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(command-not-found debian gem git npm nyan pip rails rvm tmux vagrant virtualenvwrapper)

# plugin options
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
export TERM="xterm-256color"
export NCURSES_NO_UTF8_ACS=1

unsetopt auto_name_dirs

# Allow Ctrl-s in vim
alias vim="stty stop '' -ixoff ; vim"
# "Frozing" tty, so after any command terminal settings will be restored
ttyctl -f

# Some other useful aliases
alias gs='git status'
compdef _git gs=git-status
alias o='xdg-open'

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
