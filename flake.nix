{
  description = "Machine configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  # TODO: SSH keys
  outputs = { self, nixpkgs, hyprland }: {
    nixosConfigurations =
      let
        system = "x86_64-linux";
        specialArgs = { inherit hyprland; };
      in
      {
        ThinkPad-X220 = nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = (import ./modules "ThinkPad-X220");
        };
        MSI-PX60 = nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = (import ./modules "MSI-PX60");
        };
      };
  };
}
