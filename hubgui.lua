local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Erstelle das ScreenGui
local screengui = Instance.new("ScreenGui")
screengui.Name = "JM.Menu"
screengui.ResetOnSpawn = false -- damit es beim Respawn nicht verschwindet
screengui.Parent = playerGui

-- Erstelle das Hauptmenü-Frame
local mainframe = Instance.new("Frame")
mainframe.Name = "MainFrame"
mainframe.Size = UDim2.new(0, 693, 0, 507)
mainframe.Position = UDim2.new(0.319, 0, 0.184, 0)
mainframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainframe.BorderSizePixel = 0
mainframe.Active = true         -- Für Drag-Funktion
mainframe.Draggable = true      -- Optional: Frame verschiebbar machen
mainframe.ZIndex = 2
mainframe.Parent = screengui

-- Rahmen (UIStroke)
local mainframeStroke = Instance.new("UIStroke")
mainframeStroke.Color = Color3.fromRGB(0, 7, 70)
mainframeStroke.Thickness = 3
mainframeStroke.Parent = mainframe

-- Abgerundete Ecken (UICorner)
local mainframeCorner = Instance.new("UICorner")
mainframeCorner.CornerRadius = UDim.new(0, 10)
mainframeCorner.Parent = mainframe
