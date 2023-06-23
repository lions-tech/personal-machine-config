{
  imports = [ ./hardware-ThinkPad-X220.nix ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  networking = {
    hostName = "ThinkPad-X220";
    networkmanager.enable = true;
  };
}
