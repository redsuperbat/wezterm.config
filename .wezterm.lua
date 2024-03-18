local wezterm = require("wezterm")

local config = {}
-- Use config builder if available
if wezterm.config_builder then
	config = wezterm.config_builder()
end
config.keys = {}
-- Default hyperlinks so they are clickable
config.hyperlink_rules = wezterm.default_hyperlink_rules()

local keybind = function(key, mod, action)
	table.insert(config.keys, { key = key, mods = mod, action = action })
end

local act = wezterm.action

-- Eu keyboards
keybind("(", "ALT|SHIFT", act.SendString("{"))
keybind(")", "ALT|SHIFT", act.SendString("}"))
keybind("/", "ALT|SHIFT", act.SendString("\\"))

keybind("v", "LEADER", act.ActivateCopyMode)

keybind("-", "CMD", act.DecreaseFontSize)
keybind("+", "CMD", act.IncreaseFontSize)
keybind("0", "CMD", act.ResetFontSize)
return config
