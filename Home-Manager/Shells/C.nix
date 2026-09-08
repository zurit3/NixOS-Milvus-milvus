#./Home-Manager/Shells/C.nix
{pkgs, lib, config, ...}:
{
  home.file."Documents/Programming/Shells/C/shell.nix" = {
    text = ''
      {pkgs ? import <nixpkgs> {}}:

      pkgs.mkShell {
        name = "c-dev";

        nativeBuildInputs = with pkgs; [
          gcc
          gnumake
          gdb
          clang-tools
          pkg-config
          xxd
          valgrind
          binutils
          strace
        ];

        buildInputs = with pkgs; [
          openssl
        ];
      }
    '';
  };
}