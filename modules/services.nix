{ pkgs, ... }:

{
  services = {
    openssh = {
      enable = true;
      banner = "Unauthorised access prohibited!";
      # allow X11 forwarding
      settings.X11Forwarding = true;
    };

    printing = {
      enable = true;
      cups-pdf.enable = true;
      drivers = with pkgs; [ brlaser ];
      extraConf = ''
        # prevent error "Unable locate printer" with dnssd printers
        BrowseLocalProtocols dnssd
      '';
    };

    system-config-printer.enable = true;

    # necessary to actually print,
    # otherwise CUPS throws error "Unable to locate printer"
    avahi = {
      enable = true;
      nssmdns = true;
    };

    power-profiles-daemon.enable = true;

    # battery info & stuff
    upower.enable = true;
  };

  hardware.printers = {
    ensureDefaultPrinter = "DCP-7030";
    ensurePrinters = [
      {
        name = "DCP-7030";
        description = "Brother DCP-7030";
        model = "drv:///brlaser.drv/br7030.ppd";
        deviceUri = "dnssd://Brother%20DCP-7030._pdl-datastream._tcp.local/";
        ppdOptions.pageSize = "A4";
      }
    ];
  };
}
