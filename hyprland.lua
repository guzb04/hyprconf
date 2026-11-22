-- Source additional config files
require("env")
require("keybinds")
require("plugins")

-----------------
--- MONITORS ---
-----------------

hl.monitor({
	output = "HDMI-A-1",
	mode = "2560x1440@99.95Hz",
	position = "auto",
	scale = 1,
})

-------------------
--- AUTOSTART ---
-------------------
-- Autostart processes
--
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & hyprpaper & hyprpm reload") -- Execute waybar, hyprpaper
end)

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")

---------------------
--- LOOK AND FEEL ---
---------------------
-- General settings
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 3,
		col = {
			active_border = "rgba(fabd2fff)",
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	-- Decoration settings
	decoration = {
		rounding = 0,
		blur = {
			enabled = true,
			size = 3,
			passes = 3,
			new_optimizations = false,
			vibrancy = 0.1696,
		},
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(000000aa)",
		},
	},

	-- Animation settings
	animations = {
		enabled = true,
		animation = {
			{ name = "windows", enabled = true, speed = 7, curve = "myBezier" },
			{ name = "windowsOut", enabled = true, speed = 7, curve = "default", style = "popin 80%" },
			{ name = "border", enabled = true, speed = 10, curve = "default" },
			{ name = "borderangle", enabled = true, speed = 8, curve = "default" },
			{ name = "fade", enabled = true, speed = 7, curve = "default" },
			{ name = "workspaces", enabled = true, speed = 6, curve = "default" },
		},
	},

	-- Dwindle layout
	dwindle = {
		preserve_split = true,
	},

	-- Master layout
	master = {
		new_status = "master",
	},

	-- Misc settings
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = true,
		vrr = 1,
	},

	-----------------
	--- INPUT ---
	-----------------
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
		},
	},

	-- Per-device config

	-- Cursor settings
	cursor = {
		no_hardware_cursors = true,
	},
})

---------------------
--- KEYBINDINGS ---
---------------------
local mainMod = "SUPER"

-- Note: You'll need to define your actual keybindings here
-- Example:
-- bind(mainMod, "Q", "exec", "kitty")
-- bind(mainMod, "C", "exec", "$browser")

-- Autostart with workspace rules (moved from exec-once)

---------------------------
--- WINDOW AND WORKSPACE RULES ---
---------------------------
-- Window rules (v2 syntax)
hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
    opacity = "0.95 0.6",
})
hl.window_rule({
    match  = { class = "^(zen)$" },
    opacity = "0.95 0.6",
})
hl.window_rule({
    match   = { class = "^(Spotify)$" },
    opacity = "0.95 0.65",   -- active 0.95, inactive 0.85
})
