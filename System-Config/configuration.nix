#./System-Config/configuration.nix
{pkgs, config, lib, inputs, ...}:
{
  #imports: hardware config & home-manager module
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
  ];

  #Home-Manager declaration
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.zack = {
      imports = [../Home-Manager/defaults.nix];
    };
  };

  environment.systemPackages = with pkgs; [
    #gui programs
    kdePackages.dolphin
    libreoffice
    onlyoffice-desktopeditors
    firefox
    sqlitebrowser
    vlc
    kitty
    virt-manager
    krita
    proton-pass
    feishin
    telegram-desktop
    planify
    mkvtoolnix
    picard
    vscodium

    #cli programs
    fastfetch
    figlet
    fzf
    gitFull
    bat
    htop
    yt-dlp
    lm_sensors

    #programming languages
    rustup
    gcc
    python312

    #dependencies
    qemu
    gnumake
    zip
    ly
    age
    sops

    #services
    tailscale
    navidrome
    jellyfin

    #tmp
  ];

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa
    kdePackages.discover
    kdePackages.konsole
  ];

  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/zack/.config/sops/age/keys.txt";
    secrets = {
      "lastfm_api_key" = {};
      "lastfm_secret" = {};
      "codeberg_public_key" = {};
    };
  };

  #vm stuff
  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
      runAsRoot = false;
    };
  };

  #user declaration
  users.users.zack = {
    isNormalUser = true;
    description = "Zack";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" ];
  };

  #network stuff
  networking.hostName = "Milvus-milvus";
  networking.networkmanager.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  #navidrome configuration
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      MusicFolder = "/srv/music";
      Address = "0.0.0.0";
      Port = 4533;
      DataFolder = "/var/lib/navidrome";
      ScannerEnabled = false;
      LogLevel = "info";
      LastFM.Enabled = true;
      LastFM.ApiKey = config.sops.secrets."lastfm_api_key".path;
      LastFM.Secret = config.sops.secrets."lastfm_secret".path;
      Tags.Artists.Split = [" / " " feat. " " feat " " ft. " " ft " "; " " & " " , " ", " "," "/" "&" "  "];
    };
  };

  #jellyfin configuration
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "jellyfin";
    group = "jellyfin";
    dataDir   = "/var/lib/jellyfin";
    configDir = "/etc/jellyfin";
    cacheDir  = "/var/cache/jellyfin";
    logDir    = "/var/log/jellyfin";
  };

  #enable tailscale for non-lan access
  services.tailscale = {
    enable = true;
    openFirewall = true;
  };

  programs.ssh.knownHosts = {
    codeberg = {
      hostNames = [ "codeberg.org" ];
      publicKey = config.sops.secrets."codeberg_public_key".path;
    };
  };

  #boot stuff
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0; #how long does the nixos generations selection screen appear for
  boot.kernelPackages = pkgs.linuxPackages_latest; #use the absolute latest kernel, not managed by nixpkgs

  #systemd stuff
  boot.loader.systemd-boot.enable = true;
  #disable DOB variable
  systemd.package = pkgs.systemd.override { withUserDb = false; };
  services.userdbd.enable = lib.mkForce false;

  #not sure what this does
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  #de stuff
  services.xserver.enable = false;
  services.displayManager.ly.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.xkb.layout = "gb";

  #not sure
  console.keyMap = "uk";
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #jack in msg for sudo password prompt
  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults passprompt="Jack In: "
    '';
  };

  #random stuff
  nix.settings.experimental-features = ["nix-command" "flakes"];
  documentation.dev.enable = false;
  documentation.doc.enable = false;
  system.stateVersion = "26.11";
  home-manager.backupFileExtension = "backup";
}
