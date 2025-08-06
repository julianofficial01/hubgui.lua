--[[

📦 Void Hacks UI (Visual Only)
📌 Fake Mod Menu by ChatGPT - 2025
🎨 UI Design inspired by professional Roblox Exploit GUIs

--]]

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "VoidHacksUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 650, 0, 400)
main.Position = UDim2.new(0.5, -325, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = main

-- Topbar
local topbar = Instance.new("TextLabel")
topbar.Size = UDim2.new(1, 0, 0, 40)
topbar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topbar.Text = "Void Hacks"
topbar.TextColor3 = Color3.fromRGB(255, 255, 255)
topbar.Font = Enum.Font.GothamBlack
topbar.TextSize = 24
topbar.Parent = main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 10)
topCorner.Parent = topbar

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 140, 1, -40)
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
sidebar.Parent = main

-- Content Holder
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -140, 1, -40)
content.Position = UDim2.new(0, 140, 0, 40)
content.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
content.Parent = main

local tabs = {"ESP", "Aimbot", "Player", "Misc", "Settings"}
local contentFrames = {}

-- Style Function
local function styleButton(button)
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 16
    button.BorderSizePixel = 0
    local corner = Instance.new("UICorner")
    corner.Parent = button
end

-- Toggle Template
local function createToggle(text, parent)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Parent = parent

    local label = Instance.new("TextLabel")
    label.Text = text
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 60, 0, 25)
    toggle.Position = UDim2.new(1, -70, 0.5, -12)
    toggle.Text = "OFF"
    toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    toggle.Font = Enum.Font.GothamBold
    toggle.TextSize = 14
    toggle.Parent = frame

    local corner = Instance.new("UICorner")
    corner.Parent = toggle

    toggle.MouseButton1Click:Connect(function()
        if toggle.Text == "OFF" then
            toggle.Text = "ON"
            toggle.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            toggle.Text = "OFF"
            toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)
end

-- Create Tabs
for i, tabName in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Text = tabName
    btn.Size = UDim2.new(1, -20, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, 10 + (i - 1) * 40)
    btn.Parent = sidebar
    styleButton(btn)

    local tabContent = Instance.new("Frame")
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.BackgroundTransparency = 1
    tabContent.Visible = false
    tabContent.Parent = content
    contentFrames[tabName] = tabContent

    btn.MouseButton1Click:Connect(function()
        for _, frame in pairs(contentFrames) do
            frame.Visible = false
        end
        tabContent.Visible = true
    end)
end

-- ESP Tab Options
createToggle("Name", contentFrames["ESP"])
createToggle("Health", contentFrames["ESP"])
createToggle("Distance", contentFrames["ESP"])
createToggle("Tool Holding", contentFrames["ESP"])
createToggle("Box ESP", contentFrames["ESP"])
createToggle("Chams", contentFrames["ESP"])

-- Aimbot Options
createToggle("FOV Circle", contentFrames["Aimbot"])
createToggle("Prediction", contentFrames["Aimbot"])
createToggle("Smoothing", contentFrames["Aimbot"])
createToggle("Team Check", contentFrames["Aimbot"])

-- Player Options
createToggle("WalkSpeed", contentFrames["Player"])
createToggle("JumpPower", contentFrames["Player"])
createToggle("Fly", contentFrames["Player"])
createToggle("NoClip", contentFrames["Player"])

-- Misc Options
createToggle("Gun Dupe", contentFrames["Misc"])
createToggle("Anti-Lag", contentFrames["Misc"])
createToggle("Auto Pickup", contentFrames["Misc"])
createToggle("Rejoin Server", contentFrames["Misc"])

-- Settings
createToggle("Dark Theme", contentFrames["Settings"])
createToggle("Close UI", contentFrames["Settings"])

-- Default visible
contentFrames["ESP"].Visible = true



