# wezterm_lua

A repository for managing [WezTerm](https://wezfurlong.org/wezterm/) configuration files.

`.wezterm.lua` is the main configuration file for WezTerm.

<img src="./screenshot.png" width=700>

## Configuration (`.wezterm.lua`)

- **Window size**: Initial size set to 80 columns x 24 rows
- **Font**: `HackGen` (weight: Medium)
- **Font size**: 13pt
- **Background opacity**: 0.7 (translucent)
- **Background blur**: 30 (macOS)
- **Window decorations**: Resize only, title bar hidden (`RESIZE`)
- **Tab bar**: Hidden when only one tab is open; new tab button hidden
- **Tab colors**: Active tab `#ae8b2d` / Inactive tab `#5c6d74`; tab border hidden
- **Window padding**: None (0 on all sides)
- **Option key**: Both left and right Alt keys act as Meta key (not as composed key)

## Keybindings

| Key | Action |
|-----|--------|
| `Ctrl+h` | Send Backspace |
| `Ctrl+Shift+\|` | Split pane horizontally |
| `Ctrl+Shift+}` | Split pane vertically |
| `Ctrl+Shift+h` | Move to left pane |
| `Ctrl+Shift+l` | Move to right pane |
| `Ctrl+Shift+k` | Move to upper pane |
| `Ctrl+Shift+j` | Move to lower pane |

## Usage

Create a symbolic link or copy this file to your home directory.

```bash
ln -s $(pwd)/.wezterm.lua ~/.wezterm.lua
```
