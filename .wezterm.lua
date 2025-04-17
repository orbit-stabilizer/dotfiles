local wezterm = require("wezterm")
local config = wezterm.config_builder()
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.color_scheme = "Tokyo Night"
config.window_decorations = "RESIZE"
config.window_padding = {
	top = 0,
	left = 0,
	right = 0,
	bottom = 0,
}

config.keys = {
	{ key = "\\", mods = "CMD", action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 20 } }) },
	{
		key = "|",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitPane({ direction = "Right", size = { Percent = 20 } }),
	},
	{ key = "p", mods = "CMD", action = wezterm.action.ActivateCommandPalette },
	{ key = "/", mods = "CMD", action = wezterm.action.TogglePaneZoomState },
	{ key = "n", mods = "CMD|SHIFT", action = wezterm.action.ShowTabNavigator },
	{
		key = "e",
		mods = "CMD",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			-- initial_value = 'My Tab Name',
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

config.use_fancy_tab_bar = false
config.status_update_interval = 100
wezterm.on("update-right-status", function(window, pane)
	local basename = function(s)
		return string.gsub(tostring(s), "(.*[/\\])(.*)", "%2")
	end

	local workspace = window:active_workspace()
	local cwd = basename(pane:get_current_working_dir())
	local cmd = basename(pane:get_foreground_process_name())
	local time = wezterm.strftime("%H:%M")

	window:set_right_status(wezterm.format({
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. workspace },
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "FFB86C" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = " | " },
	}))
end)

config.default_prog = { "/opt/homebrew/bin/nu" }

smart_splits.apply_to_config(config)

return config
