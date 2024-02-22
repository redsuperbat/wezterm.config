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
-- config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

-- for i = 1, 9 do
-- keybind(tostring(i), "LEADER", act.ActivateTab(i - 1))
-- end
-- keybind("0", "LEADER", act.ActivateTab(-1))
-- keybind("x", "LEADER", act.CloseCurrentPane({ confirm = false }))
-- keybind("c", "LEADER", act.SpawnTab("CurrentPaneDomain"))

-- Eu keyboards
keybind("(", "ALT|SHIFT", act.SendString("{"))
keybind(")", "ALT|SHIFT", act.SendString("}"))
keybind("/", "ALT|SHIFT", act.SendString("\\"))
-- Pane Management
-- keybind("%", "LEADER", act.SplitHorizontal({ domain = "CurrentPaneDomain" }))
-- keybind('"', "LEADER", act.SplitVertical({ domain = "CurrentPaneDomain" }))

-- keybind("h", "LEADER", act.ActivatePaneDirection("Left"))
-- keybind("j", "LEADER", act.ActivatePaneDirection("Down"))
-- keybind("k", "LEADER", act.ActivatePaneDirection("Up"))
-- keybind("l", "LEADER", act.ActivatePaneDirection("Right"))

keybind("v", "LEADER", act.ActivateCopyMode)
-- keybind("z", "LEADER", act.TogglePaneZoomState)
-- View Management
-- keybind("Enter", "ALT", act.ToggleFullScreen)
keybind("-", "CMD", act.DecreaseFontSize)
keybind("+", "CMD", act.IncreaseFontSize)
keybind("0", "CMD", act.ResetFontSize)
-- and finally, return the configuration to wezterm
return config
