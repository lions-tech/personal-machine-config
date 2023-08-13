{
  description = "Machine configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };

  # TODO: SSH keys
  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      ThinkPad-X220 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = (import ./modules "ThinkPad-X220");
      };
      MSI-PX60 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = (import ./modules "MSI-PX60");
      };
    };
  };
}
