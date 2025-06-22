{pkgs, lib, config, ...}: {
imports = [
  ./hyprland.nix
  ./zsh.nix
  ./nh.nix
 ];
 hyprland.enable = true;
 zsh.enable = true;
 nh.enable = true;
}