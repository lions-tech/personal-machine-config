hostName:
[
  ./german-locale.nix
  ./gnome.nix
  ./packages.nix
  ./services.nix
  ./sound.nix
  ./system.nix
  ./users.nix

  (./device-specific + ("/" + "${hostName}.nix"))
]
