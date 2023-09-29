hostName:
[
  ./german-locale.nix
  ./graphical.nix
  ./packages.nix
  ./services.nix
  ./sound.nix
  ./system.nix
  ./users.nix

  (./device-specific + ("/" + "${hostName}"))
]
