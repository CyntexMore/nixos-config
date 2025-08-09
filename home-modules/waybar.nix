{ pkgs, ... }:

# This configuration creates a "split" Waybar look with a Gruvbox Dark theme.
# It includes modules for workspaces, window title, system tray, backlight (brightness),
# audio, network, CPU, memory, and a clock.

# --- IMPORTANT: NIXOS CONFIGURATION NOTES ---
# You need to add the following packages and settings to your NixOS configuration
# for all features to work.
#
# In home.nix or equivalent:
# home.packages = with pkgs; [
#   ddcutil            # For external monitor brightness control
#   pavucontrol        # For audio control on-click
#   networkmanagerapplet # Provides nm-connection-editor for network management
#   btop               # For system monitoring on-click
#   (nerdfonts.override { fonts = [ "0xProto" ]; })
# ];
#
# In configuration.nix:
# # Create the i2c group so ddcutil can use it
# users.groups.i2c = {};
# # Add your user to the (now existing) i2c group
# users.users.david.extraGroups = [ "i2c" ]; # Replace 'david' with your username
# # Load the necessary kernel module
# boot.kernelModules = [ "i2c-dev" ];
# -----------------------------------------

{
  programs.waybar.enable = true;

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 40;
      spacing = 0;

      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "tray" "custom/brightness" "pulseaudio" "network" "cpu" "memory" ];

      # --- MODULE CONFIGURATIONS ---

      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
          "1" = ""; "2" = ""; "3" = ""; "4" = ""; "5" = "";
          "urgent" = "";
          "default" = "";
        };
        on-scroll-up = "hyprlandmsg dispatch workspace e+1";
        on-scroll-down = "hyprlandmsg dispatch workspace e-1";
      };

      "hyprland/window" = {
        format = "{}";
        max-length = 35;
        separate-outputs = true;
      };

      "tray" = {
        icon-size = 18;
        spacing = 10;
      };

      "clock" = {
        format = " {:%H:%M}";
        format-alt = " {:%A, %d %B}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt>{calendar}</tt>";
        on-click = "mode";
      };

      # --- CUSTOM BRIGHTNESS MODULE FOR EXTERNAL MONITORS ---
      "custom/brightness" = {
        # **FIXED**: Using bus 14 for your DP-1 monitor
        exec = "ddcutil --bus 14 getvcp 10 | awk -F 'current value = |, ' '{print $2}'";
        format = "󰃠 {}%";
        interval = 10; # Check brightness every 10 seconds
        on-scroll-up = "ddcutil --bus 14 setvcp 10 + 5";
        on-scroll-down = "ddcutil --bus 14 setvcp 10 - 5";
        tooltip = true;
      };

      "cpu" = {
        format = " {usage}%";
        tooltip = true;
        interval = 1;
        on-click = "${pkgs.btop}/bin/btop";
      };

      "memory" = {
        format = "󰍛 {used:0.1f}G";
        interval = 1;
        on-click = "${pkgs.btop}/bin/btop";
      };

      "network" = {
        format-wifi = "  {essid}";
        format-ethernet = "󰈀 {ifname}";
        format-disconnected = "󰖪 Disconnected";
        tooltip-format = "{ifname} via {gwaddr} ";
        on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
      };

      "pulseaudio" = {
        format = "{icon} {volume}%";
        format-muted = "󰖁 Muted";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
        };
        on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
        on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
      };
    };
  };

  programs.waybar.style = ''
    /* --- GRUVBOX DARK COLORS --- */
    @define-color bg #1d2021;
    @define-color bg-alt #32302f;
    @define-color fg #ebdbb2;
    @define-color red #cc241d;
    @define-color green #98971a;
    @define-color yellow #d79921;
    @define-color blue #458588;
    @define-color purple #b16286;
    @define-color aqua #689d6a;
    @define-color gray #a89984;
    @define-color orange #d65d0e;

    /* --- GLOBAL STYLES --- */
    * {
      border: none;
      border-radius: 0; /* We will apply radius to modules individually */
      font-family: "0xProto Nerd Font Mono", monospace;
      font-size: 15px;
      min-height: 0;
    }

    window#waybar {
      background: transparent; /* Makes the bar itself invisible */
      color: @fg;
    }

    /* --- MODULE STYLES --- */
    #workspaces,
    #window,
    #clock,
    #custom-brightness,
    #cpu,
    #memory,
    #network,
    #pulseaudio,
    #tray {
      background-color: @bg-alt;
      padding: 5px 15px;
      margin: 4px 0px;
      border-radius: 12px;
      border: 1px solid @gray;
    }

    /* Add horizontal spacing between modules */
    #workspaces, #window { margin-right: 8px; }
    #memory { margin-right: 8px; }
    #cpu { margin-right: 8px; }
    #network { margin-right: 8px; }
    #pulseaudio { margin-right: 8px; }
    #custom-brightness { margin-right: 8px; }

    /* --- WORKSPACES --- */
    #workspaces {
      padding-left: 10px;
      padding-right: 5px;
      background-color: @bg;
    }
    #workspaces button {
      padding: 0 5px;
      color: @gray;
      transition: all 0.3s ease;
    }
    #workspaces button:hover {
      color: @fg;
      background-color: @bg-alt;
      border-radius: 8px;
    }
    #workspaces button.active {
      color: @aqua;
      font-weight: bold;
    }
    #workspaces button.urgent {
      color: @red;
    }

    /* --- INDIVIDUAL MODULE COLORS --- */
    #clock { color: @purple; font-weight: bold; }
    #custom-brightness { color: @yellow; }
    #pulseaudio { color: @blue; }
    #network { color: @aqua; }
    #cpu { color: @orange; }
    #memory { color: @green; }

    /* --- TOOLTIP STYLES --- */
    tooltip {
      background-color: @bg;
      border: 1px solid @purple;
      border-radius: 8px;
    }
    tooltip label {
      color: @fg;
    }
  '';
}

