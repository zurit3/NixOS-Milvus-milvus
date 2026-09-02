#./Home-Manager/Shells/C.nix
{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.file."Documents/Shells/C/shell.nix" = {
    text = ''
      { pkgs ? import <nixpkgs> {} }:

      pkgs.mkShell {
        nativeBuildInputs = with pkgs; [];
        shellHook = ""
          echo "C dev shell ready"
        "";
      }
    '';
  };
  home.file."Documents/Shells/C/.envrc" = {
    text = "use nix\n";
  };
}