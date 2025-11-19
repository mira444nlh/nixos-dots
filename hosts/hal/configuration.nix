{ config, pkgs, lib, ... }:

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
  #programs.niri.enable = true;  
  programs.steam.enable = true;
  programs.zsh.enable = true;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.substituters = lib.mkForce [ "https://nixos-cache-proxy.cofob.dev" ];
  
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
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.05";
}
