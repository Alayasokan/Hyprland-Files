-- Application shortcuts

local browser = "vivaldi"
local terminal = "kitty"
local fileManager = "nemo"
local obsidian = "obsidian"

local spotify = browser .. " --app=https://open.spotify.com"
local youtube = browser .. " --app=https://youtube.com"
local vscode = "code"

-- Rofi
local launcher = "rofi -show drun -show-icons"
local runner = "rofi -show run"
local calculator = "rofi -show calc -modi calc -no-show-match -no-sort"
local emojiSearch = "rofi -modi emoji -show emoji"
local clipboardHistory = "cliphist list | rofi -dmenu | cliphist decode | wl-copy"

return {
	browser = browser,
	terminal = terminal,
	vscode = vscode,
	fileManager = fileManager,

	spotify = spotify,
	obsidian = obsidian,
	youtube = youtube,

	launcher = launcher,
	runner = runner,
	calculator = calculator,
	emojiSearch = emojiSearch,
	clipboardHistory = clipboardHistory,
}
