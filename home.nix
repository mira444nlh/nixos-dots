{ config, pkgs, inputs, ... }:

{
    imports =
    [
        inputs.niri.homeModules.niri
        inputs.dankMaterialShell.homeModules.dankMaterialShell.default
        inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
    ];
    home.username = "mira";
    home.homeDirectory = "/home/mira";

    home.packages = with pkgs; [
        #bat
    ];
    
    programs.git = {
        enable = true;
        userName = "mira444nlh";
        userEmail = "204510457+mira444nlh@users.noreply.github.com";
    };

    programs.niri.enable = true;

    programs.dankMaterialShell = {
        enable = true;
        niri = {
            enableKeybinds = true;
            enableSpawn = true;
        };
    };

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
}
