### personal-machine-config
Configuration for different computers on my home network.

### Using this configuration for a fresh install
1. Create bootable NixOS medium and boot from it
2. Connect to a network
3. Create the partitions as needed
4. mount the partitions as described here: https://nixos.org/manual/nixos/stable/index.html#sec-installation-manual-installing
5. Clone the repo
6. Add your own folder to `modules/device-specific/`
7. Add your own flake output to `flake.nix`
8. Install with `nixos-install --flake <flake uri>`
