#./Home-Manager/Configs/kitty.nix
{pkgs, lib, config, ...}: 
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 11;
    };

    settings = {
      background_opacity = "1";
      window_padding_width = "8";
      hide_window_decorations = "no";
      confirm_os_window_close = "0";
      cursor_shape = "block";
      cursor_blink_interval = "0.5";
      scrollback_lines = "10000";
      enable_audio_bell = "no";
      visual_bell_duration = "0.0";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";
      tab_bar_edge = "top";
      repaint_delay = "10";
      input_delay = "3";
      sync_to_monitor = "yes";
      background_image = "/home/zack/Pictures/misc/birb-fin.png";
      background_image_layout = "centered";
      background_tint = "0.85";
      symbol_map = "U+E000-U+E00A,U+EA60-U+EBEB Symbols Nerd Font Mono";

      #custom theme (vimjoyer colours)
      #This whole block was commented out in the original config.
      #color0 = "#242424";   # black        (dark: bg)
      #color8 = "#504945";   # black bright (dark: dark grey)
      #color1 = "#fb4934";   # red          (dark: red)
      #color9 = "#fb4934";   # red bright   (dark: red)
      #color2 = "#b8bb26";   # green        (dark: green)
      #color10 = "#b8bb26";   # green bright (dark: green)
      #color3 = "#fabd2f";   # yellow       (dark: yellow)
      #color11 = "#fabd2f";   # yellow bright(dark: yellow)
      #color4 = "#7daea3";   # blue         (dark: blue)
      #color12 = "#7daea3";   # blue bright  (dark: blue)
      #color5 = "#e089a1";   # magenta      (dark: magenta)
      #color13 = "#e089a1";   # magenta bright(dark: magenta)
      #color6 = "#8ec07c";   # cyan         (dark: cyan)
      #color14 = "#8ec07c";   # cyan bright  (dark: cyan)
      #color7 = "#665c54";   # white        (dark: medium grey)
      #color15 = "#665c54";   # white bright (dark: medium grey)
      #background = "#1b182c"; # challenger deep bg
      #foreground = "#cbe3e7"; # challenger deep fg
      #cursor = "#cbe3e7"; # challenger deep fg

      #ChallengerDeep theme
      foreground = "#cbe3e7";
      background = "#1e1c31";
      selection_foreground = "#1e1c31";
      selection_background = "#aaffe4";
      active_tab_background = "#565575";
      inactive_tab_background = "#565575";
      active_tab_foreground = "#95ffa4";
      inactive_tab_foreground = "#cbe3e7";
      active_border_color = "#fbfcfc";
      color0 = "#565575";
      color8 = "#100e23";
      color1 = "#ff8080";
      color9 = "#ff5458";
      color2 = "#95ffa4";
      color10 = "#62d196";
      color3 = "#ffe9aa";
      color11 = "#ffb378";
      color4 = "#91ddff";
      color12 = "#65b2ff";
      color5 = "#c991e1";
      color13 = "#906cff";
      color6 = "#aaffe4";
      color14 = "#63f2f1";
      color7 = "#cbe3e7";
      color15 = "#a6b3cc";
    };

    keybindings = {
      "ctrl+t" = "new_tab_with_cwd";
      "ctrl+p" = "previous_tab";
      "ctrl+l" = "next_tab";
      "ctrl+equal" = "increase_font_size";
      "ctrl+minus" = "decrease_font_size";
      "ctrl+r" = "load_config_file";
    };
  };
}