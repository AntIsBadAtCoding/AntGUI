local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/AntIsBadAtCoding/AntGUI/refs/heads/main/Source.lua')) --loads the source

local window = lib.New("Ants UI lib") -- makes the window

lib.SetKeybind(Enum.KeyCode.RightAlt) -- sets the keybind to open and close the ui

local tab = window.MakeTab("rbxassetid://7205257578", 1) -- makes a tab

local tab2 = window.MakeTab("rbxassetid://7205257578", 2)

-- makebutton("name", tab, ui placement, function)
local button1 = window.MakeButton("button1", 1, 1, function() -- makes a button
	print("button pressed")
end)

local button2 = window.MakeButton("button2", 2, 1, function()
	print("button2 pressed")
end)

-- maketoggle("name", tab, ui placement, func) val will always be true or false
local toggle1 = window.MakeToggle("Toggle", 1, 2, function(val) -- makes a toggle
	print(val)
end)

-- makeslider("slidername", min, max, tab, ui placement, function) vall will be somewhere in the range you set
local slider1 = window.MakeSlider("Slider name", 0, 50, 1, 3, function(val) -- makes a slider
	print(val)
end)

window.FixButtons(1)
