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
	foreground = "#00ff00",

	ansi = {
		"#0a2a0a", -- black
		"#00ff66", -- red
		"#00ff00", -- green
		"#88ff00", -- yellow
		"#00aa66", -- blue
		"#66ff99", -- magenta
		"#00ffaa", -- cyan
		"#ccffcc", -- white
	},
	brights = {
		"#226622", -- bright black
		"#33ff88", -- bright red
		"#55ff55", -- bright green
		"#aaff33", -- bright yellow
		"#33cc88", -- bright blue
		"#88ffbb", -- bright magenta
		"#33ffdd", -- bright cyan
		"#eeffee", -- bright white
	},
}
return config
