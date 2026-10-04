--- Frequently used applications
local terminal = "kitty"
local fileManager = "nemo"
local browser = "vivaldi"
local music = browser .. " --app=https://app.spotify.com"
local obsidian = "obsidian"
local youtube = browser .. " --app=https://youtube.com"
local vscode = "visual studio code"

-- Rofi menus
local launcher = "rofi -show drun -show-icons"
local runner = "rofi -show run"
local calculator = "rofi -show calc -modi calc -no-show-match -no-sort"
local emojiSearch = "rofi -modi emoji -show emoji"
local clipboardHistory = "cliphist list | rofi -dmenu | cliphist decode | wl-copy"
