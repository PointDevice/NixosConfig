{config, flake-inputs, ...}:
let
  system = "x86_64-linux";

  userPkgs = import flake-inputs.nixpkgs-user 
  {
    inherit system;

    config = { 
      allowUnfree = true;
    };
  };
in 
{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with userPkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  programs.sway = {
    enable = true;
    package = userPkgs.swayfx;
    extraOptions = ["--unsupported-gpu"];
    wrapperFeatures.gtk = true;
    extraPackages = with userPkgs; [
      autotiling
      swaylock-fancy
      swayidle
      sov
      waybar
    ];
  }; 
}
