{ pkgs, hyprland, ... }:

{
  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
  };

  #egl-wayland might be interesting for NVIDIA
  services = {
    xserver = {
      enable = true;
      # uses wayland by default
      displayManager.gdm.enable = true;
      # for wayland there is no libinput.conf, we let the user manage their touchpad
      desktopManager.gnome.enable = true;
      excludePackages = with pkgs; [ xterm ];
    };

    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  };

  # let users decide, which applications they wish to install
  environment.gnome.excludePackages = with pkgs; [
    baobab # disk usage analyzer
    epiphany # web browser
    evince # document viewer
    gnome-console
    gnome-text-editor
    gnome-tour
  ] ++ (with pkgs.gnome; [
    cheese # webcam tool
    eog # image viewer
    file-roller # archive tool
    gedit # text editor
    geary # mail client
    gnome-clocks
    gnome-calculator
    gnome-calendar
    gnome-contacts
    gnome-disk-utility
    gnome-maps
    gnome-music
    gnome-photos
    gnome-system-monitor
    totem # video player
    gnome-weather
    simple-scan
  ]);
}
