{ config, pkgs, ... }:
# TODO: auto-upgrade
{
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  networking = {
    hostName = "ThinkPad-X220";
    networkmanager.enable = true;
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  # used by PulseAudio
  security.rtkit.enable = true;

  # nix and packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment = {
    systemPackages = with pkgs; [
      nano
      vim
      wget
      curl
      traceroute
      gnomeExtensions.appindicator
      binutils
    ];

    pathsToLink = [ "/share/zsh" ];
  };

  services = {
    openssh = {
      enable = true;
      banner = "Unauthorised access prohibited!";
      # allow X11 forwarding
      forwardX11 = true;
    };
    # Enable CUPS to print documents.
    printing.enable = true;
  };

  system.stateVersion = "22.11";
}
