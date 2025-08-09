{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # User packages
    fastfetch
    ripgrep
    fd
    eza
    bat
    feh
    mpv
    yt-dlp

    blender

    btop

    pavucontrol

    nodejs

    home-manager

    # Terminal
    kitty
    fzf
    starship
    grc

    # Hyprland ecosystem
    wl-clipboard
    waybar
    rofi
    mako
    swaylock-effects
    swaybg
    dunst
    grimblast
    nil
    hyprpaper
    networkmanagerapplet
    btop
    ddcutil
    quickshell

    # QT stuff
    libsForQt5.qt5ct
    libsForQt5.xwaylandvideobridge

    # Theming
    vimix-icon-theme
    bibata-cursors
    # ayu-theme-gtk
    gruvbox-gtk-theme

    vulkan-tools
  ];
}
