local library = {}

local local_player = game:GetService("Players").LocalPlayer
local mouse = local_player:GetMouse()
local uis = game:GetService("UserInputService")

local keybind = Enum.KeyCode.LeftAlt
local state = true

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
		Position = UDim2.new(0, 50, 0, 100),
		Draggable = true
	}, screengui)

	local topbar = library:Create("Frame", {
		Size = UDim2.new(0, 500, 0, 30),
		BackgroundColor3 = Color3.fromRGB(175, 75, 75),
		Position = UDim2.new(0, 0, 0, 0)
	}, ui)

	local sidebar = library:Create("Frame", {
		Size = UDim2.new(0, 70, 0, 370),
		BackgroundColor3 = Color3.fromRGB(150, 50, 50),
		Position = UDim2.new(0, 0, 0, 30)
	}, ui)

	local Title = library:Create("TextLabel", {
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
	local tabcount = 0
	local tabs = {}

	function library.MakeTab(tabname, currenttab)
		tabcount += 1
		local posxoffset = ((tabcount * 70) - 65)
		local tab = library:Create("TextButton", {
			Text = tabname,
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(200, 100, 100),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.fromOffset(5, posxoffset)
		}, sidebar)
		tab.MouseButton1Down:Connect(function()
			selectedtab = currenttab
			tabevent:Fire(selectedtab)
		end)
	end

	function library.FixButtons(Tab)
		selectedtab = Tab
		tabevent:Fire(Tab)
	end

	--// Make a button \\--

	function library.MakeButton(name, tab, buttoncount, func)
		local Ypos = ((buttoncount * 55) -50)
		local button = library:Create("TextButton", {
			Text = name,
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(200, 100, 100),
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

	function library.MakeToggle(name, tab, count, func)
		local toggled = false
		local Ypos = ((count * 55) -50)

		local button = library:Create("TextButton", {
			Text = name,
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(200, 100, 100),
			Size = UDim2.fromOffset(330, 50),
			Position = UDim2.fromOffset(5, Ypos)
		}, buttonbar)


		local Circle = library:Create("Frame", {
			Size = UDim2.fromOffset(50, 50),
			Position = UDim2.fromOffset(340, Ypos),
			BackgroundColor3 = Color3.fromRGB(200, 0, 0)
		}, buttonbar)

		local toggled_event = Instance.new("BindableEvent", Circle)
		toggled_event.Name = "event"

		local corner = library:Create("UICorner", {
			CornerRadius = UDim.new(1, 0)
		}, Circle)

		button.MouseButton1Down:Connect(function()
			toggled = not toggled
			toggled_event:Fire(toggled)
		end)
		Circle.event.Event:Connect(func) --player func

		Circle.event.Event:connect(function(Data)
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

	function library.MakeSlider(name, min, max, tab, count, func)
		local Ypos = ((count * 55) -50)

		local sliderbase = library:Create("Frame", {
			BackgroundColor3 = Color3.fromRGB(200, 100, 100),
			Size = UDim2.fromOffset(190, 50),
			Position = UDim2.fromOffset(5, Ypos)
		}, buttonbar)

		local Textbox = library:Create("TextLabel", {
			Text = name,
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(200, 100, 100),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.fromOffset(0, 0)
		}, sliderbase)

		local bar = library:Create("Frame", {
			BackgroundColor3 = Color3.fromRGB(175, 75, 75),
			Size = UDim2.fromOffset(192, 20),
			Position = UDim2.fromOffset(291, 25),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, sliderbase)

		local slider = library:Create("ImageButton", {
			BackgroundColor3 = Color3.fromRGB(200, 100, 100),
			Size = UDim2.fromOffset(25, 40),
			Position = UDim2.fromOffset(268, 5)
		}, sliderbase)

		local move_event = Instance.new("BindableEvent", slider)
		move_event.Name = "event"

		local corner = library:Create("UICorner", {
			CornerRadius = UDim.new(1, 0)
		}, bar)

		slider.MouseButton1Down:Connect(function()
			local dragging = true

			local function move(pos, value)
				local newpos = math.clamp(pos-150, 195, 363)
				slider.Position = UDim2.fromOffset(newpos, 5)

				Textbox.Text = name .. ": " .. value
			end

			local moveconnection
			moveconnection = uis.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					local SizeScale = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
					local value = math.floor(min + ((max - min) * SizeScale))
					move(input.Position.X, value)
					slider.event:Fire(value)
				end
			end)

			local releaseconection
			releaseconection = uis.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					moveconnection:Disconnect()
					releaseconection:Disconnect()
					dragging = false
				end
			end)
		end)

		slider.event.Event:Connect(func)

		tabevent.Event:Connect(function()
			if selectedtab == tab then
				sliderbase.Visible = true
				bar.Visible = true
			else
				sliderbase.Visible = false
				bar.Visible = false
			end
		end)
	end
	
	function library.MakeTextInput(name, tab, count, func)
		local Ypos = ((count * 55) -50)
		
		local button = library:Create("TextButton", {
			Position = UDim2.fromOffset(5, Ypos),
			Size = UDim2.fromOffset(185, 50),
			BackgroundColor3 = Color3.fromRGB(200, 100, 100),
			Text = name,
			TextScaled = true
		}, buttonbar)
		local frame = library:Create("Frame", {
			Position = UDim2.fromOffset(190, button.Position.Y),
			Size = UDim2.fromOffset(185, 50),
			BackgroundColor3 = Color3.fromRGB(200, 100, 100)
		}, button)
		local textinput = library:Create("TextBox", {
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			TextScaled = true
		}, frame)
		
		local bindevent = library:Create("BindableEvent", {
			Name = "BindEvent"
		}, textinput)
		
		button.MouseButton1Down:Connect(function()
			bindevent:Fire(textinput.Text)
		end)
		
		bindevent.Event:Connect(func)
		
		tabevent.Event:Connect(function()
			if selectedtab == tab then
				button.Visible = true
			else
				button.Visible = false
			end
		end)
	end
	return tabs
end
return library
