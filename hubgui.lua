local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Toggle Key
local TOGGLE_KEY = Enum.KeyCode.RightShift

-- ScreenGui
local screengui = Instance.new("ScreenGui")
screengui.Name = "Void Hacks"
screengui.ResetOnSpawn = false
screengui.Parent = playerGui

-- Main Frame (draggable)
local mainframe = Instance.new("Frame")
mainframe.Name = "MainFrame"
mainframe.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
mainframe.Size = UDim2.new(0, 693, 0, 507)
mainframe.Position = UDim2.new(0.319, 0, 0.184, 0)
mainframe.Active = true
mainframe.Draggable = true
mainframe.Parent = screengui

local mainframeStroke = Instance.new("UIStroke")
mainframeStroke.Color = Color3.fromRGB(255, 255, 255)
mainframeStroke.Thickness = 3
mainframeStroke.Parent = mainframe

local mainframeCorner = Instance.new("UICorner")
mainframeCorner.CornerRadius = UDim.new(0, 10)
mainframeCorner.Parent = mainframe

-- Title Label (fett)
local mainframeTitle = Instance.new("TextLabel")
mainframeTitle.BackgroundTransparency = 1
mainframeTitle.TextXAlignment = Enum.TextXAlignment.Left
mainframeTitle.Size = UDim2.new(0, 693, 0, 36)
mainframeTitle.Position = UDim2.new(0.026, 0, 0.022, 0)
mainframeTitle.Text = "Void Hacks"
mainframeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
mainframeTitle.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
mainframeTitle.TextScaled = true
mainframeTitle.Parent = mainframe

-- Close Frame + Button (Button mittig im Frame)
local mainframeClose = Instance.new("Frame")
mainframeClose.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
mainframeClose.Size = UDim2.new(0, 79, 0, 27)
mainframeClose.Position = UDim2.new(0.865, 0, 0.022, 0)
mainframeClose.Parent = mainframe

local mainframeCloseCorner = Instance.new("UICorner")
mainframeCloseCorner.CornerRadius = UDim.new(0, 3)
mainframeCloseCorner.Parent = mainframeClose

local mainframeCloseStroke = Instance.new("UIStroke")
mainframeCloseStroke.Color = Color3.fromRGB(255, 255, 255)
mainframeCloseStroke.Thickness = 2
mainframeCloseStroke.Parent = mainframeClose

local mainframeCloseButton = Instance.new("TextButton")
mainframeCloseButton.BackgroundTransparency = 1
mainframeCloseButton.Size = UDim2.new(0, 69, 0, 21)
mainframeCloseButton.Position = UDim2.new(0.5, -34, 0.5, -10)
mainframeCloseButton.Text = "Close"
mainframeCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mainframeCloseButton.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
mainframeCloseButton.TextScaled = true
mainframeCloseButton.Parent = mainframeClose

mainframeCloseButton.MouseButton1Click:Connect(function()
	local menu = playerGui:FindFirstChild("Void Hacks")
	if menu then menu:Destroy() end
end)

-- Bottom Button Bar
local mainframeListframe = Instance.new("Frame")
mainframeListframe.BackgroundTransparency = 1
mainframeListframe.Size = UDim2.new(0, 693, 0, 36)
mainframeListframe.Position = UDim2.new(0, 0, 0.901, 0)
mainframeListframe.Parent = mainframe

local mainframeListframeMain = Instance.new("UIListLayout")
mainframeListframeMain.Padding = UDim.new(0, 15)
mainframeListframeMain.SortOrder = Enum.SortOrder.LayoutOrder
mainframeListframeMain.FillDirection = Enum.FillDirection.Horizontal
mainframeListframeMain.HorizontalAlignment = Enum.HorizontalAlignment.Center
mainframeListframeMain.VerticalAlignment = Enum.VerticalAlignment.Top
mainframeListframeMain.Parent = mainframeListframe

-- Create 3 buttons: Main, Player, Modifications
local buttons = {}
local frames = {}

local function createTabButton(name)
	local btnFrame = Instance.new("Frame")
	btnFrame.BackgroundColor3 = Color3.fromRGB(16,16,16)
	btnFrame.Size = UDim2.new(0, 100, 0, 36)
	btnFrame.Parent = mainframeListframe
	
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(255,255,255)
	stroke.Thickness = 2
	stroke.Parent = btnFrame
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 3)
	corner.Parent = btnFrame
	
	local textButton = Instance.new("TextButton")
	textButton.BackgroundTransparency = 1
	textButton.Size = UDim2.new(1, 0, 1, 0)
	textButton.Text = name
	textButton.TextColor3 = Color3.fromRGB(255,255,255)
	textButton.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
	textButton.TextScaled = true
	textButton.Parent = btnFrame
	
	return textButton
end

-- Create ScrollingFrames for each tab
local function createScrollingFrame(name)
	local sf = Instance.new("ScrollingFrame")
	sf.Name = name .. "ScrollingFrame"
	sf.Size = UDim2.new(0.95, 0, 0.7, 0)
	sf.Position = UDim2.new(0.025, 0, 0.2, 0)
	sf.CanvasSize = UDim2.new(0, 0, 1, 0)
	sf.BackgroundColor3 = Color3.fromRGB(24,24,24)
	sf.Visible = false
	sf.ScrollBarThickness = 8
	sf.Parent = mainframe
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = sf
	
	return sf
end

buttons["Main"] = createTabButton("Main")
buttons["Player"] = createTabButton("Player")
buttons["Modifications"] = createTabButton("Modifications")

frames["Main"] = createScrollingFrame("Main")
frames["Player"] = createScrollingFrame("Player")
frames["Modifications"] = createScrollingFrame("Modifications")

-- Show Main tab by default
frames["Main"].Visible = true

-- Tab button logic
for name, button in pairs(buttons) do
	button.MouseButton1Click:Connect(function()
		for fName, frame in pairs(frames) do
			frame.Visible = (fName == name)
		end
	end)
end

-- Create the fancy toggle switch in MainScrollingFrame
local toggleFrame = Instance.new("Frame")
toggleFrame.Size = UDim2.new(0, 200, 0, 50)
toggleFrame.Position = UDim2.new(0.5, -100, 0.1, 0)
toggleFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
toggleFrame.Parent = frames["Main"]

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = toggleFrame

-- Label "MaxRunsYou99"
local toggleLabel = Instance.new("TextLabel")
toggleLabel.Size = UDim2.new(0.6, 0, 1, 0)
toggleLabel.BackgroundTransparency = 1
toggleLabel.Text = "MaxRunsYou99"
toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleLabel.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
toggleLabel.TextScaled = true
toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
toggleLabel.Parent = toggleFrame

-- Toggle Button Background
local toggleBackground = Instance.new("Frame")
toggleBackground.Size = UDim2.new(0.35, 0, 0.6, 0)
toggleBackground.Position = UDim2.new(0.62, 0, 0.2, 0)
toggleBackground.BackgroundColor3 = Color3.fromRGB(80,80,80)
toggleBackground.Parent = toggleFrame

local toggleBackCorner = Instance.new("UICorner")
toggleBackCorner.CornerRadius = UDim.new(1, 0)
toggleBackCorner.Parent = toggleBackground

-- Toggle Button (Circle)
local toggleButton = Instance.new("Frame")
toggleButton.Size = UDim2.new(0.5, 0, 1, 0)
toggleButton.Position = UDim2.new(0, 0, 0, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
toggleButton.Parent = toggleBackground

local toggleButtonCorner = Instance.new("UICorner")
toggleButtonCorner.CornerRadius = UDim.new(1, 0)
toggleButtonCorner.Parent = toggleButton

-- State Variable
local toggleOn = false

-- Function to update toggle position and color
local function updateToggle()
	if toggleOn then
		toggleButton.Position = UDim2.new(0.5, 0, 0, 0)
		toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	else
		toggleButton.Position = UDim2.new(0, 0, 0, 0)
		toggleButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
	end
end

-- Toggle click event
toggleBackground.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		toggleOn = not toggleOn
		updateToggle()
	end
end)

updateToggle()

-- Toggle GUI Visibility with RightShift
local guiVisible = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == TOGGLE_KEY then
		guiVisible = not guiVisible
		screengui.Enabled = guiVisible
	end
end)





