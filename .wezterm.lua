-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 80 -- default
config.initial_rows = 24 -- default

-- or, changing the font size and color scheme.
config.font_size = 17 -- default size

-- retro fonts
local VT220 = "Glass TTY VT220"
local apple2 = "Print Char 21"
local ankomochi = "Nu Anko Mochi"

config.font = wezterm.font(VT220)

config.colors = {
  foreground = "green",

  ansi = {
    "#003300", -- black
    "#00cc00", -- red
    "#00ff00", -- green
    "#00dd00", -- yellow
    "#00bb00", -- blue
    "#00ee00", -- magenta
    "#00aa00", -- cyan
    "#00ff00", -- white
  },
  brights = {
    "#005500", -- bright black
    "#00dd00", -- bright red
    "#00ff00", -- bright green
    "#00ee00", -- bright yellow
    "#00cc00", -- bright blue
    "#00ff00", -- bright magenta
    "#00bb00", -- bright cyan
    "#00ff00", -- bright white
  },
}

-- Finally, return the configuration to wezterm:
return config
