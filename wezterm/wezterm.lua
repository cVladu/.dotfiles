local wezterm = require 'wezterm'
local config = {}
local act = wezterm.action

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Mocha'
config.background = {
  {
    source = {
      File = os.getenv("HOME") .. "/.config/images/term_background.jpg"
    },
    opacity = 1
  }
}

-- Custom keybindings
config.keys = {
  { key = 'Tab',        mods = 'CTRL',       action = act.ActivateTabRelative(1) },
  { key = 'Tab',        mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'O',          mods = 'CTRL',       action = act.ToggleFullScreen },
  { key = 'o',          mods = 'CTRL|ALT',   action = act.ToggleFullScreen },
  { key = '!',          mods = 'CTRL',       action = act.ActivateTab(0) },
  { key = '@',          mods = 'CTRL',       action = act.ActivateTab(1) },
  { key = '#',          mods = 'CTRL',       action = act.ActivateTab(2) },
  { key = '$',          mods = 'CTRL',       action = act.ActivateTab(3) },
  { key = '%',          mods = 'CTRL',       action = act.ActivateTab(4) },
  { key = '^',          mods = 'CTRL',       action = act.ActivateTab(5) },
  { key = '&',          mods = 'CTRL',       action = act.ActivateTab(6) },
  { key = '*',          mods = 'CTRL',       action = act.ActivateTab(7) },
  { key = 'Backspace',  mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'Backspace',  mods = 'ALT|SHIFT',  action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '+',          mods = 'CTRL',       action = act.IncreaseFontSize },
  { key = '-',          mods = 'CTRL',       action = act.DecreaseFontSize },
  { key = 'Backspace',  mods = 'CTRL',       action = act.ResetFontSize },
  { key = 'Insert',     mods = 'CTRL',       action = act.CopyTo 'PrimarySelection' },
  { key = 'Insert',     mods = 'SHIFT',      action = act.PasteFrom 'PrimarySelection' },
  { key = 'K',          mods = 'CTRL',       action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'N',          mods = 'CTRL',       action = act.SpawnWindow },
  { key = 'T',          mods = 'CTRL',       action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'P',          mods = 'CTRL',       action = act.ActivateCommandPalette },
  { key = 'W',          mods = 'CTRL',       action = act.CloseCurrentTab { confirm = false } },
  { key = 'X',          mods = 'CTRL',       action = act.CloseCurrentTab { confirm = false } },
  { key = 'Escape',     mods = 'SHIFT',      action = act.ActivateCopyMode },
  { key = 'F',          mods = 'CTRL',       action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'O',          mods = 'ALT',        action = act.TogglePaneZoomState },
  { key = 'z',          mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
  { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect }, -- To look into this as it seems really useful
  { key = 'U',          mods = 'CTRL|SHIFT', action = act.ScrollByPage(-1) },
  { key = 'D',          mods = 'CTRL|SHIFT', action = act.ScrollByPage(1) },
  { key = '<',          mods = 'CTRL|SHIFT', action = act.MoveTabRelative(-1) },
  { key = '>',          mods = 'CTRL|SHIFT', action = act.MoveTabRelative(1) },
  { key = 'h',          mods = 'ALT',        action = act.ActivatePaneDirection 'Left' },
  { key = 'H',          mods = 'SHIFT|ALT',  action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'l',          mods = 'ALT',        action = act.ActivatePaneDirection 'Right' },
  { key = 'L',          mods = 'SHIFT|ALT',  action = act.AdjustPaneSize { 'Right', 1 } },
  { key = 'k',          mods = 'ALT',        action = act.ActivatePaneDirection 'Up' },
  { key = 'K',          mods = 'SHIFT|ALT',  action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'j',          mods = 'ALT',        action = act.ActivatePaneDirection 'Down' },
  { key = 'J',          mods = 'SHIFT|ALT',  action = act.AdjustPaneSize { 'Down', 1 } },
}

config.key_tables = {
  copy_mode = {
    { key = 'Enter',      mods = 'NONE',  action = act.CopyMode 'MoveToStartOfNextLine' },
    { key = 'Escape',     mods = 'SHIFT', action = act.CopyMode 'Close' },
    { key = 'Escape',     mods = 'NONE',  action = act.CopyMode 'ClearSelectionMode' },
    { key = 'Space',      mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = '$',          mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '$',          mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = ',',          mods = 'NONE',  action = act.CopyMode 'JumpReverse' },
    { key = '0',          mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
    { key = ';',          mods = 'NONE',  action = act.CopyMode 'JumpAgain' },
    { key = 'F',          mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = 'F',          mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = 'G',          mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'G',          mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'H',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportTop' },
    { key = 'H',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
    { key = 'L',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'L',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'M',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'M',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'O',          mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'O',          mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'T',          mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = 'T',          mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = 'V',          mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = 'V',          mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = '^',          mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = '^',          mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'b',          mods = 'NONE',  action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b',          mods = 'ALT',   action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b',          mods = 'CTRL',  action = act.CopyMode 'PageUp' },
    { key = 'c',          mods = 'CTRL',  action = act.CopyMode 'Close' },
    { key = 'd',          mods = 'CTRL',  action = act.CopyMode { MoveByPage = (0.5) } },
    { key = 'e',          mods = 'NONE',  action = act.CopyMode 'MoveForwardWordEnd' },
    { key = 'f',          mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = false } } },
    { key = 'f',          mods = 'ALT',   action = act.CopyMode 'MoveForwardWord' },
    { key = 'f',          mods = 'CTRL',  action = act.CopyMode 'PageDown' },
    { key = 'g',          mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackTop' },
    { key = 'g',          mods = 'CTRL',  action = act.CopyMode 'Close' },
    { key = 'h',          mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
    { key = 'j',          mods = 'NONE',  action = act.CopyMode 'MoveDown' },
    { key = 'k',          mods = 'NONE',  action = act.CopyMode 'MoveUp' },
    { key = 'l',          mods = 'NONE',  action = act.CopyMode 'MoveRight' },
    { key = 'm',          mods = 'ALT',   action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'o',          mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEnd' },
    { key = 'q',          mods = 'NONE',  action = act.CopyMode 'Close' },
    { key = 't',          mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = true } } },
    { key = 'u',          mods = 'CTRL',  action = act.CopyMode { MoveByPage = (-0.5) } },
    { key = 'v',          mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'v',          mods = 'CTRL',  action = act.CopyMode { SetSelectionMode = 'Block' } },
    { key = 'w',          mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
    { key = 'y',          mods = 'NONE',  action = act.Multiple { { CopyTo = 'ClipboardAndPrimarySelection' }, { CopyMode = 'Close' } } },
    { key = 'PageUp',     mods = 'NONE',  action = act.CopyMode 'PageUp' },
    { key = 'PageDown',   mods = 'NONE',  action = act.CopyMode 'PageDown' },
    { key = 'End',        mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = 'Home',       mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
    { key = 'LeftArrow',  mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
    { key = 'LeftArrow',  mods = 'ALT',   action = act.CopyMode 'MoveBackwardWord' },
    { key = 'RightArrow', mods = 'NONE',  action = act.CopyMode 'MoveRight' },
    { key = 'RightArrow', mods = 'ALT',   action = act.CopyMode 'MoveForwardWord' },
    { key = 'UpArrow',    mods = 'NONE',  action = act.CopyMode 'MoveUp' },
    { key = 'DownArrow',  mods = 'NONE',  action = act.CopyMode 'MoveDown' },
    { key = 'n',          mods = 'CTRL',  action = act.CopyMode 'NextMatch' },
    { key = 'p',          mods = 'CTRL',  action = act.CopyMode 'PriorMatch' },
  },
  search_mode = {
    { key = 'Enter',  mods = 'NONE', action = act.CopyMode 'PriorMatch' },
    { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
    { key = 'n',      mods = 'CTRL', action = act.CopyMode 'NextMatch' },
    { key = 'p',      mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
    { key = 'r',      mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
    { key = 'u',      mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
    { key = 'b',      mods = 'CTRL', action = act.CopyMode 'PriorMatchPage' },
    { key = 'f',      mods = 'CTRL', action = act.CopyMode 'NextMatchPage' },
  },
}

return config
