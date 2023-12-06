{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      persistent = true;
      randomizedDelaySec = "15min";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      nano
      vim
      wget
      curl
      traceroute
      binutils
      git
    ];

    pathsToLink = [ "/share/zsh" ];
  };

  programs.zsh.enable = true;

  virtualisation.virtualbox.host.enable = true;
  # causes frequent recompilations
  #virtualisation.virtualbox.host.enableExtensionPack = true;

  documentation = {
    dev.enable = true;
    man = {
      generateCaches = true;
      man-db.enable = true;
    };
  };
}
