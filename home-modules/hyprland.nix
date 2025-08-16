{ pkgs, ... }:

{
  home.sessionVariables = {
    XCURSOR_THEME = "DMZ-Black";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "DMZ-Black";
    HYPRCURSOR_SIZE = "24";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };

  wayland.windowManager.hyprland.enable = true;
    
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "hu";
      
      follow_mouse = 1;

      sensitivity = -0.5;
      accel_profile = "flat";
    };

    device = {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    };

    decoration = {
      rounding = 12;
    };

    general = {
      gaps_in = 10;
      gaps_out = 20;
      
      border_size = 1;

      "col.active_border" = "rgba(a89984ff)";
      "col.inactive_border" = "rgba(a89984aa)";

      resize_on_border = false;

      allow_tearing = false;

      layout = "dwindle";
    };

    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "fcitx5"
      # "dunst"
      # "hyprpanel"
      "hyprpaper"
      "solaar"
    ];

    "$mainMod" = "SUPER";
    
    "$terminal" = "kitty";
    "$applaunch" = "rofi -show drun";
    "$browser" = "firefox";
    "$fileManager" = "thunar";

    animations = {
      enabled = true;

      bezier = [
        "majesticBezier, 0.15, 0.9, 0.25, 1.05"
	      "softFade, 0.4, 0, 0.2, 1"
      ];

       animation = [
         "windows, 1, 7, majesticBezier"
         "border, 1, 5, majesticBezier"
         "fade, 1, 5, softFade"
         "workspaces, 1, 6, majesticBezier"
       ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    bind = [
      "CTRL ALT, T, exec, $terminal"
      "$mainMod, D, exec, $applaunch"
      "$mainMod, F, exec, $browser"
      "$mainMod, Q, killactive"
      "$mainMod, M, exit"
      "$mainMod, E, exec, $fileManager"
      "CTRL SHIFT, SPACE, togglefloating"
      "$mainMod SHIFT, F, fullscreen"
      "$mainMod, P, pseudo"

      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      "bind = $mainMod SHIFT, S, exec, grimblast --freeze copysave area ~/Pictures/$(date +%Y-%m-%d_%H-%m-%s).png"
    ];

    bindm = [
      "bindm = $mainMod, mouse:272, movewindow"
      "bindm = $mainMod, mouse:273, resizewindow"
    ];

    windowrulev2 = [
      "suppressevent maximize, class:.*"
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };
}
