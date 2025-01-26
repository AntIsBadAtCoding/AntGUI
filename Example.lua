local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/AntIsBadAtCoding/AntGUI/refs/heads/main/Source.lua')) --loads the source

lib.New("Ants UI lib") -- makes the window

lib.SetKeybind(Enum.KeyCode.RightAlt) -- sets the keybind to open and close the ui

lib.MakeTab("rbxassetid://7205257578", 1) -- makes a tab

lib.MakeTab("rbxassetid://7205257578", 2)

-- makebutton("name", tab, ui placement, function)
lib.MakeButton("button1", 1, 1, function() -- makes a button
	print("button pressed")
end)

lib.MakeButton("button2", 2, 1, function()
	print("button2 pressed")
end)

-- maketoggle("name", tab, ui placement, func) val will always be true or false
lib.MakeToggle("Toggle", 1, 2, function(val) -- makes a toggle
	print(val)
end)

local sliderval = 0

-- makeslider("slidername", min, max, tab, ui placement, function) vall will be somewhere in the range you set
lib.MakeSlider("Slider name", 0, 50, 1, 3, function(val) -- makes a slider
	if sliderval ~= val then
		print(val)
		sliderval = val
	end
end)

lib.FixButtons(1)
