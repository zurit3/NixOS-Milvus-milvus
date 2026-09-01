#./Home-Manager/Configs/codium.nix
{pkgs, lib, config, ...}:
{
  programs.vscodium = {
    enable = true;
    profiles.default = {
      userSettings = {
        "editor.fontSize" = 14;
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "explorer.confirmDelete" = false;
        "workbench.statusBar.visible" = false;
        "files.autoSave" = "onWindowChange";
        "git.autofetch" = true;
        "workbench.editor.empty.hint" = "hidden";
        "workbench.colorTheme" = "Dark Modern";
        "window.restoreWindows" = "all";
        "workbench.startupEditor" = "none";
        "nixEnvSelector.suggestion" = false;
      };
    };
  };
}
