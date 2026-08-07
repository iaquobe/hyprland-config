local workspaces = {
	["1"] = "scrolling",
	["2"] = "scrolling",
	["3"] = "scrolling",
	["4"] = "scrolling",
	["5"] = "scrolling",
	["6"] = "scrolling",
	["7"] = "scrolling",
	["8"] = "scrolling",
	["9"] = "scrolling",
	["0"] = "scrolling",
	["special:magic"] = "master",
}

-- workspace layouts
for ws, layout in pairs(workspaces) do
	hl.workspace_rule({ workspace = ws, layout=layout})
end

-- Center windows on workspace 10
hl.on("workspace.active", function(ws)
	if ws.id == 10 then
		hl.config({ scrolling = { focus_fit_method = 0 }})
	else
		hl.config({ scrolling = { focus_fit_method = 1 }})
	end
end)



local function layout_bindings(actions)
	return function ()
		-- either workspace or special workspace
		local ws = hl.get_active_workspace().name
		local sws = hl.get_active_special_workspace()
		ws = sws and sws.name or ws

		local action = ws and actions[workspaces[ws]]
		if action then
			hl.dispatch(action)
		end
	end
end

local mainMod = "SUPER"
hl.bind(mainMod .. " + SHIFT + l", layout_bindings({
	scrolling = hl.dsp.layout("swapcol r"),
	dwindle = hl.dsp.window.move({ direction = "right", group_aware=true }),
	master  = hl.dsp.window.move({ direction = "right", group_aware=true }),
}))

hl.bind(mainMod .. " + SHIFT + h", layout_bindings({
	scrolling = hl.dsp.layout("swapcol l"),
	dwindle = hl.dsp.window.move({ direction = "left", group_aware=true }),
	master  = hl.dsp.window.move({ direction = "left", group_aware=true }),
}))

hl.bind(mainMod .. " + comma", layout_bindings({
	scrolling = hl.dsp.layout("consume_or_expel prev"),
	master    = hl.dsp.layout("rollnext"),
}))

hl.bind(mainMod .. " + period", layout_bindings({
	scrolling = hl.dsp.layout("consume_or_expel next"),
	master    = hl.dsp.layout("rollprev"),
}))


-- scrolling layout
hl.bind(mainMod .. " + A", layout_bindings({
	scrolling = hl.dsp.layout("colresize +0.05"),
	master    = hl.dsp.layout("mfact +0.05"),
}), {repeating=true})

hl.bind(mainMod .. " + X", layout_bindings({
	scrolling = hl.dsp.layout("colresize -0.05"),
	master    = hl.dsp.layout("mfact -0.05"),
}), {repeating=true})


hl.bind(mainMod .. " + left", layout_bindings({
	scrolling = hl.dsp.layout("move +800"),
}), {repeating=true})
hl.bind(mainMod .. " + right", layout_bindings({
	scrolling = hl.dsp.layout("move -800"),
}), {repeating=true})
