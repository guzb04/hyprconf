-- keybinds.lua
-- Hyprland keybindings in Lua syntax

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun"
local browser = "zen-browser"

-- ==================== APPLICATION LAUNCHERS ====================
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + N", hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + V", hl.dsp.window.float())
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + P", hl.dsp.window.pseudo()) -- dwindle pseudo mode (toggle split)
hl.bind("SUPER + G", hl.dsp.exec_cmd("killall hyprland && gamescope"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
hl.bind("SUPER +  SHIFT + P", hl.dsp.exec_cmd("killall waybar && waybar"))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))

-- ==================== VIM-LIKE MOVEMENT ====================
-- movefocus: l=left, r=right, u=up, d=down
hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))

-- ==================== WORKSPACE SWITCHING ====================
-- Switch to workspace with mainMod + [0-9]
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to workspace with mainMod + SHIFT + [0-9]
hl.bind("SUPER +  SHIFT + 1",hl.dsp.window.move({workspace =1 })  )
hl.bind("SUPER+   SHIFT + 2",hl.dsp.window.move({workspace =2})  )
hl.bind("SUPER+   SHIFT + 3",hl.dsp.window.move({workspace =3})  )
hl.bind("SUPER+   SHIFT + 4",hl.dsp.window.move({workspace =4})  )
hl.bind("SUPER+   SHIFT + 5",hl.dsp.window.move({workspace =5})  )
hl.bind("SUPER+   SHIFT + 6",hl.dsp.window.move({workspace =6})  )
hl.bind("SUPER+   SHIFT + 7",hl.dsp.window.move({workspace =7})  )
hl.bind("SUPER+   SHIFT + 8",hl.dsp.window.move({workspace =8})  )
hl.bind("SUPER+   SHIFT + 9",hl.dsp.window.move({workspace =9})  )
hl.bind("SUPER+   SHIFT + 0",hl.dsp.window.move({workspace =10})  )

-- ==================== SPECIAL WORKSPACE (SCRATCHPAD) ====================
hl.bind("SUPER + S",  hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER +  SHIFT + S", hl.dsp.window.move({workspace = "special:magic"}))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())

-- ==================== SCROLL THROUGH WORKSPACES ====================
hl.bind("SUPER + mouse_down", hl.dsp.focus({workspace = "e+1"}))
hl.bind("SUPER + mouse_up", hl.dsp.focus({workspace ="e-1"}))

-- ==================== MOUSE BINDINGS (MOVE/RESIZE) ====================
-- mouse:272 = left button, mouse:273 = right button
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeat_key = false, locked = true })
