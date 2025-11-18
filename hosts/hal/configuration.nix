{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hal";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  hardware.bluetooth.enable = true;
  
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Nvidia
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false;

  services.displayManager.ly.enable = true;
  #programs.niri.enable = true;  
  programs.zsh.enable = true;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  users.users.mira = {
    isNormalUser = true;
    description = "mira";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  users.defaultUserShell = pkgs.zsh;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #nix.settings.substituters = lib.mkForce [ "https://nixos-cache-proxy.cofob.dev" ];

  environment.systemPackages = with pkgs; [
    gcc
    vim
    neovim
    wget
    git
    curl
    alacritty
    tmux
    zsh
    fzf
    zoxide
    ripgrep
    fastfetch
    stow
    firefox
    chromium
    telegram-desktop
    element-desktop
    xwayland-satellite
    fuzzel
    home-manager
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.05";

}
