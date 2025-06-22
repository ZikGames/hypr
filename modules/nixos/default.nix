{pkgs, lib, config, ...}: {
imports = [
  ./locales.nix
  ./network.nix
 ];
 locales.enable = true;
 network.enable = true;
}