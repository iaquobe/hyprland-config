------------------
---- MONITORS ----
------------------

--- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto",      scale = "1.5"})
hl.monitor({ output = "",      mode = "preferred", position = "auto-left", scale = "1"})



-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- hl.on("hyprland.start", function ()
--   hl.exec_cmd("waybar")
--   hl.exec_cmd("swaync")
--   hl.exec_cmd("swaybg -i ~/.config/hypr/wallpapers/Tranquility.png")
--   hl.exec_cmd("lxpolkit")
-- end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GDK_SCALE", "2")
-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in  = 5,
		-- gaps_out = {5, 10, 10, 10},
		gaps_out = 10,
		border_size = 2,

		col = {
			active_border = {colors = {"rgba(d79921ee)", "rgba(cc2441ee)"}, angle=45},
			inactive_border = "rgba(fbf1c700)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "scrolling",
	},

	decoration = {
		rounding       = 5,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity   = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled      = true,
			range        = 4,
			render_power = 3,
			-- color        = 0xee1a1a1a,
		},

		blur = {
			enabled   = false,
			size      = 3,
			passes    = 1,
			vibrancy  = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	group = {
		col = { border_active = {colors = {"rgba(d79921ff)", "rgba(cc2441ff)"}, angle = 45}},
		groupbar = {
			col = {
				inactive = "rgba(fbf1c7ff)",
				active = "rgba(ebdbb2ff)",
			},
			text_color = "rgb(665c54)",
		},
	},
})

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "windows",      enabled = true,  speed = 1,    spring = "easy" })
hl.animation({ leaf = "windowsIn",    enabled = true,  speed = 1,    spring = "easy" })
hl.animation({ leaf = "windowsOut",   enabled = true,  speed = 1,    bezier = "linear", style = "popin 60%" })
hl.animation({ leaf = "border",       enabled = true,  speed = 1,    spring = "easy" })
hl.animation({ leaf = "borderangle",  enabled = true,  speed = 1,    spring = "easy" })
hl.animation({ leaf = "workspaces",				enabled = true,  speed = 1,    spring = "easy", style="slidevert" })
hl.animation({ leaf = "specialWorkspace",	enabled = true,  speed = 1,    spring = "easy", style="fade"})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
		focus_fit_method = 1,
		follow_min_visible = 1,
		column_width = 0.50,
		wrap_focus = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout  = "us",
		kb_variant = "altgr-intl",
		kb_model   = "",
		kb_options = "",
		kb_rules   = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
			disable_while_typing =true,
		},
	},
})


hl.device({
	name = "at-translated-set-2-keyboard",
	kb_options = "caps:swapescape"
})

hl.gesture({
	fingers = 3,
	direction = "vert",
	action = "workspace"
})



hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "scroll_move"
})
