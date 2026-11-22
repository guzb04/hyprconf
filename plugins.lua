if hl.plugin.hyprglass then
	local hg = hl.plugin.hyprglass

	hg.config({
		default_theme = "dark",
		default_preset = "edgy",
		tint_color = 0x8899aa22,
    manage_window_blur = true,

		brightness = 0.9,
		dark = { brightness = 0.82 },
		light = { adaptive_boost = 0.5 },

		layers = { enabled = true },
	})

	-- Layer surfaces: each call whitelists the namespace and configures it
	hg.layer("waybar", { preset = "subtle", mask_threshold = 0.05 })
	hg.layer("swaync")
	hg.layer("quickshell:bezel", { preset = "ui", mask_threshold = 0.3 })
	hg.layer("debug-panel", { exclude = true })
	hl.window_rule({ match = { class = "kitty" }, tag = "+hyprglass_preset_edgy" })

	local function tint(c, alpha)
		return tonumber(c:match("%x%x%x%x%x%x"), 16) * 256 + math.floor(alpha * 255 + 0.5)
	end
	-- Presets
	hg.preset("clear", {
		glass_opacity = 0.5,
		blur_strength = 1.5,
		dark = { brightness = 0.7 },
		light = { brightness = 1.2 },
	})
	hg.preset("edgy", {
		blur_strength = 0.3, -- low blur
		blur_iterations = 1, -- fewer passes for a lighter frosted look
		refraction_strength = 1.0, -- strong edge refraction
		refraction_flow = 1.0, -- strong edge refraction
		refraction_spread = 0.5, -- strong edge refraction
		chromatic_aberration = 0.6, -- visible color fringing at the rim
		tint_color = tint("000000", 0.20),
		specular_strength = 1.0, -- shiny highlights
		edge_thickness = 0.12, -- slightly thicker edge transition
		glass_opacity = 1.0, -- adjust overall transparency as desired
	})
  hg.preset("test_refraction", {
    blur_strength = 2.0,
    blur_iterations = 3,
    refraction_strength = 1.0,
    chromatic_aberration = 1.0,
    edge_thickness = 0.12,
    glass_opacity = 1.0,
    tint_color = 0x00000080,  -- black 50% alpha
})


	hg.preset("glass", {
		glass_opacity = 0.5, -- adjust overall transparency as desired
		blur_strength = 5, -- low blur
		blur_iterations = 5, -- fewer passes for a lighter frosted look
		chromatic_aberration = 0.3, -- visible color fringing at the rim
		fresnel_strength = 0.3, -- bright edge glow
		edge_thickness = 0.1, -- slightly thicker edge transition
		tint_color = tint("000000", 0.50),
		lens_distortion = 1.0,
    self_sample = 0.5,
		contrast = 1.5,
		saturation = 1,
		vibrancy = 0.4,
		vibrancy_darkness = 2.0,
		adaptive_boost = 0.8,
	})

	hg.preset("contrasted", {
		inherits = "high_contrast",
		contrast = 1.2,
		adaptive_dim = 1.5,
		dark = { tint_color = 0x02142aa9 },
	})
end
