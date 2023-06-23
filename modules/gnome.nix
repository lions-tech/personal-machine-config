{ pkgs, ... }:
{
  environment.gnome.excludePackages = with pkgs; [
    gnome-console
    gnome-text-editor
  ] ++ (with pkgs.gnome; [
    eog # image viewer
    gedit # text editor
    geary # mail client
    cheese # webcam tool
    gnome-maps
    simple-scan
    gnome-music
    gnome-weather
    gnome-contacts
    gnome-calendar
  ]);

  #egl-wayland might be interesting for NVIDIA
  services.xserver = {
    enable = true;
    # uses wayland by default
    displayManager.gdm.enable = true;
    # for wayland there is no libinput.conf
    desktopManager.gnome = {
      enable = true;
      # tap-button-map:
      # 1 finger = left; 2 fingers = right; 3 fingers = middle
      extraGSettingsOverrides = ''
        [org.gnome.desktop.peripherals.touchpad]
        click-method="fingers"
        disable-while-typing=true
        natural-scroll=true
        tap-and-drag=true
        tap-button-map="lrm"
        tap-to-click=true
        two-finger-scrolling-enabled=true
      '';
    };
  };
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}
