{ pkgs }:
{
  users.users.leonard = {
    isNormalUser = true;
    description = "leonard";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    createHome = true;
    openssh.authorizedKeys.keyFiles = [ ];
  };
}