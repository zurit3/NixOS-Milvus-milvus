#./Home-Manager/Shells/python312.nix
{pkgs, lib, config, ...}:
{
  home.file."Documents/Programming/Shells/Python312/shell.nix" = {
    text = ''
      {pkgs ? import <nixpkgs> {}}:

      pkgs.mkShell {
        name = "python312-dev";

        nativeBuildInputs = with pkgs; [
          python312
          python312Packages.pip
          python312Packages.virtualenv
          python312Packages.black
          python312Packages.pylint
          python312Packages.mypy
          python312Packages.ipython
          python312Packages.debugpy
          pkg-config
        ];

        buildInputs = with pkgs; [
          openssl
        ];
      }
    '';
  };
}