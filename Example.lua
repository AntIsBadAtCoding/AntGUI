local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/AntIsBadAtCoding/AntGUI/refs/heads/main/Source.lua'))

lib:New("Ants UI lib")

lib.SetKeybind(Enum.KeyCode.RightAlt)

lib.MakeTab("rbxassetid://7205257578", Color3.fromRGB(200, 100, 100), 1)

lib.MakeTab("rbxassetid://7205257578", Color3.fromRGB(200, 100, 100), 2)

lib.MakeButton("Button", Color3.fromRGB(200, 100, 100), 1, 1, function()
	print("test")
end)

lib.MakeToggle("Toggle", Color3.fromRGB(200, 100, 100), 1, 2, function()
	
end)
