{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
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

  documentation = {
    dev.enable = true;
    man = {
      generateCaches = true;
      man-db.enable = true;
    };
  };
}
