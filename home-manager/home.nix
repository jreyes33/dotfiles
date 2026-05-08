{ config, pkgs, ... }:

{
  home.username = "jona";
  home.homeDirectory = "/home/jona";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    bat
    fzf
    mise
    ripgrep
    tealdeer
    zoxide
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    NCURSES_NO_UTF8_ACS = "1";
    VIRTUAL_ENV_DISABLE_PROMPT = "1";
  };

  home.file = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.gh.enable = true;
  programs.zoxide.enable = true;

  programs.alacritty = {
    enable = true;
    package = null;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Jonathan Reyes";
        email = "j@jreyes.org";
      };
      alias = {
        co = "checkout";
        ci = "commit";
        st = "status";
        br = "branch";
        hist = "log --graph --pretty=tformat:\"%C(yellow)%h%Creset %Cgreen%ar%Creset %C(bold blue)%an%Creset%C(red)%d%Creset %s\"";
        sminit = "submodule update --init --recursive";
        smupdate = "submodule update --recursive --remote";
        churn = "!f() { git log --all -M -C --name-only --format='format:' \"$@\" | sort | grep -v '^$' | uniq -c | sort | awk 'BEGIN {print \"count\tfile\"} {print $1 \"\t\" $2}' | sort -g; }; f";
      };
      core = {
        autocrlf = false;
        safecrlf = true;
        editor = "vim";
        excludesfile = "~/.cvsignore";
      };
      color = {
        diff = true;
        ui = true;
      };
      github.user = "jreyes33";
      init.defaultBranch = "main";
      push = {
        default = "upstream";
        autoSetupRemote = true;
      };
      pull.rebase = true;
    };
  };

  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    shortcut = "z";
    baseIndex = 1;
    escapeTime = 1;
    historyLimit = 100000;
    keyMode = "vi";
    mouse = true;
    extraConfig = ''
      set -g default-command 'exec "$SHELL"'

      set -g alternate-screen off
      set -g allow-passthrough on

      # Act like vim
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind -r C-h select-window -t :-
      bind -r C-l select-window -t :+

      # Resize panels
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # Set width and height for main-horizontal and main-vertical layouts
      setw -g main-pane-height 40
      setw -g main-pane-width 106

      # Window splitting
      bind c new-window -c '#{pane_current_path}'
      unbind %
      bind | split-window -h -c '#{pane_current_path}'
      unbind '"'
      bind - split-window -v -c '#{pane_current_path}'

      # Rebind suspend-client
      unbind C-z
      bind C-z send-prefix
      bind C-d suspend-client

      # Increase repeat time for repeatable commands
      set -g repeat-time 1000

      # Use 1-based window and panel numbers
      setw -g pane-base-index 1
      bind 0 select-window -t :10

      # Reload the config file
      bind r source-file ~/.tmux.conf \; display 'Reloaded ~/.tmux.conf'

      # Highlight window on new activity
      setw -g monitor-activity on
      set -g visual-activity on

      # Renumber windows when closing them (only works on tmux 1.7+)
      set -g renumber-windows on

      # Quickly switch to last window
      bind C-a last-window

      # Colors
      set -g status-style bg=blue,fg=black
      set -g pane-border-style fg=colour19
      set -g pane-active-border-style fg=blue
      set -g window-status-activity-style underscore
      set -g window-status-bell-style underscore
      set -g window-status-current-style bg=white

      # Status Bar
      set -g status-interval 1
      set -g status-justify centre
      set -g status-left '#S'
      set -g status-right ""
      set -g window-status-format '#I:#{b:pane_current_path}#F'
      set -g window-status-current-format '#I:#{b:pane_current_path}#F'

      # Update gnome-terminal title
      set -g terminal-overrides 'xterm*:XT:smcup@:rmcup@:colors=256'
      set -g set-titles on
      set -g set-titles-string '#T'

      # Clear history
      # http://stackoverflow.com/a/11525159
      bind C-k send-keys C-l \; run-shell 'sleep .3s' \; clear-history
    '';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "ls --color=auto";
      mlnl = "tldr --language es";
      bat = "bat --theme base16";
      help = "run-help";
    };

    history = {
      size = 10000;
      save = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreAllDups = true;
      ignoreSpace = true;
      share = true;
    };

    initContent = ''
      setopt prompt_subst
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
      (( ''${+aliases[run-help]} )) && unalias run-help
      autoload -Uz run-help

      PROMPT="%F{240}$(repeat $COLUMNS printf '·')%f"
      PROMPT+='%B%F{blue}%n%F{green}:%F{blue}%(3~|…|)%2~%F{green} ♞ %b%f'
    '';
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  };
}
