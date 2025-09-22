{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };
    iconTheme = {
      name = "Vimix";
      package = pkgs.vimix-icon-theme;
    };
    cursorTheme = {
      name = "DMZ-Black";
      package = pkgs.vanilla-dmz;
    };
  };
}
