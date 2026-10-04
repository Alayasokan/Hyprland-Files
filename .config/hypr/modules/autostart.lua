-- Autostart commands
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 21")
	hl.exec_cmd("playerctld daemon")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("~/.config/waybar/scripts/launch.sh")
	hl.exec_cmd("awww-daemon &")
	hl.exec_cmd(
		"sleep 1 && awww img /home/alayak/Pictures/wallpapers/main.png --transition-type grow --transition-duration 2 --transition-fps 60"
	)
end)
