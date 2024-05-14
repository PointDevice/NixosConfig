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
  programs.sway = {
    enable = true;
    package = userPkgs.swayfx;
    extraOptions = ["--unsupported-gpu"];
    extraPackages = with userPkgs; [
      autotiling
      swaylock-fancy
      swayidle
      sov
      waybar
    ];
  }; 
}
