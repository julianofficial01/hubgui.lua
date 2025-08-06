local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local screengui = Instance.new("ScreenGui")
screengui.Name = "Void Hacks"
screengui.ResetOnSpawn = false
screengui.Parent = playerGui

-- Hauptframe
local mainframe = Instance.new("Frame")
mainframe.Name = "MainFrame"
mainframe.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
mainframe.Size = UDim2.new(0, 693, 0, 507)
mainframe.Position = UDim2.new(0.319, 0, 0.184, 0)
mainframe.Parent = screengui

local mainframeStroke = Instance.new("UIStroke")
mainframeStroke.Color = Color3.fromRGB(255, 255, 255)
mainframeStroke.Thickness = 3
mainframeStroke.Parent = mainframe

local mainframeCorner = Instance.new("UICorner")
mainframeCorner.CornerRadius = UDim.new(0, 10)
mainframeCorner.Parent = mainframe

-- List frame
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

-- 3 Buttons (Scort)
for i = 1, 3 do
	local scort = Instance.new("Frame")
	scort.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	scort.Size = UDim2.new(0, 79, 0, 36)
	scort.Parent = mainframeListframe

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(255, 255, 255)
	stroke.Thickness = 2
	stroke.Parent = scort

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 3)
	corner.Parent = scort
end

-- Close Frame (oben rechts)
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

-- Close Button (TextButton mit fetter Schrift, zentriert)
local mainframeCloseButton = Instance.new("TextButton")
mainframeCloseButton.BackgroundTransparency = 1
mainframeCloseButton.Size = UDim2.new(0, 97, 0, 18) -- volle Größe vom Parent
mainframeCloseButton.Position = UDim2.new(0.5, 0, 0.5, 0)
mainframeCloseButton.AnchorPoint = Vector2.new(0.5, 0.5) -- zentriert im Parent
mainframeCloseButton.Text = "Close"
mainframeCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mainframeCloseButton.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
mainframeCloseButton.TextScaled = true
mainframeCloseButton.Parent = mainframeClose


-- Funktion zum Schließen
mainframeCloseButton.MouseButton1Click:Connect(function()
	local menu = playerGui:FindFirstChild("Void Hacks")
	if menu then
		menu:Destroy()
	end
end)

-- Titel oben links mit fetter Schrift
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



