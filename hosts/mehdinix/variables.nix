{
  config,
  lib,
  ...
}: {
  imports = [
    # Choose your theme here:
    ../../themes/catppuccin.nix
  ];

  config.var = {
    hostname = "mehdinix";
    username = "mehdi";
    configDirectory =
      "/home/"
      + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "fr";

    location = "Liege";
    timeZone = "Europe/Brussels";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "fr_BE.UTF-8";


    git = {
      username = "MehdiBoustani";
      email = "sckapa.bst@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
