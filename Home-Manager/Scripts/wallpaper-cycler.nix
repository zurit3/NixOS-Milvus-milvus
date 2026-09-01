# ./Home-Manager/Scripts/wallpaper-cycler.nix
{pkgs, ...}: let
  wallpaperDir = "/home/zack/Pictures/wallpapers";
  cycleWallpaper = pkgs.writeShellScriptBin "cycle-wallpaper" ''
    set -euo pipefail

    WALLPAPER_DIR="${wallpaperDir}"
    STATE_FILE="/tmp/current-wallpaper"

    # Build a sorted, newline-separated list of wallpapers
    mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \
      \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) \
      | sort)

    if [ ''${#WALLPAPERS[@]} -eq 0 ]; then
      echo "No wallpapers found in $WALLPAPER_DIR" >&2
      exit 1
    fi

    CURRENT=""
    if [ -f "$STATE_FILE" ]; then
      CURRENT=$(cat "$STATE_FILE")
    fi

    # Find index of current wallpaper in the list
    NEXT_INDEX=0
    for i in "''${!WALLPAPERS[@]}"; do
      if [ "''${WALLPAPERS[$i]}" = "$CURRENT" ]; then
        NEXT_INDEX=$(( (i + 1) % ''${#WALLPAPERS[@]} ))
        break
      fi
    done

    NEXT="''${WALLPAPERS[$NEXT_INDEX]}"
    plasma-apply-wallpaperimage "$NEXT"
    echo "$NEXT" > "$STATE_FILE"
  '';
in {
  home.packages = [cycleWallpaper];
}
