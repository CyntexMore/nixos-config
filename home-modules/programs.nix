{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "CyntexMore";
    userEmail = "comebackyt20@gmail.com";
  };

  programs.kitty.enable = true;
}
