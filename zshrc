export TERM='xterm-256color'
export NCURSES_NO_UTF8_ACS=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=~/bin:~/snap/android-studio-canary/common/sdk/platform-tools:~/.deno/bin:~/.cargo/bin:~/.npm-global/bin:/snap/bin:$PATH
export EDITOR=vim
export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt histignorealldups hist_ignore_space share_history prompt_subst
unsetopt auto_name_dirs
# Allow Ctrl-s and Ctrl-q in Vim
stty -ixon
# Use emacs-style bindings
bindkey -e
# Fix delete, home, end, shift+tab keys
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[Z" reverse-menu-complete

# zsh help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help
autoload -Uz run-help

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
PROMPT="%F{240}\$(repeat \$COLUMNS printf '·')%f"
PROMPT+='%B%F{blue}%n%F{green}:%F{blue}%(3~|…|)%2~%F{green} ♞ %b%f'

BASE16_SHELL=~/.config/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && source "$BASE16_SHELL/profile_helper.sh"
base16_brewer
# base16_one-light

# Aliases
alias bat='bat --theme base16'
alias ls='ls --color=auto'
alias mlnl='tldr --language es'
alias tmux-bash='tmux start \; source ~/bin/use-bash.tmux'

# Completions
fpath+=~/.zfunc
[[ -s /opt/homebrew ]] && fpath+=/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit
compinit

command -v zoxide > /dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v mise > /dev/null 2>&1 && eval "$(mise activate zsh)"

# macOS only
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$HOMEBREW_PREFIX/opt/make/libexec/gnubin:~/Library/Python/3.12/bin:$PATH
fi
