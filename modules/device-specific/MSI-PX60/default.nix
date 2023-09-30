{ pkgs, ... }:

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
      efiSupport = true;
      theme = pkgs.nixos-grub2-theme;
      extraEntries = ''
        menuentry "Windows 10" --class windows --class os {
          insmod ntfs
          search --no-floppy --set=root --fs-uuid CE47-0680
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }
      '';
    };
  };

  networking = {
    hostName = "MSI-PX60";
  };
}
