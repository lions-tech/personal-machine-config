{ pkgs, ... }:
{
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

  programs.zsh.enable = true;

  system.stateVersion = "23.05";
}
