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
config.window_decorations = "RESIZE"

-- タブが1枚の時はタブバーを非表示
-- 複数タブを開いた時は自動で表示される
config.hide_tab_bar_if_only_one_tab = true
--  tab の＋を非表示
config.show_new_tab_button_in_tab_bar = false


-- 余白も透過に馴染ませる
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

 config.colors = {
   tab_bar = {
     inactive_tab_edge = "none", -- タブ同士の境界線を非表示
   },
 }

-- タブのカスタムタイトルを保持するテーブル
local tab_titles = {}

wezterm.on("tab-title-changed", function(tab, title)
  if tab_titles[tab.tab_id] then
    return tab_titles[tab.tab_id]
  end
end)

-- スピナーアニメーション
local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
-- シェルプロセス（ビジーとみなさない）
local shell_names = { zsh = true, bash = true, fish = true, sh = true }

-- 100ms ごとにフレームを更新してタブバーを再描画
config.status_update_interval = 100

wezterm.on("update-right-status", function(window, pane)
  local frame = (wezterm.GLOBAL.spinner_frame or 0) + 1
  if frame > #spinner_frames then frame = 1 end
  wezterm.GLOBAL.spinner_frame = frame
  window:set_right_status("")
end)

config.keys = {
  -- Ctrl+h でバックスペースを送信
  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.SendKey { key = 'Backspace' },
  },
  -- タブ名を変更 (Ctrl+Shift+e)
  {
    key = 'e',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.PromptInputLine {
      description = 'タブ名を入力してください:',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          local tab = window:active_tab()
          tab_titles[tab:tab_id()] = line
          tab:set_title(line)
        end
      end),
    },
  },
  -- 左右に分割
  {
    key = '|',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- 上下に分割
  {
    key = '}',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- ペイン間をVimライクに移動
  { key = 'h', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Down' },
}


-- アクティブタブに色をつける
 wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
   local background = "#5c6d74"
   local foreground = "#FFFFFF"

   if tab.is_active then
     background = "#ae8b2d"
     foreground = "#FFFFFF"
   end

   -- ビジー状態の判定（シェル以外のプロセスが動いているか）
   local process = wezterm.basename(tab.active_pane.foreground_process_name or "")
   local is_busy = process ~= "" and not shell_names[process]

   local spinner = ""
   if is_busy then
     local frame = wezterm.GLOBAL.spinner_frame or 1
     spinner = spinner_frames[frame] .. " "
   end

   local pane_title = tab_titles[tab.tab_id] or tab.active_pane.title
   local title = "   " .. spinner .. wezterm.truncate_right(pane_title, max_width - 1) .. "   "

   return {
     { Background = { Color = background } },
     { Foreground = { Color = foreground } },
     { Text = title },
   }
 end)

config.font = wezterm.font("HackGen", { weight = "Medium" })

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- Finally, return the configuration to wezterm:
return config
