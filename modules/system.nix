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

  security = {
    sudo.execWheelOnly = true;
    # allow wayland lockers to unlock the screen
    pam.services.gtklock.text = "auth include login";

    # userland niceness
    rtkit.enable = true;
  };

  networking.networkmanager.enable = true;

  xdg.portal.enable = true;
}
