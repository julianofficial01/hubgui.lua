local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screengui = Instance.new("ScreenGui")
screengui.Name = "JM.Menu"
screengui.Parent = playerGui

local mainframe = Instance.new("Frame")
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

local mainframeListframeScort1 = Instance.new("Frame")
mainframeListframeScort1.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
mainframeListframeScort1.Size = UDim2.new(0, 79, 0, 36)
mainframeListframeScort1.Parent = mainframeListframe

local mainframeListframeScort1Stroke = Instance.new("UIStroke")
mainframeListframeScort1Stroke.Color = Color3.fromRGB(255, 255, 255)
mainframeListframeScort1Stroke.Thickness = 2
mainframeListframeScort1Stroke.Parent = mainframeListframeScort1

local mainframeListframeScort1Corner = Instance.new("UICorner")
mainframeListframeScort1Corner.CornerRadius = UDim.new(0, 3)
mainframeListframeScort1Corner.Parent = mainframeListframeScort1

local mainframeListframeScort2 = Instance.new("Frame")
mainframeListframeScort1.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
mainframeListframeScort1.Size = UDim2.new(0, 79, 0, 36)
mainframeListframeScort1.Parent = mainframeListframe

local mainframeListframeScort2Stroke = Instance.new("UIStroke")
mainframeListframeScort2Stroke.Color = Color3.fromRGB(255, 255, 255)
mainframeListframeScort2Stroke.Thickness = 2
mainframeListframeScort2Stroke.Parent = mainframeListframeScort2

local mainframeListframeScort2Corner = Instance.new("UICorner")
mainframeListframeScort2Corner.CornerRadius = UDim.new(0, 3)
mainframeListframeScort2Corner.Parent = mainframeListframeScort2

local mainframeListframeScort3 = Instance.new("Frame")
mainframeListframeScort1.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
mainframeListframeScort1.Size = UDim2.new(0, 79, 0, 36)
mainframeListframeScort1.Parent = mainframeListframe

local mainframeListframeScort3Stroke = Instance.new("UIStroke")
mainframeListframeScort3Stroke.Color = Color3.fromRGB(255, 255, 255)
mainframeListframeScort3Stroke.Thickness = 2
mainframeListframeScort3Stroke.Parent = mainframeListframeScort3

local mainframeListframeScort3Corner = Instance.new("UICorner")
mainframeListframeScort3Corner.CornerRadius = UDim.new(0, 3)
mainframeListframeScort3Corner.Parent = mainframeListframeScort3

local mainframeClose = Instance.new("Frame")
mainframeClose.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
mainframeClose.Size = UDim2.new(0, 79, 0, 27)
mainframeClose.Position = UDim2.new(0.865, 0, 0.022, 0)
mainframeClose.Parent = mainframe

local mainframeCloseText = Instance.new("TextLabel")
mainframeCloseText.BackgroundTransparency = 1
mainframeCloseText.Size = UDim2.new(0, 79, 0, 21)
mainframeCloseText.Text = "Close"
mainframeCloseText.TextColor3 = Color3.fromRGB(255, 255, 255)
mainframeCloseText.Font = Enum.Font.Arimo
mainframeCloseText.TextScaled = true
mainframeCloseText.Parent = mainframeClose

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

