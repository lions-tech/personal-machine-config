{ pkgs, ... }:

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

  fonts = {
    fonts = with pkgs; [
      # icon fonts
      material-symbols

      # normal fonts
      lexend
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto

      # nerdfonts
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];

    enableDefaultFonts = true;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [ "Roboto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Roboto" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
