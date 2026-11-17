---------------------
---- KEYBINDINGS ----
---------------------
local v = require "lua.variables"


-- exit and close
hl.bind(v.mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("dms ipc call lock lock"))
hl.bind(v.mainMod .. " + Q", hl.dsp.exec_cmd("dms ipc call powermenu open"))
hl.bind(v.mainMod .. " + C", hl.dsp.window.close())



hl.bind(v.mainMod .. " + O", hl.dsp.exec_cmd("dms ipc call control-center toggle"))
hl.bind(v.mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("dms ipc call dash toggle overview"))
hl.bind(v.mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("dms ipc call dash toggle weather"))
hl.bind(v.mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("dms ipc call dash toggle media"))
hl.bind(v.mainMod .. " + T", hl.dsp.exec_cmd("dms ipc call mux toggle"))

-- hl.bind(v.mainMod .. "+ SHIFT + Q", hl.dsp.exec_cmd("lock_and_suspend"))
-- hl.bind(v.mainMod .. " + Q",				hl.dsp.exec_cmd("hyprlock"))


-- Default Programs 
-- hl.bind(v.mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("dms ipc call spotlight-bar toggle"))
hl.bind(v.mainMod .. " + D", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(v.mainMod .. " + I", hl.dsp.exec_cmd("dms ipc call widget toggle claudeCodeUsage"))
hl.bind(v.mainMod .. " + Return", hl.dsp.exec_cmd(v.terminal))
-- hl.bind(v.mainMod .. " + Return", hl.dsp.exec_cmd(v.terminal))

hl.bind(v.mainMod .. " + SHIFT + Return", function()
	for _, win in ipairs(hl.get_workspace_windows(hl.get_active_workspace())) do
			if win.class == v.terminal then
					hl.dispatch(hl.dsp.focus({ window = win }))
					return
			end
	end
end)



-- Browser
hl.bind(v.mainMod .. " + SHIFT + U", hl.dsp.exec_cmd(v.browser))
hl.bind(v.mainMod .. " + U", function()
	for _, win in ipairs(hl.get_workspace_windows(hl.get_active_workspace())) do
			if win.class == v.browser then
					hl.dispatch(hl.dsp.focus({ window = win }))
					return
			end
	end
	hl.exec_cmd(v.browser)
end)

-- Notifications 
hl.bind(v.mainMod .. " + N", hl.dsp.exec_cmd("dms ipc call notifications toggle"))
-- hl.bind(v.mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client --close-latest"))

-- Windows
-- hl.bind(v.mainMod .. " + F", hl.dsp.window.fullscreen({mode="maximized", layout_aware=false}))
hl.bind(v.mainMod .. " + F", hl.dsp.window.fullscreen_state({internal=1, client=-1, layout_aware=true}))
hl.bind(v.mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
-- hl.bind(v.mainMod .. " + T", hl.dsp.window.pseudo())
hl.bind(v.mainMod .. " + S", hl.dsp.window.float())
hl.bind(v.mainMod .. " + SHIFT + P", hl.dsp.window.pin())


-- -- Groups
-- hl.bind(v.mainMod .. " + O", hl.dsp.group.next())
-- hl.bind(v.mainMod .. " + SHIFT + O", hl.dsp.group.toggle())

-- Workspace
hl.bind(v.mainMod .. " + W", hl.dsp.workspace.move({monitor="+1"}))

-- Focus
hl.bind(v.mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(v.mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(v.mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up"   , group_aware=true }))
hl.bind(v.mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" , group_aware=true }))
hl.bind(v.mainMod .. " + P", hl.dsp.focus({ last = true }))


for i = 1, 10 do
    local key = i % 10
    hl.bind(v.mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(v.mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad
hl.bind(v.mainMod .. " + space",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(v.mainMod .. " + SHIFT + space", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with v.mainMod + scroll
hl.bind(v.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(v.mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(v.mainMod .. " + up",   hl.dsp.focus({ workspace = "e-1"}))
hl.bind(v.mainMod .. " + down", hl.dsp.focus({ workspace = "e+1"}))


-- Move/resize windows with v.mainMod + LMB/RMB and dragging
hl.bind(v.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true})
hl.bind(v.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true})

-- -- Laptop multimedia keys for volume and LCD brightness
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
-- hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
-- hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
--
-- -- Requires playerctl
-- hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
-- --



hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 3"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 3"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("dms ipc call audio micmute"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("dms ipc call mpris playPause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("dms ipc call mpris playPause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("dms ipc call mpris previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("dms ipc call mpris next"), { locked = true })
hl.bind("CTRL + XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call mpris increment 3"), { locked = true, repeating = true })
hl.bind("CTRL + XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call mpris decrement 3"), { locked = true, repeating = true })
hl.bind("Print", hl.dsp.exec_cmd("dms screenshot"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd([[dms ipc call brightness increment 5 ""]]), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd([[dms ipc call brightness decrement 5 ""]]), { locked = true, repeating = true })
