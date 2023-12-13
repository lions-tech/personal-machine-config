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
    pam.services.swaylock.text = ''
      # Account management.
      account required pam_unix.so

      # Authentication management.
      auth sufficient pam_unix.so   likeauth try_first_pass
      auth required pam_deny.so

      # Password management.
      password sufficient pam_unix.so nullok sha512

      # Session management.
      session required pam_env.so conffile=/etc/pam/environment readenv=0
      session required pam_unix.so
    '';

    # userland niceness
    rtkit.enable = true;
  };

  networking.networkmanager.enable = true;

  xdg.portal.enable = true;

  /*  fonts = {
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
  };*/
}
