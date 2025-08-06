--[[

🎩 Void Hacks UI | Designed to look like a professional Mod Menu (e.g., SoleHub)
📌 Visual-Only GUI – No functional hacks/exploits
📦 Includes RightShift Toggle & Close Button

--]]

if game:GetService("CoreGui"):FindFirstChild("VoidHacksUI") then
    game:GetService("CoreGui"):FindFirstChild("VoidHacksUI"):Destroy()
end

local player = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "VoidHacksUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

-- Main Frame
local main = Instance.new("Frame")
main.Name = "MainFrame"
main.Size = UDim2.new(0, 650, 0, 400)
main.Position = UDim2.new(0.5, -325, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 0
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Parent = gui
main.Active = true
main.Draggable = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)

-- Topbar
local topbar = Instance.new("Frame")
topbar.Size = UDim2.new(1, 0, 0, 40)
topbar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
topbar.Parent = main

local title = Instance.new("TextLabel", topbar)
title.Text = "VOID HACKS"
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBlack
title.TextSize = 22
title.BackgroundTransparency = 1

-- Close Button
local close = Instance.new("TextButton", topbar)
close.Text = "X"
close.Size = UDim2.new(0, 40, 1, 0)
close.Position = UDim2.new(1, -40, 0, 0)
close.TextColor3 = Color3.fromRGB(255, 0, 0)
close.Font = Enum.Font.GothamBold
close.TextSize = 22
close.BackgroundTransparency = 1

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 140, 1, -40)
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
sidebar.Parent = main

local sidebarLayout = Instance.new("UIListLayout", sidebar)
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
sidebarLayout.Padding = UDim.new(0, 6)

-- Content Area
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -140, 1, -40)
content.Position = UDim2.new(0, 140, 0, 40)
content.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
content.Parent = main

local tabNames = {"ESP", "Aimbot", "Player", "Misc", "Settings"}
local contentFrames = {}

local function createTab(name)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Size = UDim2.new(1, -20, 0, 34)
    btn.Position = UDim2.new(0, 10, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 15
    btn.BorderSizePixel = 0
    btn.Parent = sidebar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.ScrollBarThickness = 4
    tabFrame.BackgroundTransparency = 1
    tabFrame.Visible = false
    tabFrame.Parent = content
    contentFrames[name] = tabFrame

    local layout = Instance.new("UIListLayout", tabFrame)
    layout.Padding = UDim.new(0, 6)
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

for _, name in ipairs(tabNames) do
    createTab(name)
end

contentFrames["ESP"].Visible = true

-- Toggle creator
local function createToggle(text, parent)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, 0, 0, 30)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    toggleFrame.Parent = parent
    Instance.new("UICorner", toggleFrame).CornerRadius = UDim.new(0, 6)

    local label = Instance.new("TextLabel", toggleFrame)
    label.Text = text
    label.Size = UDim2.new(0.75, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left

    local toggle = Instance.new("TextButton", toggleFrame)
    toggle.Text = "OFF"
    toggle.Size = UDim2.new(0, 60, 0, 25)
    toggle.Position = UDim2.new(1, -70, 0.5, -12)
    toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    toggle.Font = Enum.Font.GothamBold
    toggle.TextSize = 14
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 6)

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

-- Example toggles
for _, opt in ipairs({"Name", "Health", "Distance", "Tool", "Chams", "Box"}) do
    createToggle(opt, contentFrames["ESP"])
end

for _, opt in ipairs({"FOV", "Prediction", "Smoothing", "TeamCheck"}) do
    createToggle(opt, contentFrames["Aimbot"])
end

for _, opt in ipairs({"WalkSpeed", "JumpPower", "Fly", "NoClip"}) do
    createToggle(opt, contentFrames["Player"])
end

for _, opt in ipairs({"Gun Dupe", "Anti-Lag", "Auto Pickup", "Rejoin"}) do
    createToggle(opt, contentFrames["Misc"])
end

for _, opt in ipairs({"Dark Theme", "Close UI", "Info"}) do
    createToggle(opt, contentFrames["Settings"])
end

-- RightShift to show/hide
local visible = true
UIS.InputBegan:Connect(function(input, gpe)
    if input.KeyCode == Enum.KeyCode.RightShift and not gpe then
        visible = not visible
        gui.Enabled = visible
    end
end)





