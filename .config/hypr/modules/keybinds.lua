-- Keybindings
local apps = require("modules/apps")

local mainMod = "SUPER"
local secondMod = "SUPER + SHIFT"

-- Window basics
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Screenshot
-- Screenshots
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("grim ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"))
hl.bind(
	secondMod .. " + P",
	hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png")
)
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Rofi menus
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(apps.launcher))
hl.bind(secondMod .. " + Space", hl.dsp.exec_cmd(apps.runner))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(apps.calculator))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(apps.emojiSearch))
hl.bind(secondMod .. " + C", hl.dsp.exec_cmd(apps.clipboardHistory))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind(secondMod .. " + W", hl.dsp.exec_cmd("~/.local/bin/next-wallpaper"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("python3 ~/.config/lthemes/lthemes.py select"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("wlogout"))

-- Applications
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(apps.browser))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(apps.terminal))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(apps.fileManager))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(apps.spotify))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(apps.obsidian))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(apps.youtube))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(apps.vscode))

-- Focus movement
-- hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
-- hl.bind(mainMod .. " + i",    hl.dsp.focus({ direction = "up" }))
-- hl.bind(mainMod .. " + k",  hl.dsp.focus({ direction = "down" }))

local function workspaceIsScrolling()
	return hl.get_active_workspace().tiled_layout == "scrolling"
end

hl.bind(mainMod .. " + l", function()
	if workspaceIsScrolling() then
		hl.dispatch(hl.dsp.layout("focus r"))
	else
		hl.dispatch(hl.dsp.focus({ direction = "right" }))
	end
end)

hl.bind(mainMod .. " + j", function()
	if workspaceIsScrolling() then
		hl.dispatch(hl.dsp.layout("focus l"))
	else
		hl.dispatch(hl.dsp.focus({ direction = "left" }))
	end
end)

local function workspaceIsMonocle()
	return hl.get_active_workspace().tiled_layout == "monocle"
end

hl.bind(mainMod .. " + k", function()
	if workspaceIsMonocle() then
		hl.dispatch(hl.dsp.layout("cyclenext"))
	else
		hl.dispatch(hl.dsp.focus({ direction = "down" }))
	end
end)

hl.bind(mainMod .. " + i", function()
	if workspaceIsMonocle() then
		hl.dispatch(hl.dsp.layout("cycleprev"))
	else
		hl.dispatch(hl.dsp.focus({ direction = "up" }))
	end
end)

-- Toggle floating / maximize
hl.bind(secondMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(secondMod .. " + T", hl.dsp.window.float({ action = "toggle" }))

-- Window movement / swap
hl.bind(secondMod .. " + i", hl.dsp.window.move({ direction = "up" }))
hl.bind(secondMod .. " + k", hl.dsp.window.move({ direction = "down" }))
hl.bind(secondMod .. " + l", function()
	if workspaceIsScrolling() then
		hl.dispatch(hl.dsp.layout("swapcol r"))
	else
		hl.dispatch(hl.dsp.window.move({ direction = "right" }))
	end
end)
hl.bind(secondMod .. " + j", function()
	if workspaceIsScrolling() then
		hl.dispatch(hl.dsp.layout("swapcol l"))
	else
		hl.dispatch(hl.dsp.window.move({ direction = "left" }))
	end
end)

-- Workspaces
for i = 1, 10 do
	local key = i % 10 -- 10 maps to 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse window actions
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
