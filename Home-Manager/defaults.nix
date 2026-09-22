#./Home-Manager/defaults.nix
{pkgs, lib, config, ...}:
{
  home = {
    username = "zack";
    homeDirectory = "/home/zack";
    stateVersion = "26.11";
  };
  imports = [
    ./Configs/git.nix
    ./Configs/bash.nix
    ./Configs/kitty.nix
    ./Configs/fastfetch.nix
    ./Configs/htop.nix
    ./Configs/codium.nix

    ./Shells/c.nix
    ./Shells/python312.nix
    ./Shells/rust.nix
    ./Shells/c-sharp.nix
    
    ./Scripts/wallpaper-cycler.nix
  ];
}
