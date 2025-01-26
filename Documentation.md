# DOCUMENTATION

To load the library put this string:
```
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/AntIsBadAtCoding/AntGUI/refs/heads/main/Source.lua'))
```

To make the window do
```
lib:New("TITLE")
```

To set the keybind for the ui to disappear and re appear do
```
lib.SetKeybind(Enum.KeyCode.RightAlt)
```
you can replace RightAlt with any Keybind/Keycode

To make a tab do
```
lib.MakeTab("rbxassetid://7205257578", 1)
```
you can replace any thing here its just

To make a button do
```
lib.MakeButton("Button",  1, 1, function()
	print("test")
end)
```
then to make a toggle do
```
lib.MakeToggle("Toggle",  1, 2, function(val)
	print(val)
end)
```
To make a Slider do
```
local slider1 = window.MakeSlider("Slider name", 0, 50, 1, 3, function(val)
	print(val)
end)
```
if the buttons are bugged (tab 2 buttons on tab 1 when script loads) then do and replace the 1 with what the main tab is
```
window.FixButtons(1)
```

I might make more later uh
