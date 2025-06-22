{ lib, config, options, ...}: 
let cfg = config.locales; in {
  options = {
    locales.enable = lib.mkEnableOption "рашн локализейшн";
  };

  config = lib.mkIf cfg.enable {
  i18n.defaultLocale = "ru_RU.UTF-8";
  console = {
     font = "cyr-sun16";
     keyMap = "ruwin_alt_sh-UTF-8";
   };
  time.timeZone = "Europe/Moscow";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };
  };
}