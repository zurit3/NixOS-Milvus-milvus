#./Home-Manager/Shells/rust.nix
{pkgs, lib, config, ...}:
{
  home.file."Documents/Programming/Shells/Rust/shell.nix" = {
    text = ''
      {pkgs ? import <nixpkgs> {}}:

      pkgs.mkShell {
        name = "rust-dev";

        nativeBuildInputs = with pkgs; [
          rustc
          cargo
          rustfmt
          clippy
          rust-analyzer
          gdb
          pkg-config
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