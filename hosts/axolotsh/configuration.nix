{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./home-integration.nix
      ./main-user.nix
    ];

  nix.settings.auto-optimise-store = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  main-user.enable = true;
  main-user.userName = "axolotsh";
  
  virtualisation.virtualbox.guest = {
    enable = true;
  };
  #security.pam.services.swaylock = {};

system.stateVersion = "25.05";

}