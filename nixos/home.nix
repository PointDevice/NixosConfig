#UNUSED DO NOT EDIT

{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "point";
  home.homeDirectory = "/home/point";
  
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports =[
    ./home-manager/imports.nix
  ];
  
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

  ];
  # home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/point/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  #home.pointerCursor.gtk.enable = true;
  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Macchiato-Teal-Cursors";
    package = pkgs.catppuccin-cursors.macchiatoTeal;
    size = 16;
  }; 

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Teal-Dark";
      package = (pkgs.catppuccin-gtk.override {
        accents = [ "teal" ]; # You can specify multiple accents here to output multiple themes
        size = "compact";
        tweaks = [ "rimless" ]; # You can also specify multiple tweaks here
        variant = "macchiato";
      });
    };
    iconTheme = {
        #name = "Colloid-dark-teal";
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
       # (pkgs.colloid-icon-theme.override {
       #   colorVariants = ["teal"];
       #   schemeVariants = ["all"];
       # });
      };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
