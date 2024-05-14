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
#in theory, the nixpkgs-user input will be updated regularly
#allowing these packages to stay up to date 
  users.users.point.packages = with userPkgs; [
    firefox
    floorp
    vesktop
    kate
    moonlight-qt
    cava
    protonup-qt
    alvr
    gimp
    strawberry
    filelight
    lutris
    hugo
    qownnotes
    libreoffice-qt
    exercism
    ghidra
  ];
}
