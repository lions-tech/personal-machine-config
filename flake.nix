{
  description = "Machine configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  # TODO: SSH keys
  outputs = { self, nixpkgs, hyprland }: {
    nixosConfigurations = {
      ThinkPad-X220 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = (import ./modules "ThinkPad-X220");
        specialArgs = { inherit hyprland; };
      };
    };
  };
}
