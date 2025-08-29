{ config, pkgs, ... }:

{
  home.username = "david";
  home.homeDirectory = "/home/david";

  imports = [
    ./env.nix
    ./programs.nix
    ./packages.nix
    ./nixvim.nix
    ./hyprland.nix
    ./kitty.nix
    ./vesktop.nix
    # ./waybar.nix
    ./rofi.nix
    ./hyprpaper.nix
    ./gtk.nix
    ./qt.nix
    ./fish.nix
    ./quickshell.nix
    ./hyprpanel.nix
    ./emacs.nix
  ];

  home.stateVersion = "25.05";
}
