-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.automatically_reload_config = true
-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 80 -- default
config.initial_rows = 24 -- default

-- or, changing the font size and color scheme.
config.font_size = 17 -- default size
config.window_background_opacity = 0.5
config.macos_window_background_blur = 20

-- retro fonts
local VT220 = "Glass TTY VT220"
local apple2 = "Print Char 21"
local ankomochi = "Nu Anko Mochi"

config.font = wezterm.font(VT220)

-- Finally, return the configuration to wezterm:
return config
