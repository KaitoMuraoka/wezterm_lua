-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 80 -- default
config.initial_rows = 24 -- default

-- or, changing the font size and color scheme.
config.font_size = 13 -- default size

-- 透明度
config.window_background_opacity = 0.7

-- ブラー
config.macos_window_background_blur = 30

-- タイトルバーを非表示にする（枠ごと消す）
config.window_decorations = "RESIZE|TITLE"

-- タブが1枚の時はタブバーを非表示
-- 複数タブを開いた時は自動で表示される
config.hide_tab_bar_if_only_one_tab = true

-- 余白も透過に馴染ませる
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.font = wezterm.font("HackGen", { weight = "Medium" })


-- Finally, return the configuration to wezterm:
return config
