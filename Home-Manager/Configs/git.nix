#./Home-Manager/Configs/git.nix
{pkgs, lib, config, ...}: 
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "zuri3";
        email = "z-l-f@hotmail.com";
      };
    };
  };
}
