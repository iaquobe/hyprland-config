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

local communication_apps = {
	{class="^net.thunderbird.Thunderbird$"},
	{class="^discord$"},
	{title="^WhatsApp Web$"},
}

for _, app in ipairs(communication_apps) do
	hl.window_rule({
			match = app,
			scrolling_width = 0.8,
	})
end



hl.window_rule({
		match = {class="org.pwmt.zathura"},
		scrolling_width = 0.4,
})
