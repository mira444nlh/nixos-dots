{ config, pkgs, lib, inputs, ... }:

{
    imports =
    [
        ../../homeManagerModules/git.nix
        ../../homeManagerModules/niri.nix
        ../../homeManagerModules/dankMaterialShell.nix
        ../../homeManagerModules/gtk.nix
    ];

    home.username = "mira";
    home.homeDirectory = "/home/mira";

    home.pointerCursor = {
        name = "Catppuccin-Mocha-Dark-Cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        size = 16;

        gtk.enable = true;
        x11.enable = true;
    };

    home.sessionVariables = {
        QT_STYLE_OVERRIDE = "kvantum";
        QT_QPA_PLATFORMTHEME="qt5ct";
        GTK_USE_PORTAL = 1;
    };

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
        blockbench
        haruna
        kdePackages.gwenview
        kdePackages.okular
        libreoffice
        hunspell
        hunspellDicts.ru_RU
        catppuccin-cursors
        catppuccin-papirus-folders
        papirus-folders
        kdePackages.qt6ct
        #libsForQt5.qt5ct
    ];

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
}
