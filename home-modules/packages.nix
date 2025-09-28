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

    # QT stuff
    libsForQt5.qt5ct
    kdePackages.xwaylandvideobridge

    # Theming
    vimix-icon-theme
    bibata-cursors
    vanilla-dmz
    kdePackages.breeze
    # ayu-theme-gtk
    gruvbox-gtk-theme
    # Fonts
    mplus-outline-fonts.githubRelease

    vulkan-tools

    mangohud

    # PGP
    gnupg
    pinentry-all
    kdePackages.kleopatra

    element-desktop

    # foot
    foot

    gamemode

    librewolf

    # Jellyfin
    jellyfin
    jellyfin-ffmpeg
    jellyfin-web
    jellyfin-rpc

    texlive.combined.scheme-full
  ];
}

