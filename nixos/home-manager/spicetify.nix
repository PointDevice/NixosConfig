{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  # allow spotify to be installed if you don't have unfree enabled already
  #nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  #  "spotifywm"
  #];

  # import the flake's module for your system
  imports = [ spicetify-nix.homeManagerModule ];

  #home.packages = with pkgs; [
  #  spotifywm
  #];


  # configure spicetify :)
  programs.spicetify =
  {
    enable = true;
    theme = spicePkgs.themes.Dribbblish;
    colorScheme = "custom"; 
    #catppuccin-macchiato";

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
      (let
        dummy = builtins.toFile "dummy.js" "";
      in { 
        src = builtins.dirOf dummy;
        filename = builtins.baseNameOf dummy;
        experimentalFeatures = true;
      })
    ];
    customColorScheme = {
      text               = "CAD3F5";
      subtext            = "CAD3F5";
      sidebar-text       = "cad3f5";
      main               = "24273A";
      sidebar            = "1E2030";
      player             = "181926";
      card               = "363a4f";
      shadow             = "1E2030";
      selected-row       = "939ab7";
      button             = "8bd5ca";#"8087A2";
      button-active      = "8bd5ca";#"939AB7";
      button-disabled    = "6E738D";
      tab-active         = "363A4F";
      notification       = "363A4F";
      notification-error = "ED8796";
      misc               = "494d64";
    };
  };
} 
