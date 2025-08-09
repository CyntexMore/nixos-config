{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # imports = [ ];

  environment.variables = {
    EDITOR = "nvim";
  };

  boot.loader.systemd-boot.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Budapest";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hu_HU.UTF-8";
    LC_IDENTIFICATION = "hu_HU.UTF-8";
    LC_MEASUREMENT = "hu_HU.UTF-8";
    LC_MONETARY = "hu_HU.UTF-8";
    LC_NAME = "hu_HU.UTF-8";
    LC_NUMERIC = "hu_HU.UTF-8";
    LC_PAPER = "hu_HU.UTF-8";
    LC_TELEPHONE = "hu_HU.UTF-8";
    LC_TIME = "hu_HU.UTF-8";
  };

  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-mozc
      fcitx5-nord
    ];
    # Suppress warning about environment related to fcitx5
    fcitx5.waylandFrontend = true;
  };

  services.xserver.enable = true;

  # services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;

  services.displayManager.ly.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };
  
  services.xserver.xkb = {
    layout = "hu";
    variant = "";
  };

  console.keyMap = "hu";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      eza = "eza --icons";
      tree = "eza --icons --tree";
    };
  };

  users.groups.i2c = {};

  users.users.david = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "david";
    extraGroups = [ "networkmanager" "wheel" "i2c" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
    # Remove this when going bare metal
    initialPassword = "TestingPassword";
  };

  boot.kernelModules = ["i2c-dev"];
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  networking.firewall.allowedTCPPorts = [ 8000 ];
  networking.firewall.allowedUDPPorts = [ 8000 ];

  environment.systemPackages = with pkgs; [
    vim
    eza
    wget
    git
    kitty
    rofi
    vesktop
    keepassxc
    xfce.thunar
    solaar
  ];

  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-extension-layer
    ];
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  hardware.logitech.wireless.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
} 
