-- JM.Menu GUI Script

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI erstellen
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JM.Menu"
screenGui.Parent = playerGui

-- Hauptfenster
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = screenGui
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Size = UDim2.new(0, 400, 0, 600)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -300)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.ClipsDescendants = true

-- Title (bronx.lol)
local title = Instance.new("TextLabel")
title.Parent = mainFrame
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.Text = "bronx.lol"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(0, 183, 255)
title.TextXAlignment = Enum.TextXAlignment.Left

-- Sidebar (Links)
local sidebar = Instance.new("Frame")
sidebar.Parent = mainFrame
sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
sidebar.Size = UDim2.new(0, 100, 1, -60)
sidebar.Position = UDim2.new(0, 10, 0, 60)
sidebar.BorderSizePixel = 0

local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.Parent = sidebar
sidebarLayout.Padding = UDim.new(0, 10)
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder

local sections = {"Main", "Combat", "Aimlock", "Modifications", "Visuals", "Configs"}

for i, sectionName in ipairs(sections) do
    local btn = Instance.new("TextButton")
    btn.Name = sectionName .. "Button"
    btn.Parent = sidebar
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Font = Enum.Font.SourceSans
    btn.Text = sectionName
    btn.TextColor3 = Color3.fromRGB(170, 170, 170)
    btn.TextSize = 18
    btn.AutoButtonColor = false

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.TextColor3 = Color3.fromRGB(0, 183, 255)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        btn.TextColor3 = Color3.fromRGB(170, 170, 170)
    end)
end

-- Hauptbereich (Rechts)
local contentFrame = Instance.new("Frame")
contentFrame.Parent = mainFrame
contentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
contentFrame.BorderSizePixel = 0
contentFrame.Size = UDim2.new(1, -130, 1, -70)
contentFrame.Position = UDim2.new(0, 120, 0, 60)

-- Überschrift "Local Player Modifications"
local contentTitle = Instance.new("TextLabel")
contentTitle.Parent = contentFrame
contentTitle.BackgroundTransparency = 1
contentTitle.Size = UDim2.new(1, -20, 0, 30)
contentTitle.Position = UDim2.new(0, 10, 0, 10)
contentTitle.Text = "Local Player Modifications"
contentTitle.Font = Enum.Font.SourceSansBold
contentTitle.TextSize = 20
contentTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
contentTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Beispiel Toggles (Infinite Sleep, Infinite Hunger, Infinite Stamina)
local toggleNames = {
    "Infinite Sleep",
    "Infinite Hunger",
    "Infinite Stamina",
    "Instant Interact",
    "Instant Revive",
    "Auto Pickup Cash",
    "Auto Pickup Bags",
}

local yPos = 50
for _, toggleName in ipairs(toggleNames) do
    local label = Instance.new("TextLabel")
    label.Parent = contentFrame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 10, 0, yPos)
    label.Size = UDim2.new(0.7, 0, 0, 30)
    label.Text = toggleName
    label.Font = Enum.Font.SourceSans
    label.TextSize = 18
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextXAlignment = Enum.TextXAlignment.Left

    local toggle = Instance.new("TextButton")
    toggle.Name = toggleName:gsub(" ", "") .. "Toggle"
    toggle.Parent = contentFrame
    toggle.Position = UDim2.new(0.75, 0, 0, yPos + 5)
    toggle.Size = UDim2.new(0, 40, 0, 20)
    toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    toggle.Text = ""
    toggle.AutoButtonColor = false

    local toggled = false
    local function updateToggle()
        if toggled then
            toggle.BackgroundColor3 = Color3.fromRGB(0, 183, 255)
        else
            toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end
    end
    updateToggle()

    toggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        updateToggle()
    end)

    yPos = yPos + 40
end






