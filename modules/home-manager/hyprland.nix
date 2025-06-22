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

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
  };
    home.packages = with pkgs; [
      fastfetch
      
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
};
}