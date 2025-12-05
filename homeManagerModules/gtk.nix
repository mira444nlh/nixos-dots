{ config, lib, pkgs, inputs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "Catppuccin-Mocha-Standard-Mauve-Dark";
    };

    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
      name = lib.mkForce "Papirus-Dark";
    };
  };
}
