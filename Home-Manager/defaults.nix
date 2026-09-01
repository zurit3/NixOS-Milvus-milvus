#./Home-Manager/defaults.nix
{pkgs, lib, config, ...}:
{
  home = {
    username = "zack";
    homeDirectory = "/home/zack";
    stateVersion = "26.11";
    packages = [
      pkgs.python312
    ];
  };
  imports = [
    ./Configs/git.nix
    ./Configs/bash.nix
    ./Configs/kitty.nix
    ./Configs/fastfetch.nix
    ./Configs/htop.nix
    ./Configs/codium.nix
    
    ./Scripts/wallpaper-cycler.nix
  ];
}
