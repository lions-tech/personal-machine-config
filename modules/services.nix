{
  services = {
    openssh = {
      enable = true;
      banner = "Unauthorised access prohibited!";
      # allow X11 forwarding
      settings.X11Forwarding = true;
    };

    # Enable CUPS to print documents.
    printing.enable = true;
  };
}
