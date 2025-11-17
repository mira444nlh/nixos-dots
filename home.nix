{ config, pkgs, ... }:

{
    home.username = "mira";
    home.homeDirectory = "/home/mira";
    
    programs.git = {
        enable = true;
        userName = "mira444nlh";
        userEmail = "204510457+mira444nlh@users.noreply.github.com";
    };

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
}
