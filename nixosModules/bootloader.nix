{ config, pkgs, lib, ... }:

{
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      timeout = 15;
      theme = pkgs.minimal-grub-theme;
    };
  };
}
