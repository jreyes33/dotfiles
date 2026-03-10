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
    ripgrep
    tealdeer
    zoxide
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "vim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    NCURSES_NO_UTF8_ACS = "1";
  };

  home.shellAliases = {
    ls = "ls --color=auto";
    mlnl = "tldr --language es";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.gh.enable = true;
  programs.zoxide.enable = true;
  programs.alacritty = {
    enable = true;
    package = null;
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  };
}
