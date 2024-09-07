# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, username, hostname, userDesc, system, lib, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];
  
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./libvirt.nix
      ./modules/imports.nix
      #<home-manager/nixos>
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth = {
    enable = true;
    font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    themePackages = [ pkgs.catppuccin-plymouth ];
    theme = "catppuccin-macchiato";
  };

  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd 'sway'";
        user = username;
      };
    };
  };
  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };


  networking.hostName = hostname;#"PointAsusNixOS"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  boot.extraModprobeConfig = ''
    options snd-intel-dspcfg dsp_driver=1
  '';

  #programs.sway = {
  #  enable = true;
  #  package = pkgs.swayfx;
  #  extraOptions = ["--unsupported-gpu"];
  #  extraPackages = with pkgs; [
  #    autotiling
  #    swaylock-fancy
  #    swayidle
  #    sov
  #    waybar
  #  ];
  #};

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.keyboard.qmk.enable = true;

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

# Enable Theme
  console = {
    earlySetup = true;
    colors = [
      "24273a"
      "ed8796"
      "a6da95"
      "eed49f"
      "8aadf4"
      "f5bde6"
      "8bd5ca"
      "cad3f5"
      "5b6078"
      "ed8796"
      "a6da95"
      "eed49f"
      "8aadf4"
      "f5bde6"
      "8bd5ca"
      "a5adcb"
    ];
  };

  programs.steam.enable = true;

  programs = {
    zsh = {
      enable = true;
      ohMyZsh = {
        enable = true;
        custom = "/home/${username}/.config/zsh_custom";
        #theme = "catppuccin";  -Theme will be managed with Oh-My-Posh going forward
        plugins = [
          "sudo"
          "zoxide"
          "git"
          "tmux"
        ];
      };
      autosuggestions = {
        enable = true;
      };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username}= {
    isNormalUser = true;
    description = userDesc;
    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      "audio" 
      "video" 
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  #home.pointerCursor.gtk.enable = true;

  nixpkgs.config.allowUnfree = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  services.blueman.enable = true;

  #im not really huge on the idea of having flatpak on nix 
  #but man does dealing with discord's BS annoy me
  services.flatpak.enable = true; 

  services.resolved.enable = true;

  # List packages installed in system profile. To search, run:
  environment = {
    systemPackages = with pkgs; [
      #home-manager
      #---Main Interactive Stuff---
      alacritty
      mako
      wofi 
      ulauncher
      wl-clipboard
      wlogout
      rofimoji
      brightnessctl
      zoxide
      git
      tmux
      fzf
      oh-my-posh
      zellij
      jq
      killall
      pciutils
      lolcat

      gtk3
      stow

      kdePackages.ark

      #---Screenshot Stuffs---
      grim
      slurp
      swappy

      #---Monitor Stuff---
      neofetch
      htop
      btop
      kmon

      greetd.tuigreet

      #---Audio---
      pavucontrol
      pamixer
      playerctl

      #---Themes---
      numix-icon-theme-circle
      #colloid-icon-theme
      #catppuccin-gtk
      #(catppuccin-kvantum.override {
      #  accent = "Teal";
      #  variant = "Macchiato";
      #})
      #catppuccin-cursors.macchiatoTeal
      #catppuccin
      cudatoolkit

      #---Additional network Stuff---
      networkmanagerapplet
      wireguard-tools

      neovim 
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default
      wget
    ];
    variables = {
      ZOXIDE_CMD_OVERRIDE = "cd";
      ZSH_TMUX_AUTOSTART = "false";
      ZSH_TMUX_AUTOQUIT = "false";

      QT_QPA_PLATFORMTHEME = "gtk3";

      XCURSOR_SIZE = "24";

      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
  };

  #services.gvfs.enable = true;
  services.gvfs = {
    enable = true;
    package = pkgs.gnome.gvfs;
  };
  services.tumbler.enable = true;
  
  programs.noisetorch.enable = true;

  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  fonts.packages = with pkgs; [ 
    fira-code
    fira-code-symbols
    font-awesome
    liberation_ttf
    mplus-outline-fonts.githubRelease
    nerdfonts
    noto-fonts
    noto-fonts-emoji
    proggyfonts
  ];





  # Enable OpenGL
  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [ 
      intel-media-driver
      intel-vaapi-driver
      vaapiVdpau
      libvdpau-va-gl
      nvidia-vaapi-driver
      vulkan-validation-layers
    ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
   networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
