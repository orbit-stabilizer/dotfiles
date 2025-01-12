local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = {"/etc/profiles/per-user/falcon/bin/nu"}

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.color_scheme = "Sea Shells (Gogh)"
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.window_padding = {
  top = 0,
  left = 0,
  right = 0,
  bottom = -4,
}

config.keys = {
  {key = "p", mods = "OPT", action = wezterm.action.ActivateCommandPalette},
  {key = "v", mods = "OPT", action = wezterm.action.SplitHorizontal},
  {key = "s", mods = "OPT", action = wezterm.action.SplitVertical},
  {key = "h", mods = "OPT", action = wezterm.action.ActivatePaneDirection("Left")},
  {key = "j", mods = "OPT", action = wezterm.action.ActivatePaneDirection("Down")},
  {key = "k", mods = "OPT", action = wezterm.action.ActivatePaneDirection("Up")},
  {key = "l", mods = "OPT", action = wezterm.action.ActivatePaneDirection("Right")},
}

return config
