{ config, pkgs, lib, inputs, ... }:

{
    imports =
    [
        ../../homeManagerModules/git.nix
        ../../homeManagerModules/niri.nix
        ../../homeManagerModules/dankMaterialShell.nix
    ];

    home.username = "mira";
    home.homeDirectory = "/home/mira";

    home.packages = with pkgs; [
        chromium
        alacritty
        telegram-desktop
        element-desktop
        obsidian
        bat
        dysk
        tree
        btop
        fastfetch
        kiwix
        kiwix-tools
        prismlauncher
    ];

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
}
