{ config, pkgs, lib, ... }:

{
  users.users.mira = {
    isNormalUser = true;
    description = "mira";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
