{config, pkgs, lib, ... }: 
let cfg = config.hyprland; in {
  options = {
    hyprland.enable = lib.mkEnableOption "WM";
  };

  config = lib.mkIf cfg.enable {
  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;

    settings = {
  exec-once = [
    "foot"
    "waybar"
  ];
  };
  };
    home.packages = with pkgs; [
      waybar
      wofi
      foot
      everforest-gtk-theme
    ];
  # home.file."~/.config/hypr/hyprland.conf".text = ''
  #   decoration {
  #     shadow_offset = 0 5
  #     col.shadow = rgba(00000099)
  #   }

  #   $mod = SUPER

  #   bindm = $mod, mouse:272, movewindow
  #   bindm = $mod, mouse:273, resizewindow
  #   bindm = $mod ALT, mouse:272, resizewindow
  # '';

  gtk = {
  enable = true;
  theme = {
    name = "everforest-gtk-theme";
    package = pkgs.everforest-gtk-theme; # If necessary
   };
  # iconTheme = {
  #   name = "Adwaita";
  #   package = pkgs.gnome.adwaita-icon-theme;
  # };
  # gtk3.extraConfig = "gtk-application-prefer-dark-theme=1";
  # gtk4.extraConfig = "gtk-application-prefer-dark-theme=1";
};
};
}