hostName:
[
  ./german-locale.nix
  ./gnome.nix
  ./packages.nix
  ./services.nix
  ./sound.nix
  ./users.nix

  (./device-specific + ("/" + "${hostName}.nix"))
]
