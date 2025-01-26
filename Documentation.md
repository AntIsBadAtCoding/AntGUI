# DOCUMENTATION

To load the library put this string:
```
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/AntIsBadAtCoding/AntGUI/refs/heads/main/Source.lua'))
```

To make the window do
```
lib:New("Name")
```

To set the keybind for the ui to disappear and re appear do
```
lib.SetKeybind(Enum.KeyCode.LeftAlt)
```
you can replace RightAlt with any Keybind/Keycode

To make a tab do
```
lib.MakeTab("7205257578", 1)
```

To make a button do
```
lib.MakeButton("button", 1, 1, function()
	print("pressed")
end)
```
then to make a toggle do
```
lib.MakeToggle("toggle", 1, 2, function(val)
	print(val)
end)
```
To make a Slider do
```
lib.MakeSlider("slider", 1, 100, 1, 3, function(val)
	print(val)
end)
```
if the buttons are bugged (tab 2 buttons on tab 1 when script loads) then do and replace the 1 with what the main tab is
```
lib.FixButtons(1)
```

I might make more later uh
