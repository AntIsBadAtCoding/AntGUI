# DOCUMENTATION

To load the library put this string:
```local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/AntIsBadAtCoding/AntGUI/refs/heads/main/Source.lua'))```

To make the window do
```lib:New("TITLE")```

To set the keybind for the ui to disappear and re appear do
```lib.SetKeybind(Enum.KeyCode.RightAlt)```
you can replace RightAlt with any Keybind/Keycode

To make a tab do
```lib.MakeTab("rbxassetid://7205257578", Color3.fromRGB(200, 100, 100), 1)```
you can replace any thing here its just
MakeTab("asset code", color3 code, tab number)

To make a button do
```
lib.MakeButton("Button", Color3.fromRGB(200, 100, 100), 1, 1, function()
	print("test")
end)
```
then to make a toggle do
```
lib.MakeToggle("Toggle", Color3.fromRGB(200, 100, 100), 1, 2, function()
	
end)
```
I might make more later uh
