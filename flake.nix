{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    dgop = {
        url = "github:AvengeMedia/dgop";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
        url = "github:AvengeMedia/DankMaterialShell";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.dgop.follows = "dgop";
    };

    niri = {
        url = "github:sodiboo/niri-flake";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, dgop, dankMaterialShell, niri, ... } @ inputs:
  {
    nixosConfigurations.hal = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
            ./hosts/hal/configuration.nix
            home-manager.nixosModules.default
            {
                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    users.mira = import ./hosts/hal/home.nix;
                    extraSpecialArgs = {inherit inputs;};
                };
            }
        ];
    };
  };
}
