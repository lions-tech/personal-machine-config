{ pkgs, ...}:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
      theme = pkgs.nixos-grub2-theme;
    };
  };

  networking = {
    hostName = "MSI-PX60";
  };
}
