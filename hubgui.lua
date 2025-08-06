local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local screengui = Instance.new("ScreenGui")
screengui.Name = "JM.Menu"
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

-- Liste unten im Frame
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

-- Item 1
local scort1 = Instance.new("Frame")
scort1.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
scort1.Size = UDim2.new(0, 79, 0, 36)
scort1.Parent = mainframeListframe

local scort1Stroke = Instance.new("UIStroke")
scort1Stroke.Color = Color3.fromRGB(255, 255, 255)
scort1Stroke.Thickness = 2
scort1Stroke.Parent = scort1

local scort1Corner = Instance.new("UICorner")
scort1Corner.CornerRadius = UDim.new(0, 3)
scort1Corner.Parent = scort1

-- Item 2
local scort2 = Instance.new("Frame")
scort2.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
scort2.Size = UDim2.new(0, 79, 0, 36)
scort2.Parent = mainframeListframe

local scort2Stroke = Instance.new("UIStroke")
scort2Stroke.Color = Color3.fromRGB(255, 255, 255)
scort2Stroke.Thickness = 2
scort2Stroke.Parent = scort2

local scort2Corner = Instance.new("UICorner")
scort2Corner.CornerRadius = UDim.new(0, 3)
scort2Corner.Parent = scort2

-- Item 3
local scort3 = Instance.new("Frame")
scort3.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
scort3.Size = UDim2.new(0, 79, 0, 36)
scort3.Parent = mainframeListframe

local scort3Stroke = Instance.new("UIStroke")
scort3Stroke.Color = Color3.fromRGB(255, 255, 255)
scort3Stroke.Thickness = 2
scort3Stroke.Parent = scort3

local scort3Corner = Instance.new("UICorner")
scort3Corner.CornerRadius = UDim.new(0, 3)
scort3Corner.Parent = scort3

-- Close-Button oben rechts
local mainframeClose = Instance.new("Frame")
mainframeClose.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
mainframeClose.Size = UDim2.new(0, 79, 0, 27)
mainframeClose.Position = UDim2.new(0.865, 0, 0.022, 0)
mainframeClose.Parent = mainframe

local mainframeCloseText = Instance.new("TextLabel")
mainframeCloseText.BackgroundTransparency = 1
mainframeCloseText.Size = UDim2.new(1, 0, 1, 0)
mainframeCloseText.Text = "Close"
mainframeCloseText.TextColor3 = Color3.fromRGB(255, 255, 255)
mainframeCloseText.Font = Enum.Font.Arimo
mainframeCloseText.TextScaled = true
mainframeCloseText.Parent = mainframeClose

local mainframeCloseStroke = Instance.new("UIStroke")
mainframeCloseStroke.Color = Color3.fromRGB(255, 255, 255)
mainframeCloseStroke.Thickness = 2
mainframeCloseStroke.Parent = mainframeClose

local mainframeCloseCorner = Instance.new("UICorner")
mainframeCloseCorner.CornerRadius = UDim.new(0, 3)
mainframeCloseCorner.Parent = mainframeClose

-- Titel oben links
local mainframeTitle = Instance.new("TextLabel")
mainframeTitle.BackgroundTransparency = 1
mainframeTitle.TextXAlignment = Enum.TextXAlignment.Left
mainframeTitle.Size = UDim2.new(0, 693, 0, 36)
mainframeTitle.Position = UDim2.new(0.026, 0, 0.022, 0)
mainframeTitle.Text = "Void Hacks"
mainframeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
mainframeTitle.Font = Enum.Font.Arimo
mainframeTitle.TextScaled = true
mainframeTitle.Parent = mainframe

