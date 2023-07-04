{ pkgs, ... }:

{
  users.users.leonard = {
    isNormalUser = true;
    description = "leonard";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    initialPassword = "SetYourOwnPw";
    openssh.authorizedKeys.keyFiles = [ ];
  };

  users.users.manuel = {
    isNormalUser = true;
    description = "manuel";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "SetYourOwnPw";
  };
}
