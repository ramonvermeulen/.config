local wezterm = require("wezterm")

local config = {}
config.force_reverse_video_cursor = true
config.debug_key_events = true
config.color_scheme = "Ibm 3270 (High Contrast) (Gogh)"
config.font_size = 16
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

-- tmux
config.leader = { key = "`", mods = "OPT", timeout_milliseconds = 2000 }
config.keys = {
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "w",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "b",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "\\",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "z",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	-- config to be able to scroll up down in vim way CTRL - u/d or k/j
	{
		mods = "CTRL",
		key = "u",
		action = wezterm.action.ScrollByLine(-15),
	},
	{
		mods = "CTRL",
		key = "d",
		action = wezterm.action.ScrollByLine(15),
	},
	{
		mods = "CTRL",
		key = "k",
		action = wezterm.action.ScrollByLine(-1),
	},
	{
		mods = "CTRL",
		key = "j",
		action = wezterm.action.ScrollByLine(1),
	},
}

-- make splits start at 1
config.tab_and_split_indices_are_zero_based = false

for i = 1, 9 do
	-- leader + number to activate that tab or create it if it doesn't exist
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			local tabs = window:mux_window():tabs()
			if #tabs >= i then
				-- tab exists, activate it
				window:perform_action(wezterm.action({ ActivateTab = i - 1 }), pane)
			else
				-- tab doesn't exist, create new tab
				-- (gaps are unfortunately not supported e.g. having [1,2,4,6])
				window:perform_action(wezterm.action.SpawnTab("CurrentPaneDomain"), pane)
			end
		end),
	})
end

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#1f1f28" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1f1f28" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#1f1f28" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

return config
