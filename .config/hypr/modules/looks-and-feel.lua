-- General appearance and behaviour
hl.config({
	general = {
		gaps_in = 7,
		gaps_out = 15,
		border_size = 0,
		col = {
			active_border = { colors = { "rgba(90ff90ff)", "rgba(32cd32ff)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "scrolling",
	},

	decoration = {
		rounding = 15,
		rounding_power = 2,
		active_opacity = 1,
		inactive_opacity = 0.7,
		shadow = {
			enabled = true,
			range = 7,
			render_power = 3,
			color = 0xee1a1a1a,
		},
		blur = {
			enabled = true,
			size = 8,
			passes = 2,
			vibrancy = 0.2,
			new_optimizations = true,
		},
	},

	animations = {
		enabled = true,
	},
})
