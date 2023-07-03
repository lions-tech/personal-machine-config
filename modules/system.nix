{
  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = true;
      dates = "weekly";
      flake = "github:lions-tech/personal-machine-config";
      persistent = true;
      randomizedDelaySec = "5min";
    };

    stateVersion = "23.05";
  };

  console.font = "Lat2-Terminus16";

  security.sudo.execWheelOnly = true;

  networking.networkmanager.enable = true;
}
