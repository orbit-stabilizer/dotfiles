local wezterm = require("wezterm")
local config = wezterm.config_builder()
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.color_scheme = "Everforest Dark (Gogh)"
-- config.window_decorations = "RESIZE"
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
	{
		key = "w",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
		end),
	},
	{
		key = "W",
		mods = "ALT",
		action = resurrect.window_state.save_window_action(),
	},
	{
		key = "T",
		mods = "ALT",
		action = resurrect.tab_state.save_tab_action(),
	},
	{
		key = "s",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
			resurrect.window_state.save_window_action()
		end),
	},
	{
		key = "r",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
				local type = string.match(id, "^([^/]+)") -- match before '/'
				id = string.match(id, "([^/]+)$") -- match after '/'
				id = string.match(id, "(.+)%..+$") -- remove file extention
				local opts = {
					relative = true,
					restore_text = true,
					on_pane_restore = resurrect.tab_state.default_on_pane_restore,
				}
				if type == "workspace" then
					local state = resurrect.state_manager.load_state(id, "workspace")
					resurrect.workspace_state.restore_workspace(state, opts)
				elseif type == "window" then
					local state = resurrect.state_manager.load_state(id, "window")
					resurrect.window_state.restore_window(pane:window(), state, opts)
				elseif type == "tab" then
					local state = resurrect.state_manager.load_state(id, "tab")
					resurrect.tab_state.restore_tab(pane:tab(), state, opts)
				end
			end)
		end),
	},
}

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
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
