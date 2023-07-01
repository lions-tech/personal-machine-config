{ pkgs, ... }:
{
  # nix and packages
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
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

  system.stateVersion = "23.05";
}
