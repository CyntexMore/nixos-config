{ pkgs, ... }:

{
  # We still enable the rofi program to install it and put it on the PATH
  programs.rofi.enable = true;

  # This is the new, correct method.
  # We are manually creating the config file at ~/.config/rofi/config.rasi
  xdg.configFile."rofi/config.rasi".text = ''
    /* This file is managed by home-manager */

    configuration {
      modi:                  "drun,run,window";
      show-icons:            true;
      terminal:              "kitty";
      drun-display-format:   "{name}";
    }
    
    * {
      /* Colors and Font */
      bg:               #282a36;
      fg:               #f8f8f2;
      accent:           #8be9fd;
      subtle:           #6272a4;

      background-color: @bg;
      text-color:       @fg;
      font:             "0xProto Nerd Font Mono 14";
    }

    window {
      location:     center;
      anchor:       center;
      width:        500px;
      border:       2px;
      border-color: @accent;
      padding:      16px;
    }

    mainbox {
      children: [ "inputbar", "listview" ];
      spacing:  12px;
    }

    inputbar {
      children:      [ "prompt", "entry" ];
      padding:       8px;
      border:        0 0 2px 0;
      border-color:  @accent;
    }

    prompt {
      enabled:          true;
      padding:          8px;
      background-color: @accent;
      text-color:       @bg;
    }

    entry {
      placeholder:       "Search...";
      placeholder-color: @subtle;
      padding:           8px;
    }

    listview {
      lines:    8;
      columns:  1;
      spacing:  8px;
      cycle:    true;
      dynamic:  true;
      layout:   vertical;
    }

    element {
      padding:       8px;
      border-radius: 0px;
    }

    /* --- THIS IS THE NEWLY ADDED/CORRECTED SECTION --- */
    /* Set default colors for all list items */
    element.normal.normal,
    element.alternate.normal {
      background-color: @bg;
      text-color:       @fg;
    }
    
    /* Set colors for the selected list item */
    element.selected.normal {
      background-color: @accent;
      text-color:       @bg;
    }
    /* --- END OF NEW SECTION --- */

    element-text, element-icon {
      vertical-align: 0.5;
    }
    
    element-icon {
      size: 1.2em;
      padding: 0 10px 0 0;
    }
  '';
}
