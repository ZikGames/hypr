{config, pkgs, lib, ... }: 
let cfg = config.nh; in {
  options = {
    nh.enable = lib.mkEnableOption "[упрощённый nixos-rebuild]";
  };

  config = lib.mkIf cfg.enable {
      programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    #flake = "/home/axolotsh/hypr";
  };
};

}