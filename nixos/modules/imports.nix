{ config, pkgs, username, hostname, system, ... }:

{
  imports =
    [ 
      ./userApps.nix
      ./userSway.nix
      #./nbfc.nix
    ];
}
