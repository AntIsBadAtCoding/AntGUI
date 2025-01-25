local library = {}

local local_player = game:GetService("Players").LocalPlayer
local mouse = local_player:GetMouse()
local uis = game:GetService("UserInputService")
local keybind
local state = true
local tabs = {}

function library:Create(obj, properties, parent)
	local object = Instance.new(obj)
	
	for i,v in pairs(properties) do
		object[i] = v
	end
	
	object.Parent = parent or nil
	
	return object
end

uis.InputBegan:Connect(function(input)
	if input.KeyCode == keybind then
		if state == false then
			library.SetState(true)
			state = true
		else
			library.SetState(false)
			state = false
		end
	end
end)

function library:New(Name)
	local screengui = library:Create("ScreenGui", {
		ResetOnSpawn = false,
		Name = "Unknown"
	}, local_player.PlayerGui)
	
	local tabevent = Instance.new("BindableEvent", screengui)
	
	function library.SetState(State)
		screengui.Enabled = State
	end
	
	function library.SetKeybind(key)
		keybind = key
	end
	
	--// UI \\--
	
	local ui = library:Create("Frame", {
		Size = UDim2.new(0, 500, 0, 400),
		BackgroundColor3 = Color3.fromRGB(200, 100, 100),
		Position = UDim2.new(0, 50, 0, 100)
	}, screengui)
	
	local topbar = library:Create("Frame", {
		Size = UDim2.new(0, 500, 0, 30),
		BackgroundColor3 = Color3.fromRGB(150, 50, 50),
		Position = UDim2.new(0, 0, 0, 0)
	}, ui)
	
	local sidebar = library:Create("Frame", {
		Size = UDim2.new(0, 70, 0, 370),
		BackgroundColor3 = Color3.fromRGB(135, 35, 35),
		Position = UDim2.new(0, 0, 0, 30)
	}, ui)
	
	local Ttile = library:Create("TextLabel", {
		Size = UDim2.new(0, 500, 0, 30),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, 0),
		Text = Name,
		TextScaled = true
	}, ui)
	
	local buttonbar = library:Create("ScrollingFrame", {
		Size = UDim2.new(0, 410, 0, 350),
		BackgroundColor3 = Color3.fromRGB(150, 50, 50),
		Position = UDim2.new(0, 80, 0, 40),
	}, ui)
	
	--// tabs \\--
	
	local selectedtab = 1
	local tabs = 0
	local tablist = {}
	
	function library.MakeTab(image, color, currenttab)
		tabs += 1
		local posxoffset = ((tabs * 70) - 65)
		local tab = library:Create("ImageButton", {
			Image = image,
			BackgroundColor3 = color,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.fromOffset(5, posxoffset)
		}, sidebar)
		tab.MouseButton1Down:Connect(function()
			selectedtab = currenttab
			tabevent:Fire(selectedtab)
		end)
	end
	
	--// Make a button \\--
	
	function library.MakeButton(name, color, tab, buttoncount, func)
		local Ypos = ((buttoncount * 55) -50)
		local button = library:Create("TextButton", {
			Text = name,
			TextScaled = true,
			BackgroundColor3 = color,
			Size = UDim2.fromOffset(387, 50),
			Position = UDim2.fromOffset(5, Ypos)
		}, buttonbar)
		button.MouseButton1Down:Connect(func)
		
		tabevent.Event:Connect(function()
			if selectedtab == tab then
				button.Visible = true
			else
				button.Visible = false
			end
		end)
	end
	
	function library.MakeToggle(name, color, tab, count, func)
		local toggled = false
		local Ypos = ((count * 55) -50)
		
		local button = library:Create("TextButton", {
			Text = name,
			TextScaled = true,
			BackgroundColor3 = color,
			Size = UDim2.fromOffset(330, 50),
			Position = UDim2.fromOffset(5, Ypos)
		}, buttonbar)
		
		
		local Circle = library:Create("Frame", {
			Size = UDim2.fromOffset(50, 50),
			Position = UDim2.fromOffset(340, Ypos),
			BackgroundColor3 = Color3.fromRGB(200, 0, 0)
		}, buttonbar)
		
		local toggledevent = Instance.new("BindableEvent", Circle)
		toggledevent.Name = "bind"
		
		local corner = library:Create("UICorner", {
			CornerRadius = UDim.new(1, 0)
		}, Circle)
		
		button.MouseButton1Down:Connect(function()
			toggled = not toggled
			toggledevent:Fire(toggled)
		end)
		
		Circle.bind.Event:connect(function(Data)
			if Data == true then
				Circle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
			else
				Circle.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
			end
		end)

		tabevent.Event:Connect(function()
			if selectedtab == tab then
				button.Visible = true
				Circle.Visible = true
			else
				button.Visible = false
				Circle.Visible = false
			end
		end)
	end
end

return library
