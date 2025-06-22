{ lib, config, options, ...}: 
let cfg = config.network; in {
  options = {
    network.enable = lib.mkEnableOption "хз, в будущем думаю пригодится";
  };

  config = lib.mkIf cfg.enable {
     networking = {
      hostName = "nix-axolotsh";
     };

     };
}