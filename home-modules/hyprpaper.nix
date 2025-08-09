{ pkgs, ... }:

{
  services.hyprpaper.enable = true;

  services.hyprpaper.settings = {
    preload = [ "/home/david/nixos-config/wallpaper/rocman.png" ];

    wallpaper = [
      "DP-1,/home/david/nixos-config/wallpaper/rocman.png"
      "HDMI-A-1,/home/david/nixos-config/wallpaper/rocman.png"
    ];
  };
}
