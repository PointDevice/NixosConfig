{ pkgs, config, ...}:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false; # disable it,autostart it in WM
      target = "graphical-session.target";
    };
    Style = ''
      @define-color base   #24273a;
      @define-color mantle #1e2030;
      @define-color crust  #181926;
      
      @define-color text     #cad3f5;
      @define-color subtext0 #a5adcb;
      @define-color subtext1 #b8c0e0;
      
      @define-color surface0 #363a4f;
      @define-color surface1 #494d64;
      @define-color surface2 #5b6078;
      
      @define-color overlay0 #6e738d;
      @define-color overlay1 #8087a2;
      @define-color overlay2 #939ab7;
      
      @define-color blue      #8aadf4;
      @define-color lavender  #b7bdf8;
      @define-color sapphire  #7dc4e4;
      @define-color sky       #91d7e3;
      @define-color teal      #8bd5ca;
      @define-color green     #a6da95;
      @define-color yellow    #eed49f;
      @define-color peach     #f5a97f;
      @define-color maroon    #ee99a0;
      @define-color red       #ed8796;
      @define-color mauve     #c6a0f6;
      @define-color pink      #f5bde6;
      @define-color flamingo  #f0c6c6;
      @define-color rosewater #f4dbd6;
      
      * {
        border: none;
      }
      
      window.bottom_bar#waybar {
        background-color: alpha(@base, 0.7);
        border-top: solid alpha(@surface1, 0.7) 2;
      }
      
      window.top_bar#waybar {
        background-color: alpha(@base, 0.7);
        border-bottom: solid alpha(@surface1, 0.7) 2;
      }
      
      window.left_bar#waybar {
        background-color: alpha(@base, 0.7);
        border-top: solid alpha(@surface1, 0.7) 2;
        border-right: solid alpha(@surface1, 0.7) 2;
        border-bottom: solid alpha(@surface1, 0.7) 2;
        border-radius: 0 15 15 0;
      }
      
      window.bottom_bar .modules-center {
        background-color: alpha(@surface1, 0.7);
        color: @green;
        border-radius: 15;
        padding-left: 20;
        padding-right: 20;
        margin-top: 5;
        margin-bottom: 5;
      }
      
      window.bottom_bar .modules-left {
        background-color: alpha(@surface1, 0.7);
        border-radius: 0 15 15 0;
        padding-left: 20;
        padding-right: 20;
        margin-top: 5;
        margin-bottom: 5;
      }
      
      window.bottom_bar .modules-right {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15 0 0 15;
        padding-left: 20;
        padding-right: 20;
        margin-top: 5;
        margin-bottom: 5;
      }
      
      #user {
        padding-left: 10;
      }
      
      #language {
        padding-left: 15;
      }
      
      #keyboard-state label.locked {
        color: @yellow;
      }
      
      #keyboard-state label {
        color: @subtext0;
      }
      
      #workspaces button{
        padding-left: 1px;
        margin-left: 1px;
        padding-right: 1px;
        margin-right: 1px;
      }
      
      #workspaces button.focused {
        color: @peach;
      }
      
      #workspaces button {
        color: @text;
      }
      
      #submap {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15;
        padding-left: 15;
        padding-right: 15;
        margin-left: 20;
        margin-right: 20;
        margin-top: 5;
        margin-bottom: 5;
      }
      
      window.top_bar .modules-center {
        font-weight: bold;
        background-color: alpha(@surface1, 0.7);
        color: @peach;
        border-radius: 15;
        padding-left: 20;
        padding-right: 20;
        margin-top: 5;
        margin-bottom: 5;
      }
      
      #custom-separator {
        color: @green;
      }
      
      #custom-separator_dot {
        color: @green;
      }
      
      #clock.time {
        color: @flamingo;
      }
      
      #clock.week {
        color: @sapphire;
      }
      
      #clock.month {
        color: @sapphire;
      }
      
      #clock.calendar {
        color: @mauve;
      }
      
      #bluetooth {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15;
        padding-left: 15;
        padding-right: 15;
        margin-top: 5;
        margin-bottom: 5;
      }
      
      #bluetooth.disabled {
        background-color: alpha(@surface0, 0.7);
        color: @subtext0;
      }
      
      #bluetooth.on {
        color: @blue;
      }
      
      #bluetooth.connected {
        color: @sapphire;
      }
      
      #network {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15;
        padding-left: 15;
        padding-right: 15;
        margin-left: 2;
        margin-right: 2;
        margin-top: 5;
        margin-bottom: 5;
      }
      
      #network.disabled {
        background-color: alpha(@surface0, 0.7);
        color: @subtext0;
      }
      
      #network.disconnected {
        color: @red;
      }
      
      #network.wifi {
        color: @teal;
      }
      
      #idle_inhibitor {
        margin-right: 2;
      }
      
      #idle_inhibitor.deactivated {
        color: @subtext0;
      }
      
      #custom-dunst.off {
        color: @subtext0;
      }
      
      #custom-airplane_mode {
        margin-right: 2;
      }
      
      #custom-airplane_mode.off {
        color: @subtext0;
      }
      
      #custom-night_mode {
        margin-right: 2;
      }
      
      #custom-night_mode.off {
        color: @subtext0;
      }
      
      #custom-dunst {
        margin-right: 2;
      }
      
      #custom-media {}
      
      #custom-media.Paused {
        color: @subtext0;
      }
      
      #pulseaudio.microphone_indicator {
        color: @pink;
        margin-right: 4;
      }
      
      #custom-webcam {
        color: @maroon;
        margin-right: 4;
      }
      
      #custom-recording {
        color: @red;
        margin-right: 4;
      }
      
      #custom-geo {
        color: @yellow;
        margin-right: 4;
      }
      
      #custom-logout_menu {
        color: @red;
        background-color: alpha(@surface1, 0.7);
        border-radius: 15 0 0 15;
        padding-left: 10;
        padding-right: 5;
        margin-top: 5;
        margin-bottom: 5;
      }
      
      window.left_bar .modules-center {
        background-color: alpha(@surface1, 0.7);
        border-radius: 0 15 15 0;
        margin-right: 5;
        margin-top: 15;
        margin-bottom: 15;
        padding-top: 5;
        padding-bottom: 5;
      }
      
      #taskbar {
        margin-top: 10;
        margin-right: 10;
        margin-left: 10;
      }
      
      #taskbar button.active {
        background-color: alpha(@surface1, 0.7);
        border-radius: 10;
      }
      
      #tray {
        /*margin-bottom: 10;
        margin-right: 10;
        margin-left: 10;*/
      }
      
      #tray>.needs-attention {
        background-color: alpha(@maroon, 0.7);
        border-radius: 10;
      }
      
      #cpu {
        color: @sapphire;
      }
      
      #cpu.low {
        color: @rosewater;
      }
      
      #cpu.lower-medium {
        color: @yellow;
      }
      
      #cpu.medium {
        color: @peach;
      }
      
      #cpu.upper-medium {
        color: @maroon;
      }
      
      #cpu.high {
        color: @red;
      }
      
      #memory {
        color: @sapphire;
      }
      
      #memory.low {
        color: @rosewater;
      }
      
      #memory.lower-medium {
        color: @yellow;
      }
      
      #memory.medium {
        color: @peach;
      }
      
      #memory.upper-medium {
        color: @maroon;
      }
      
      #memory.high {
        color: @red;
      }
      
      #disk {
        color: @sapphire;
      }
      
      #disk.low {
        color: @rosewater;
      }
      
      #disk.lower-medium {
        color: @yellow;
      }
      
      #disk.medium {
        color: @peach;
      }
      
      #disk.upper-medium {
        color: @maroon;
      }
      
      #disk.high {
        color: @red;
      }
      
      #temperature {
        color: @green;
      }
      
      #temperature.critical {
        color: @red;
      }
      
      #battery {
        color: @teal;
      }
      
      #battery.low {
        color: @red;
      }
      
      #battery.lower-medium {
        color: @maroon;
      }
      
      #battery.medium {
        color: @peach;
      }
      
      #battery.upper-medium {
        color: @flamingo;
      }
      
      #battery.high {
        color: @rosewater;
      }
      
      #backlight {
        color: @overlay0;
      }
      
      #backlight.low {
        color: @overlay1;
      }
      
      #backlight.lower-medium {
        color: @overlay2;
      }
      
      #backlight.medium {
        color: @subtext0;
      }
      
      #backlight.upper-medium {
        color: @subtext1;
      }
      
      #backlight.high {
        color: @text;
      }
      
      #pulseaudio.bluetooth {
        color: @sapphire;
      }
      
      #pulseaudio.muted {
        color: @surface2;
      }
      
      #pulseaudio {
        color: @text;
      }
      
      #pulseaudio.low {
        color: @overlay0;
      }
      
      #pulseaudio.lower-medium {
        color: @overlay1;
      }
      
      #pulseaudio.medium {
        color: @overlay2;
      }
      
      #pulseaudio.upper-medium {
        color: @subtext0;
      }
      
      #pulseaudio.high {
        color: @subtext1;
      }
    '';
    settings = [
      {
    # Main Config
    "name"= "top_bar",
    "layer"= "top", # Waybar at top layer
    "position"= "top", # Waybar position (top|bottom|left|right)
    "height"= 36, # Waybar height (to be removed for auto height)
    "spacing"= 4, # Gaps between modules (4px)
    "modules-left"= ["sway/workspaces", "sway/submap", "sway/window"],
    "modules-center"= ["clock#time", "custom/separator", "clock#week", "custom/separator_dot", "clock#month", "custom/separator", "clock#calendar"],
    "modules-right"= [ "tray", "cpu", "memory", "battery", "backlight", "pulseaudio", "bluetooth", "network", "custom/logout_menu" ],

    # Modules Config
    "sway/workspaces"= {
        "on-click"= "activate",  
        "format"= "{icon}",
        "format-icons"= {
            "1"= "󰲠",
            "2"= "󰲢",
            "3"= "󰲤",
            "4"= "󰲦",
            "5"= "󰲨",
            "6"= "󰲪",
            "7"= "󰲬",
            "8"= "󰲮",
            "9"= "󰲰",
            "10"= "󰿬",
            "web"= "󰈹",
            "messages" = "",
            "editor" = "",
            "music" = "󰝚",
            "active"= "",
            "default"= "",
            "empty"= ""
        },

    },

    "sway/window"= {
        "format"= "{}",
        "max-length"= 120
    },

    "sway/submap"= {
        "format"= "<span color='#a6da95'>Mode:</span> {}",
        "tooltip"= false,
    },

    "clock#time"= {
        "format"= "{:%I:%M %p }",
    },

    "custom/separator"= {
        "format"= "|",  
    },

    "custom/separator_dot"= {
        "format"= "•",  
    },

    "clock#week"= {
        "format"= "{:%a}",
    },

    "clock#month"= {
        "format"= "{:%h}",
    },

    "clock#calendar"= {
        "format"= "{:%F}",
        "tooltip-format"= "<tt><small>{calendar}</small></tt>",
        "actions"= {
            "on-click-right"= "mode",
        },
        "calendar"= {
            "mode"          = "month",
            "mode-mon-col"  = 3,
            "weeks-pos"     = "right",
            "on-scroll"     = 1,
            "on-click-right"= "mode",
            "format"= {
                "months"=     "<span color='#f4dbd6'><b>{}</b></span>",
                "days"=       "<span color='#cad3f5'><b>{}</b></span>",
                "weeks"=      "<span color='#c6a0f6'><b>W{}</b></span>",
                "weekdays"=   "<span color='#a6da95'><b>{}</b></span>",
                "today"=      "<span color='#8bd5ca'><b><u>{}</u></b></span>"
            }
        },
    },

    "clock"= {
        "format"= "{:%I:%M %p %Ez | %a • %h | %F}",
        "format-alt"= "{:%I:%M %p}",
        "tooltip-format"= "<tt><small>{calendar}</small></tt>",
        "actions"= {
            "on-click-right"= "mode",
        },
        "calendar"= {
            "mode"          = "month",
            "mode-mon-col"  = 3,
            "weeks-pos"     = "right",
            "on-scroll"     = 1,
            "on-click-right"= "mode",
            "format"= {
                "months"=     "<span color='#f4dbd6'><b>{}</b></span>",
                "days"=       "<span color='#cad3f5'><b>{}</b></span>",
                "weeks"=      "<span color='#c6a0f6'><b>W{}</b></span>",
                "weekdays"=   "<span color='#a6da95'><b>{}</b></span>",
                "today"=      "<span color='#8bd5ca'><b><u>{}</u></b></span>"
            }
        },
    },

    "custom/media"= {
        "format"= "{icon}󰎈",
        "restart-interval"= 2,
        "return-type"= "json",
        "format-icons"= {
            "Playing"= "",
            "Paused"= "",
        },
        "max-length"= 35,
        #"exec"= "fish -c fetch_music_player_data",
        "on-click"= "playerctl play-pause",
        "on-click-right"= "playerctl next",
        "on-click-middle"= "playerctl prev",
        "on-scroll-up"= "playerctl volume 0.05-",
        "on-scroll-down"= "playerctl volume 0.05+",
        "smooth-scrolling-threshold"= "0.1",
    },

    "bluetooth"= {
        "format"= "󰂯",
        "format-disabled"= "󰂲",
        "format-connected"= "󰂱 {device_alias}",
        "format-connected-battery"= "󰂱 {device_alias} (󰥉 {device_battery_percentage}%)",
        # "format-device-preference"= [ "device1", "device2" ], // preference list deciding the displayed device
        "tooltip-format"= "{controller_alias}\t{controller_address} ({status})\n\n{num_connections} connected",
        "tooltip-format-disabled"= "bluetooth off",
        "tooltip-format-connected"= "{controller_alias}\t{controller_address} ({status})\n\n{num_connections} connected\n\n{device_enumerate}",
        "tooltip-format-enumerate-connected"= "{device_alias}\t{device_address}",
        "tooltip-format-enumerate-connected-battery"= "{device_alias}\t{device_address}\t({device_battery_percentage}%)",
        "max-length"= 35,
        "on-click"= "rfkill toggle bluetooth",
        "on-click-right"= "blueman-manager",
    },

    "network"= {
        "format"= "󰤭 ",
        "format-wifi"= "{icon}({signalStrength}%){essid}",
        "format-icons"= [ "󰤯 ", "󰤟 ", "󰤢 ", "󰤥 ", "󰤨 " ],
        "format-ethernet"= "", # Icon: ethernet
        "format-disconnected"= "󰤫 Disconnected",
        "tooltip-format"= "wifi <span color='#ee99a0'>off</span>",
        "tooltip-format-wifi"="SSID: {essid}({signalStrength}%), {frequency} MHz\nInterface: {ifname}\nIP: {ipaddr}\nGW: {gwaddr}\n\n<span color='#a6da95'>{bandwidthUpBits}</span>\t<span color='#ee99a0'>{bandwidthDownBits}</span>\t<span color='#c6a0f6'>󰹹{bandwidthTotalBits}</span>",
        "tooltip-format-disconnected"= "<span color='#ed8796'>disconnected</span>",
        # "format-ethernet"= "󰈀 {ipaddr}/{cidr}",
        # "format-linked"= "󰈀 {ifname} (No IP)",
         "tooltip-format-ethernet"="Interface: {ifname}\nIP: {ipaddr}\nGW: {gwaddr}\nNetmask: {netmask}\nCIDR: {cidr}\n\n<span color='#a6da95'>{bandwidthUpBits}</span>\t<span color='#ee99a0'>{bandwidthDownBits}</span>\t<span color='#c6a0f6'>󰹹{bandwidthTotalBits}</span>",
        "max-length"= 35,
        "on-click"= "alacritty -T nmprompt -e nmtui",
        #"on-click"= "nm-connection-editor",
        #"on-click-right"= "wezterm start nmtui",
    },

    "custom/logout_menu"= {
        "return-type"= "json",
        "exec"= "echo '{ \"text\":\"󰐥\", \"tooltip\": \"logout menu\" }'",
        "interval"= "once",
        "on-click"= "wlogout",
    },

    #"modules-center"= [],

    # Modules Config
    "wlr/taskbar"= {
        "format"= "{icon}",
        "icon-size"= 20,
        "icon-theme"= "Numix-Circle",
        "tooltip-format"= "{title}",
        "on-click"= "activate",
        "on-click-right"= "close",
        "on-click-middle"= "fullscreen",
    },

    "tray"={
        "icon-size"= 20,
        "spacing"= 2,
    },

    "cpu"= {
        "format"= " {usage}%",
        "states"= {
            "high"= 90,
            "upper-medium"= 70,
            "medium"= 50,
            "lower-medium"= 30,
            "low"= 10,
        },
        "on-click"= "wezterm start btop",
        "on-click-right"= "wezterm start btm",
    },
    
    "memory"= {
        "format"= " {percentage}%",
        "tooltip-format"= "Main: ({used} GiB/{total} GiB)({percentage}%), available {avail} GiB\nSwap: ({swapUsed} GiB/{swapTotal} GiB)({swapPercentage}%), available {swapAvail} GiB",
        "states"= {
            "high"= 90,
            "upper-medium"= 70,
            "medium"= 50,
            "lower-medium"= 30,
            "low"= 10,
        },
        "on-click"= "wezterm start btop",
        "on-click-right"= "wezterm start btm",
    },

    "disk"= {
        "format"= "󰋊{percentage_used}%",  
        "tooltip-format"= "({used}/{total})({percentage_used}%) in '{path}', available {free}({percentage_free}%)",
        "states"= {
            "high"= 90,
            "upper-medium"= 70,
            "medium"= 50,
            "lower-medium"= 30,
            "low"= 10,
        },
        "on-click"= "wezterm start btop",
        "on-click-right"= "wezterm start btm",
    },

    "temperature"= {
        "tooltip"= false,
        "thermal-zone"= 8,
        "critical-threshold"= 80,
        "format"= "{icon}{temperatureC}󰔄",
        "format-critical"= "🔥{icon}{temperatureC}󰔄",
        "format-icons"= [ "", "", "", "", "" ],
    },

    "battery"= {
        "states"= {
            "high"= 90,
            "upper-medium"= 70,
            "medium"= 50,
            "lower-medium"= 30,
            "low"= 10,
        },
        "format"= "{icon}{capacity}%",
        "format-charging"= "󱐋{icon}{capacity}%",
        "format-plugged"= "󰚥{icon}{capacity}%",
        "format-time"= "{H} h {M} min",
        "format-icons"= [ "󱃍", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹" ],
        "tooltip-format"= "{timeTo}",
    },
    
    "backlight"= {
        "format"= "{icon}{percent}%",
        "format-icons"= [
            "󰌶 ",
            "󱩎 ",
            "󱩏 ",
            "󱩐 ",
            "󱩑 ",
            "󱩒 ",
            "󱩓 ",
            "󱩔 ",
            "󱩕 ",
            "󱩖 ",
            "󰛨 ",
        ],
        "tooltip"= false,
        "states"= {
            "high"= 90,
            "upper-medium"= 70,
            "medium"= 50,
            "lower-medium"= 30,
            "low"= 10,
        },
        "reverse-scrolling"= true,
        "reverse-mouse-scrolling"= true,
    },

    "pulseaudio"= {
        "tooltip-format"= "{desc}",
        "format"= "{icon}{volume}% {format_source}",
        "format-bluetooth"= "󰂱{icon}{volume}% {format_source}",
        "format-bluetooth-muted"= "󰂱󰝟{volume}% {format_source}",
        "format-muted"= "󰝟{volume}% {format_source}",
        "format-source"= "󰍬{volume}%",
        "format-source-muted"= "󰍭{volume}%",
        "format-icons"= {
            "headphone"= "󰋋",
            "hands-free"= "",
            "headset"= "󰋎",
            "phone"= "󰄜",
            "portable"= "󰦧",
            "car"= "󰄋",
            "speaker"= "󰓃",
            "hdmi"= "󰡁",
            "hifi"= "󰋌",
            "default"= [
                "󰕿",
                "󰖀",
                "󰕾",
            ],
        },
        "reverse-scrolling"= true,
        "reverse-mouse-scrolling"= true,
        "on-click"= "pavucontrol",
    },
}
    ];
  };
}
