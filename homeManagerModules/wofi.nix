{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;  

    settings = {
      term = "alacritty";
      location = "center";
      width = 500;
      prompt = "Поиск";
      show_all = true;
      gtk_dark = false;
      insensitive = false;
      allow_markup = true;
      allow_images = true;
      line_wrap = "word";
      lines = 8;
      no_actions = true;
      hide_scroll = true;
    };

    style = ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;
  
      * {
        font-family: Maple Mono;
        background: transparent;
        color: @lavender;
      }
  
      #window {
        color: @lavender;
        border-color: @lavender;
        border-style: solid;
        border-width: 1px;
  
        background-color: @base; 
        border-radius: 14px;
      }
      #scroll {
        border-top-style: solid;
        border-width: 1px;
        border-color: @lavender;
      }
      #inner-box {
        padding-top: 12px;
      }
      #entry {
        border-style: none;
        border-color: @lavender;
        color: @lavender;
        padding: 6px;
        margin-bottom: 8px;
        margin-left: 12px;
        margin-right: 12;
  
        border-radius: 12px;
      }
  
      #entry:selected {
        background: @mantle;
        color: @lavender;
        font-weight: bold;
        outline: none;
      }
  
      #input {
        background-color: @crust;
        color: @lavender;
        border-color: @lavender;
  
        border-style: none;
        border-bottom-style: solid;
        border-width: 1px;
  
        font-style: normal;
  
        border-radius: 8;
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
  
        padding: 12px;
        margin: 8px;
      }
      #input:focus {
        background: @mantle;
        background-color: @mantle;
  
        font-style: italic;
      }
  
      #img {
        padding: 4px;
        margin-right: 6px;
      }
  
    '';
  };
}
