local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Appearance
config.color_scheme = "nord"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 13.0
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- Other
config.audible_bell = "Disabled"

return config
