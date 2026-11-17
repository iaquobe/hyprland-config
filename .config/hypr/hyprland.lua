-- Hyprland configuration (Lua) — https://wiki.hypr.land/Configuring/Start/

local secrets = os.getenv("HOME") .. "/.secrets"
os.execute("sh -c 'source " .. secrets .. "'")

-- DMS_STARTUP_BEGIN
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user start hyprland-session.target")
end)
-- DMS_STARTUP_END

-- general options 
require "lua.config"

-- general keybindings
require "lua.keybindings"

-- workspace behaviour
require "lua.workspaces"

-- window rules
require "lua.windows"

-- DMS Include Configs
-- require("dms.windowrules")
-- require("dms.binds")
-- require("dms.binds-user")
-- require("dms.colors")

-- DMS Include Configs
require("dms.outputs")
