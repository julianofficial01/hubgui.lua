local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screengui = Instance.new("ScreenGui")
screengui.Name = "JM.Menu"
screengui.Parent = playerGui

local mainframe = Instance.new("Frame")
mainframe.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
mainframe.Size = UDim2.new(0, 693, 0, 507)
mainframe.Position = UDim2.new(0.319, 0, 0.184, 0)
mainframe.Parent = screengui

local mainframeStroke = Instance.new("UIStroke")
mainframeStroke.Color = Color3.fromRGB(0, 7, 70)
mainframeStroke.Thickness = 3
mainframeStroke.Parent = mainframe

local mainframeCorner = Instance.new("UICorner")
mainframeCorner.CornerRadius = UDim.new(0, 10)
mainframeCorner.Parent = mainframe
