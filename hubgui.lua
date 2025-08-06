-- VOID HACKS - Professional UI (Visual Only)
-- Created by ChatGPT | 2025

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "VoidHacksUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

-- Draggable Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 650, 0, 400)
main.Position = UDim2.new(0.5, -325, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Parent = gui
main.Active = true
main.Draggable = true

local mainCorner = Instance.new("UICorner", main)
mainCorner.CornerRadius = UDim.new(0, 10)

-- Topbar
local topbar = Instance.new("TextLabel")
topbar.Size = UDim2.new(1, 0, 0, 40)
topbar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topbar.Text = "VOID HACKS"
topbar.TextColor3 = Color3.fromRGB(255, 255, 255)
topbar.Font = Enum.Font.GothamBlack
topbar.TextSize = 24
topbar.TextXAlignment = Enum.TextXAlignment.Center
topbar.Parent = main

Instance.new("UICorner", topbar).CornerRadius = UDim.new(0, 10)

-- Sidebar (Tabs)
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 140, 1, -40)
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
sidebar.Parent = main

local sidebarLayout = Instance.new("UIListLayout", sidebar)
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
sidebarLayout.Padding = UDim.new(0, 6)

-- Content Frame
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -140, 1, -40)
content.Position = UDim2.new(0, 140, 0, 40)
content.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
content.Parent = main

-- Create Tabs
local tabNames = {"ESP", "Aimbot", "Player", "Misc", "Settings"}
local contentFrames = {}

local function createTab(name)
    -- Button
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 35)
    btn.Position = UDim2.new(0, 10, 0, 0)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 16
    btn.BorderSizePixel = 0
    btn.Parent = sidebar

    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    -- Content Frame
    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.ScrollBarThickness = 6
    tabFrame.BackgroundTransparency = 1
    tabFrame.Visible = false
    tabFrame.Parent = content
    contentFrames[name] = tabFrame

    local layout = Instance.new("UIListLayout", tabFrame)
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder

    local padding = Instance.new("UIPadding", tabFrame)
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)

    btn.MouseButton1Click:Connect(function()
        for _, frame in pairs(contentFrames) do
            frame.Visible = false
        end
        tabFrame.Visible = true
    end)
end

-- Create All Tabs
for _, tab in ipairs(tabNames) do
    createTab(tab)
end

-- Default visible tab
contentFrames["ESP"].Visible = true

-- Toggle Element
local function createToggle(text, parent)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, 0, 0, 30)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    toggleFrame.Parent = parent

    Instance.new("UICorner", toggleFrame).CornerRadius = UDim.new(0, 6)

    local label = Instance.new("TextLabel")
    label.Text = text
    label.Size = UDim2.new(0.75, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggleFrame

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 60, 0, 25)
    toggleBtn.Position = UDim2.new(1, -70, 0.5, -12)
    toggleBtn.Text = "OFF"
    toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    toggleBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 14
    toggleBtn.Parent = toggleFrame

    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 6)

    toggleBtn.MouseButton1Click:Connect(function()
        if toggleBtn.Text == "OFF" then
            toggleBtn.Text = "ON"
            toggleBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            toggleBtn.Text = "OFF"
            toggleBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)
end

-- ESP Toggles
for _, opt in ipairs({"Name", "Health", "Distance", "Tool Holding", "Box ESP", "Chams"}) do
    createToggle(opt, contentFrames["ESP"])
end

-- Aimbot
for _, opt in ipairs({"FOV Circle", "Smoothing", "Prediction", "Team Check"}) do
    createToggle(opt, contentFrames["Aimbot"])
end

-- Player
for _, opt in ipairs({"WalkSpeed", "JumpPower", "Fly", "NoClip"}) do
    createToggle(opt, contentFrames["Player"])
end

-- Misc
for _, opt in ipairs({"Gun Dupe", "Anti-Lag", "Auto Pickup", "Rejoin Server"}) do
    createToggle(opt, contentFrames["Misc"])
end

-- Settings
for _, opt in ipairs({"Theme: Dark", "Close UI", "Void Hacks Info"}) do
    createToggle(opt, contentFrames["Settings"])
end




