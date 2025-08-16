{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

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

    pgcli

    gpu-screen-recorder
    ffmpeg-full

    doxygen

    gnumake

    gemini-cli

    blender-hip

    obsidian

    rustc
    cargo

    yarn

    btop

    pavucontrol

    nodejs

    home-manager

    go
    rustfmt
    rust-analyzer
    zig

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
    
    # HyprPanel
    hyprpanel
    wireplumber
    libgtop
    bluez
    bluez-tools
    dart-sass
    upower
    gvfs
    gtksourceview3
    libchamplain_libsoup3
    # *optional
    wf-recorder
    hyprpicker
    hyprsunset
    matugen

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
