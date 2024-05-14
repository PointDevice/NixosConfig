{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    home-manager.url = "github:nix-community/home-manager/master";
    nixpkgs-user.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, spicetify-nix, nixpkgs-user, ... }:
  let
    system = "x86_64-linux";
    
    #user Vars
    username = "point";
    hostname = "PointNixOSlt";


    pkgs = import nixpkgs {
      inherit system;

      config = { 
        allowUnfree = true;
      };
    };
    #userPkgs = import nixpkgs-user 
    #{
    #  inherit system;

    #  config = { 
    #    allowUnfree = true;
    #  };
    #};
  in
  {
  
  nixosConfigurations = {
    ${hostname} = nixpkgs.lib.nixosSystem { 
      specialArgs = { flake-inputs = inputs; inherit system; inherit username; inherit hostname; };


      modules = [ 
      ./nixos/configuration.nix
      home-manager.nixosModules.home-manager {
        home-manager.extraSpecialArgs = {
          inherit spicetify-nix;
        };
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.${username} = import ./nixos/home.nix;
      }
      ];

    };
  };

  };
}
