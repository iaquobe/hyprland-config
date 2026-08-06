local hl = hl
------------------
---- MONITORS ----
------------------

--- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto",      scale = "1.5"})
hl.monitor({ output = "",      mode = "preferred", position = "auto-left", scale = "1"})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "rofi -show combi -modes combi -combi-modes 'window,drun,run'"
local browser     = "brave-browser"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- Autostart necessary processes (like notifications daemons, status bars, etc.)
hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar")
  hl.exec_cmd("swaync")
  hl.exec_cmd("swaybg -i ~/.config/hypr/wallpapers/Tranquility.png")
  hl.exec_cmd("lxpolkit")
end)


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
			inactive_border = "rgba(fbf1c7ee)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
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
			color        = 0xee1a1a1a,
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
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
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
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "vert",
    action = "workspace"
})


---------------------
---- KEYBINDINGS ----
---------------------

-- see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local mainMod = "SUPER"

-- exit and close
hl.bind(mainMod .. "+ SHIFT + Q", hl.dsp.exec_cmd("lock_and_suspend"))
hl.bind(mainMod .. " + Q",				hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())

-- Default Programs 
hl.bind(mainMod .. " + D",			hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + U", 			hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))

-- Notifications 
hl.bind(mainMod .. " + N",				 hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client --close-latest"))

-- Windows
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({mode="maximized"}))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + S", hl.dsp.window.float())
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pin())

-- Groups
hl.bind(mainMod .. " + O", hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.group.toggle())

-- Workspace
hl.bind(mainMod .. " + W", hl.dsp.workspace.move({monitor="+1"}))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" , group_aware=true }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right", group_aware=true }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up"   , group_aware=true }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" , group_aware=true }))


for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad
hl.bind(mainMod .. " + space",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + up",   hl.dsp.focus({ workspace = "e-1"}))
hl.bind(mainMod .. " + down", hl.dsp.focus({ workspace = "e+1"}))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.workspace_rule({ workspace = "2", layout="master"})
hl.workspace_rule({ workspace = "3", layout="scrolling"})
