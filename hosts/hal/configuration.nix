{ config, inputs, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../nixosModules/bootloader.nix
      ../../nixosModules/locale.nix
      ../../nixosModules/nvidia.nix
      ../../nixosModules/pipewire.nix
      ../../nixosModules/users.nix
    ];

  networking.hostName = "hal";
  networking.networkmanager.enable = true;
  
  hardware.bluetooth.enable = true;

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.displayManager.ly.enable = true;
  programs.niri.enable = true;
  programs.steam.enable = true;
  programs.zsh.enable = true;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  #nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.substituters = lib.mkForce [ "https://nixos-cache-proxy.cofob.dev" ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];
  
  environment.systemPackages = with pkgs; [
    gcc
    vim
    neovim
    wget
    git
    curl
    tmux
    zsh
    fzf
    zoxide
    ripgrep
    stow
    firefox
    xwayland-satellite
    fuzzel
    home-manager
    minimal-grub-theme
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-user-dirs
    kdePackages.dolphin
    kdePackages.plasma-workspace
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.05";
}
