# ./Home-Manager/Configs/htop.nix
{ pkgs, lib, config, ... }:
{
  programs.htop = {
    enable = true;
    settings = with config.lib.htop; {
      fields = with fields; [
        PID USER PRIORITY NICE M_VIRT M_RESIDENT M_SHARE STATE
        PERCENT_CPU PERCENT_MEM TIME COMM
      ];

      hide_kernel_threads = true;
      hide_userland_threads = false;
      hide_running_in_container = false;
      shadow_other_users = true;
      show_thread_names = true;
      show_program_path = true;
      highlight_base_name = true;
      highlight_deleted_exe = true;
      shadow_distribution_path_prefix = true;
      highlight_megabytes = true;
      highlight_threads = true;
      highlight_changes = true;
      highlight_changes_delay_secs = 5;
      find_comm_in_cmdline = true;
      strip_exe_from_cmdline = true;
      show_merged_command = true;
      header_margin = true;
      screen_tabs = true;
      detailed_cpu_time = true;
      cpu_count_from_one = false;
      show_cpu_usage = true;
      show_cpu_frequency = true;
      show_cpu_temperature = true;
      degree_fahrenheit = false;
      update_process_names = true;
      account_guest_in_cpu_meter = true;
      color_scheme = 6;
      enable_mouse = true;
      delay = 15;
      hide_function_bar = false;
      header_layout = "two_50_50";

      tree_view = false;
      sort_key = fields.PERCENT_CPU;
      tree_sort_key = fields.PID;
      sort_direction = -1;
      tree_sort_direction = 1;
      tree_view_always_by_pid = false;
      all_branches_collapsed = false;
    }
    // leftMeters [
      (bar "AllCPUs4") (bar "CPU") (bar "Memory") (bar "Swap")
      (bar "MemorySwap") (bar "Zram") (text "Clock") (text "Date")
      (text "DateTime") (text "ZFSARC") (text "ZFSCARC") (text "SELinux")
      (text "SystemdUser") (text "FileDescriptors")
    ]
    // rightMeters [
      (bar "RightCPUs4") (text "Tasks") (text "LoadAverage") (text "Load")
      (text "Uptime") (text "Battery") (bar "System") (text "HugePages")
      (text "Hostname") (text "Blank") (text "PressureStallCPUSome")
      (text "PressureStallIOSome") (text "PressureStallIOFull")
      (text "PressureStallIRQFull") (text "PressureStallMemorySome")
      (text "PressureStallMemoryFull") (text "DiskIO") (text "NetworkIO")
    ];
  };
}