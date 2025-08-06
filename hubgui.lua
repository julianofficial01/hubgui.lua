local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local screengui = Instance.new("ScreenGui")
screengui.Name = "Void Hacks"
screengui.ResetOnSpawn = false
screengui.Parent = playerGui

-- MainFrame
local mainframe = Instance.new("Frame")
mainframe.Name = "MainFrame"
mainframe.BackgroundColor3 = Color3.fromRGB(16,16,16)
mainframe.Size = UDim2.new(0,693,0,507)
mainframe.Position = UDim2.new(0.319,0,0.184,0)
mainframe.Parent = screengui
mainframe.Active = true
mainframe.Draggable = true

local mfStroke = Instance.new("UIStroke")
mfStroke.Color = Color3.fromRGB(255,255,255)
mfStroke.Thickness = 3
mfStroke.Parent = mainframe

local mfCorner = Instance.new("UICorner")
mfCorner.CornerRadius = UDim.new(0,10)
mfCorner.Parent = mainframe

-- Title Text
local title = Instance.new("TextLabel")
title.Name = "Title"
title.BackgroundTransparency = 1
title.Size = UDim2.new(0,400,0,36)
title.Position = UDim2.new(0.026,0,0.022,0)
title.Text = "Void Hacks"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
title.TextScaled = true
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainframe

-- CLOSE Button setup (no change)

-- Bottom tab buttons container
local tabsFrame = Instance.new("Frame")
tabsFrame.Name = "TabButtons"
tabsFrame.BackgroundTransparency = 1
tabsFrame.Size = UDim2.new(0,693,0,36)
tabsFrame.Position = UDim2.new(0,0,0.901,0)
tabsFrame.Parent = mainframe

local list = Instance.new("UIListLayout")
list.Parent = tabsFrame
list.FillDirection = Enum.FillDirection.Horizontal
list.HorizontalAlignment = Enum.HorizontalAlignment.Center
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Padding = UDim.new(0,15)

-- Tab button creation helper
local function mkTab(name, order)
	local frame = Instance.new("TextButton")
	frame.Name = name.."Tab"
	frame.Size = UDim2.new(0,100,0,36)
	frame.BackgroundColor3 = Color3.fromRGB(24,24,24)
	frame.Text = name
	frame.TextColor3 = Color3.new(1,1,1)
	frame.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
	frame.TextScaled = true
	frame.Parent = tabsFrame

	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 2
	stroke.Color = Color3.fromRGB(255,255,255)
	stroke.Parent = frame

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,4)
	corner.Parent = frame

	return frame
end

local tabMain = mkTab("Main",1)
local tabPlayer = mkTab("Player",2)
local tabMods = mkTab("Modifications",3)

-- ScrollingFrames container
local contents = Instance.new("Frame")
contents.Name = "Contents"
contents.Size = UDim2.new(1,0,0.82,0)
contents.Position = UDim2.new(0,0,0.12,0)
contents.BackgroundTransparency = 1
contents.Parent = mainframe

local function mkScrolling(name)
	local sf = Instance.new("ScrollingFrame")
	sf.Name = name
	sf.BackgroundColor3 = Color3.fromRGB(20,20,20)
	sf.Size = UDim2.new(1,-20,1,-20)
	sf.Position = UDim2.new(0,10,0,10)
	sf.CanvasSize = UDim2.new(0,0,1,0)
	sf.ScrollBarThickness = 6
	sf.Parent = contents

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(255,255,255)
	stroke.Thickness = 2
	stroke.Parent = sf

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,8)
	corner.Parent = sf

	return sf
end

local sfMain = mkScrolling("MainScrollingFrame")
local sfPlayer = mkScrolling("PlayerScrollingFrame")
local sfMods = mkScrolling("ModificationsScrollingFrame")

-- Hide all by default
sfMain.Visible = false
sfPlayer.Visible = false
sfMods.Visible = false

-- Tab switching
local function showTab(name)
	sfMain.Visible = (name=="Main")
	sfPlayer.Visible = (name=="Player")
	sfMods.Visible = (name=="Modifications")
end

tabMain.MouseButton1Click:Connect(function() showTab("Main") end)
tabPlayer.MouseButton1Click:Connect(function() showTab("Player") end)
tabMods.MouseButton1Click:Connect(function() showTab("Modifications") end)

-- Add fancy element in MainScrollingFrame
local holder = Instance.new("Frame")
holder.Size = UDim2.new(0.6,0,0,50)
holder.Position = UDim2.new(0.2,0,0.1,0)
holder.BackgroundColor3 = Color3.fromRGB(28,28,28)
holder.Parent = sfMain

local hStroke = Instance.new("UIStroke")
hStroke.Color = Color3.fromRGB(255,255,255)
hStroke.Thickness = 2
hStroke.Parent = holder

local hCorner = Instance.new("UICorner")
hCorner.CornerRadius = UDim.new(0,6)
hCorner.Parent = holder

local label = Instance.new("TextLabel")
label.BackgroundTransparency = 1
label.Size = UDim2.new(0.6,0,1,0)
label.Position = UDim2.new(0,0,0,0)
label.Text = "MaxRunsYou99"
label.TextColor3 = Color3.fromRGB(255,255,255)
label.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
label.TextScaled = true
label.Parent = holder

-- Toggle button
local toggle = Instance.new("TextButton")
toggle.BackgroundColor3 = Color3.fromRGB(0,200,0)
toggle.Size = UDim2.new(0,0,0.8,0)
toggle.Position = UDim2.new(1,-10,0.1,0)
toggle.AnchorPoint = Vector2.new(1,0)
toggle.Text = ""
toggle.Parent = holder

local function updateToggle(on)
	if on then
		toggle.Size = UDim2.new(0,20,0.8,0)
		toggle.Position = UDim2.new(1,-10,0.1,0)
		toggle.BackgroundColor3 = Color3.fromRGB(0,200,0)
	else
		toggle.Size = UDim2.new(0,20,0.8,0)
		toggle.Position = UDim2.new(0,10,0.1,0)
		toggle.BackgroundColor3 = Color3.fromRGB(200,0,0)
	end
end
local toggleState = false
updateToggle(toggleState)
toggle.MouseButton1Click:Connect(function()
	toggleState = not toggleState
	updateToggle(toggleState)
end)

-- Keybind RightShift to toggle GUI
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
		screengui.Enabled = not screengui.Enabled
	end
end)





