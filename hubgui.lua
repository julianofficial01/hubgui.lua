-- JM.Menu GUI

local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "JMMenu"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local Colors = {
    Background = Color3.fromRGB(15, 18, 23),
    Sidebar = Color3.fromRGB(20, 24, 32),
    Accent = Color3.fromRGB(0, 122, 255),
    TextPrimary = Color3.fromRGB(220, 220, 240),
    TextSecondary = Color3.fromRGB(140, 140, 160),
    ToggleOff = Color3.fromRGB(70, 70, 90),
    ToggleOn = Color3.fromRGB(0, 122, 255),
    SliderBackground = Color3.fromRGB(40, 44, 55),
    SliderFill = Color3.fromRGB(0, 122, 255),
}

local Font = Enum.Font.Gotham

-- Main frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 700, 0, 400)
main.Position = UDim2.new(0.5, -350, 0.5, -200)
main.BackgroundColor3 = Colors.Background
main.BorderSizePixel = 0
main.Parent = gui
main.Name = "MainFrame"

local uicornerMain = Instance.new("UICorner")
uicornerMain.CornerRadius = UDim.new(0, 12)
uicornerMain.Parent = main

local uistrokeMain = Instance.new("UIStroke")
uistrokeMain.Color = Colors.Accent
uistrokeMain.Thickness = 2
uistrokeMain.Parent = main

-- Dragging logic for main frame
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Title Text
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "JM.Menu"
title.Font = Font
title.TextSize = 28
title.TextColor3 = Colors.Accent
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = main
local titlePadding = Instance.new("UIPadding", title)
titlePadding.PaddingLeft = UDim.new(0, 15)

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 140, 1, -50)
sidebar.Position = UDim2.new(0, 10, 0, 50)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BorderSizePixel = 0
sidebar.Parent = main

local uicornerSidebar = Instance.new("UICorner")
uicornerSidebar.CornerRadius = UDim.new(0, 12)
uicornerSidebar.Parent = sidebar

-- Scroll frame for sidebar buttons
local sidebarList = Instance.new("ScrollingFrame")
sidebarList.Size = UDim2.new(1, 0, 1, 0)
sidebarList.BackgroundTransparency = 1
sidebarList.BorderSizePixel = 0
sidebarList.CanvasSize = UDim2.new(0, 0, 0, 0)
sidebarList.ScrollBarThickness = 5
sidebarList.Parent = sidebar

local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
sidebarLayout.Padding = UDim.new(0, 10)
sidebarLayout.Parent = sidebarList

-- Content area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -170, 1, -50)
contentArea.Position = UDim2.new(0, 160, 0, 50)
contentArea.BackgroundTransparency = 1
contentArea.Parent = main

-- Categories and tabs
local categories = {
    {
        Name = "Local Player",
        Tabs = {
            {
                Name = "Modifications",
                Controls = {
                    {Type = "Toggle", Name = "Infinite Sleep", Default = false},
                    {Type = "Toggle", Name = "Infinite Hunger", Default = false},
                    {Type = "Toggle", Name = "Infinite Stamina", Default = false},
                    {Type = "Toggle", Name = "Instant Interact", Default = false},
                    {Type = "Toggle", Name = "Instant Revive", Default = false},
                    {Type = "Toggle", Name = "Auto Pickup Cash", Default = false},
                    {Type = "Toggle", Name = "Disable Camera Bobbing", Default = false},
                    {Type = "Toggle", Name = "Disable Blood Effects", Default = false},
                }
            },
            {
                Name = "Character",
                Controls = {
                    {Type = "Toggle", Name = "Modify WalkSpeed", Default = false},
                    {Type = "Slider", Name = "WalkSpeed Value", Default = 50, Min = 0, Max = 100},
                    {Type = "Toggle", Name = "Modify JumpPower", Default = false},
                    {Type = "Slider", Name = "JumpPower Value", Default = 50, Min = 0, Max = 100},
                    {Type = "Button", Name = "Click Teleport"},
                }
            }
        }
    },
    {
        Name = "Players",
        Tabs = {
            {
                Name = "General",
                Controls = {
                    {Type = "Toggle", Name = "No Clip", Default = false},
                    {Type = "Toggle", Name = "No Fall Damage", Default = false},
                    {Type = "Toggle", Name = "Respawn Where You Died", Default = false},
                }
            }
        }
    }
}

-- Helper function to create UI elements
local function createUICorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = parent
    return corner
end

local function createTextLabel(text, size, pos, parent, textColor, font, textSize, alignX, alignY)
    local label = Instance.new("TextLabel")
    label.Size = size
    label.Position = pos
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = textColor or Colors.TextPrimary
    label.Font = font or Font
    label.TextSize = textSize or 18
    label.TextXAlignment = alignX or Enum.TextXAlignment.Left
    label.TextYAlignment = alignY or Enum.TextYAlignment.Center
    label.Parent = parent
    return label
end

local function createToggle(name, default, parent)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Parent = parent

    local label = createTextLabel(name, UDim2.new(0.7, 0, 1, 0), UDim2.new(0, 5, 0, 0), frame)
    label.TextColor3 = Colors.TextPrimary
    label.Font = Font
    label.TextSize = 16

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 40, 0, 20)
    toggleBtn.Position = UDim2.new(1, -45, 0, 5)
    toggleBtn.BackgroundColor3 = default and Colors.ToggleOn or Colors.ToggleOff
    toggleBtn.AutoButtonColor = false
    toggleBtn.Name = "ToggleButton"
    toggleBtn.Parent = frame
    createUICorner(toggleBtn, 10)

    toggleBtn.MouseButton1Click:Connect(function()
        toggleBtn.BackgroundColor3 = toggleBtn.BackgroundColor3 == Colors.ToggleOn and Colors.ToggleOff or Colors.ToggleOn
    end)

    return frame, toggleBtn
end

local function createSlider(name, default, min, max, parent)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundTransparency = 1
    frame.Parent = parent

    local label = createTextLabel(name, UDim2.new(0.8, 0, 0, 20), UDim2.new(0, 5, 0, 0), frame)
    label.TextColor3 = Colors.TextPrimary
    label.Font = Font
    label.TextSize = 16

    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(0.9, 0, 0, 10)
    sliderBg.Position = UDim2.new(0, 5, 0, 25)
    sliderBg.BackgroundColor3 = Colors.SliderBackground
    createUICorner(sliderBg, 5)
    sliderBg.Parent = frame

    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Colors.SliderFill
    sliderFill.Parent = sliderBg
    createUICorner(sliderFill, 5)

    local sliderValue = createTextLabel(tostring(default), UDim2.new(0, 30, 0, 20), UDim2.new(1, 5, 0, 5), frame)
    sliderValue.TextColor3 = Colors.TextPrimary
    sliderValue.Font = Font
    sliderValue.TextSize = 16
    sliderValue.TextXAlignment = Enum.TextXAlignment.Right

    local dragging = false

    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    sliderBg.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    sliderBg.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local relativeX = math.clamp(input.Position.X - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
            local newValue = math.floor((relativeX / sliderBg.AbsoluteSize.X) * (max - min) + min)
            sliderFill.Size = UDim2.new((newValue - min) / (max - min), 0, 1, 0)
            sliderValue.Text = tostring(newValue)
            -- Optional: Callback, um Wert zu speichern / anzuwenden
            if frame.OnValueChanged then
                frame.OnValueChanged(newValue)
            end
        end
    end)

    return frame, sliderFill, sliderValue
end

local function createSidebarButton(name, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Colors.Sidebar
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.Font = Font
    btn.TextColor3 = Colors.TextPrimary
    btn.TextSize = 18
    btn.Parent = parent
    createUICorner(btn, 10)

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Colors.Accent
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Colors.Sidebar
    end)

    return btn
end

-- Clear content area children except UIListLayout if present
local function clearContentArea()
    for _, child in ipairs(contentArea:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end
end

-- Display controls inside contentArea
local function displayControls(controls)
    clearContentArea()

    local yOffset = 0
    for _, control in ipairs(controls) do
        if control.Type == "Toggle" then
            local frame, toggleBtn = createToggle(control.Name, control.Default, contentArea)
            frame.Position = UDim2.new(0, 10, 0, yOffset)
            yOffset = yOffset + 35

            -- Beispiel: Funktion bei Änderung (hier: einfach print)
            toggleBtn.MouseButton1Click:Connect(function()
                local enabled = toggleBtn.BackgroundColor3 == Colors.ToggleOn
                print(control.Name .. " ist jetzt " .. tostring(enabled))
                -- Beispiel: WalkSpeed Toggle anwenden
                if control.Name == "Modify WalkSpeed" then
                    if enabled then
                        -- Ermögliche WalkSpeed Modifikation
                        walkSpeedEnabled = true
                    else
                        walkSpeedEnabled = false
                        player.Character.Humanoid.WalkSpeed = 16
                    end
                elseif control.Name == "Modify JumpPower" then
                    if enabled then
                        jumpPowerEnabled = true
                    else
                        jumpPowerEnabled = false
                        player.Character.Humanoid.JumpPower = 50
                    end
                end
            end)

        elseif control.Type == "Slider" then
            local frame, sliderFill, sliderValue = createSlider(control.Name, control.Default, control.Min, control.Max, contentArea)
            frame.Position = UDim2.new(0, 10, 0, yOffset)
            yOffset = yOffset + 55

            -- Beispiel: Slider wert direkt auf Charakter anwenden
            frame.OnValueChanged = function(value)
                sliderValue.Text = tostring(value)
                if control.Name == "WalkSpeed Value" and walkSpeedEnabled then
                    if player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid.WalkSpeed = value
                    end
                elseif control.Name == "JumpPower Value" and jumpPowerEnabled then
                    if player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid.JumpPower = value
                    end
                end
            end

        elseif control.Type == "Button" then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -20, 0, 40)
            btn.Position = UDim2.new(0, 10, 0, yOffset)
            btn.BackgroundColor3 = Colors.Accent
            btn.BorderSizePixel = 0
            btn.Text = control.Name
            btn.Font = Font
            btn.TextColor3 = Colors.TextPrimary
            btn.TextSize = 18
            createUICorner(btn, 10)
            btn.Parent = contentArea
            yOffset = yOffset + 50

            btn.MouseButton1Click:Connect(function()
                print(control.Name .. " Button clicked")
                if control.Name == "Click Teleport" then
                    -- Beispiel: teleportiere Charakter zu Maus Position
                    local mouse = player:GetMouse()
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 3, 0))
                    end
                end
            end)
        end
    end
end

-- Sidebar Buttons und Tabs logik
local sidebarButtons = {}
local selectedCategory
local selectedTab

for _, category in ipairs(categories) do
    local catBtn = createSidebarButton(category.Name, sidebarList)
    sidebarButtons[category.Name] = catBtn

    catBtn.MouseButton1Click:Connect(function()
        -- Entferne Auswahl der alten Kategorie
        if selectedCategory and sidebarButtons[selectedCategory] then
            sidebarButtons[selectedCategory].TextColor3 = Colors.TextPrimary
        end
        selectedCategory = category.Name
        catBtn.TextColor3 = Colors.Accent

        -- Leere Sidebar und zeige Tabs als Unterbuttons
        for _, child in ipairs(sidebarList:GetChildren()) do
            if child ~= catBtn and child:IsA("TextButton") then
                child:Destroy()
            end
        end

        local yPos = 40
        for _, tab in ipairs(category.Tabs) do
            local tabBtn = createSidebarButton("  "..tab.Name, sidebarList)
            tabBtn.TextXAlignment = Enum.TextXAlignment.Left
            tabBtn.Position = UDim2.new(0, 0, 0, yPos)
            tabBtn.Size = UDim2.new(1, 0, 0, 30)
            yPos = yPos + 35

            tabBtn.MouseButton1Click:Connect(function()
                if selectedTabBtn then
                    selectedTabBtn.BackgroundColor3 = Colors.Sidebar
                    selectedTabBtn.TextColor3 = Colors.TextPrimary
                end
                selectedTabBtn = tabBtn
                tabBtn.BackgroundColor3 = Colors.Accent
                tabBtn.TextColor3 = Colors.TextPrimary

                selectedTab = tab.Name
                displayControls(tab.Controls)
            end)
        end
        sidebarList.CanvasSize = UDim2.new(0, 0, 0, yPos)
    end)
end

-- Auto select first category and first tab
if #categories > 0 then
    sidebarButtons[categories[1].Name].MouseButton1Click:Fire()
    wait(0.1)
    local firstTabBtn = nil
    for _, btn in ipairs(sidebarList:GetChildren()) do
        if btn:IsA("TextButton") and btn.Text:match("^%s+%S") then
            firstTabBtn = btn
            break
        end
    end
    if firstTabBtn then
        firstTabBtn.MouseButton1Click:Fire()
    end
end

-- Variablen für WalkSpeed/JumpPower Toggle
local walkSpeedEnabled = false
local jumpPowerEnabled = false




