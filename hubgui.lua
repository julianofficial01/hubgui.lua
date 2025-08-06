local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ====== SCREEN GUI Setup =======
local screengui = Instance.new("ScreenGui")
screengui.Name = "Void Hacks"
screengui.ResetOnSpawn = false
screengui.Parent = playerGui
screengui.Enabled = true

-- ====== LOADING SCREEN =======
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1,0,1,0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
loadingFrame.Parent = screengui
loadingFrame.ZIndex = 10

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1,0,0,50)
loadingText.Position = UDim2.new(0,0,0.5,-25)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading..."
loadingText.Font = Enum.Font.ArialBold
loadingText.TextColor3 = Color3.fromRGB(150, 150, 255)
loadingText.TextScaled = true
loadingText.Parent = loadingFrame

-- Animate loading text (fade in/out loop)
coroutine.wrap(function()
    while loadingFrame and loadingFrame.Parent do
        for i=0,1,0.02 do
            loadingText.TextColor3 = Color3.fromRGB(150, 150, 255):Lerp(Color3.fromRGB(255,255,255), i)
            wait(0.02)
        end
        for i=0,1,0.02 do
            loadingText.TextColor3 = Color3.fromRGB(255,255,255):Lerp(Color3.fromRGB(150, 150, 255), i)
            wait(0.02)
        end
    end
end)()

-- ====== MAIN FRAME (hidden initially) =======
local mainframe = Instance.new("Frame")
mainframe.Name = "MainFrame"
mainframe.Size = UDim2.new(0, 700, 0, 520)
mainframe.Position = UDim2.new(0.32, 0, 0.18, 0)
mainframe.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
mainframe.Visible = false
mainframe.Active = true
mainframe.Draggable = true
mainframe.Parent = screengui
mainframe.ZIndex = 5

local mainframeCorner = Instance.new("UICorner")
mainframeCorner.CornerRadius = UDim.new(0, 18)
mainframeCorner.Parent = mainframe

local mainframeStroke = Instance.new("UIStroke")
mainframeStroke.Color = Color3.fromRGB(80, 120, 255)
mainframeStroke.Thickness = 3
mainframeStroke.Parent = mainframe

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -120, 0, 45)
title.Position = UDim2.new(0, 20, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Void Hacks"
title.Font = Enum.Font.Arimo
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(235, 235, 235)
title.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainframe

-- CLOSE BUTTON
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 90, 0, 40)
closeButton.Position = UDim2.new(1, -110, 0, 10)
closeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
closeButton.Text = "CLOSE"
closeButton.Font = Enum.Font.Arimo
closeButton.TextScaled = true
closeButton.TextColor3 = Color3.fromRGB(235, 235, 235)
closeButton.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
closeButton.AutoButtonColor = false
closeButton.Parent = mainframe

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 12)
closeCorner.Parent = closeButton

local closeStroke = Instance.new("UIStroke")
closeStroke.Color = Color3.fromRGB(80, 120, 255)
closeStroke.Thickness = 2
closeStroke.Parent = closeButton

closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
    closeButton.TextColor3 = Color3.fromRGB(30, 30, 30)
end)
closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    closeButton.TextColor3 = Color3.fromRGB(235, 235, 235)
end)

closeButton.MouseButton1Click:Connect(function()
    screengui.Enabled = false
end)

-- BOTTOM BUTTONS CONTAINER
local bottomFrame = Instance.new("Frame")
bottomFrame.Size = UDim2.new(1, 0, 0, 50)
bottomFrame.Position = UDim2.new(0, 0, 1, -60)
bottomFrame.BackgroundTransparency = 1
bottomFrame.Parent = mainframe

local uiList = Instance.new("UIListLayout")
uiList.FillDirection = Enum.FillDirection.Horizontal
uiList.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Padding = UDim.new(0, 25)
uiList.Parent = bottomFrame

-- Button Factory (stylish, consistent)
local function createTabButton(text, width)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, width, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = text:upper()
    btn.Font = Enum.Font.Arimo
    btn.TextColor3 = Color3.fromRGB(235, 235, 235)
    btn.TextScaled = true
    btn.AutoButtonColor = false
    btn.Parent = bottomFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(80, 120, 255)
    stroke.Thickness = 2
    stroke.Parent = btn

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
        btn.TextColor3 = Color3.fromRGB(30, 30, 30)
    end)
    btn.MouseLeave:Connect(function()
        if not btn:GetAttribute("Selected") then
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            btn.TextColor3 = Color3.fromRGB(235, 235, 235)
        end
    end)

    return btn
end

local btnMain = createTabButton("Main", 130)
local btnPlayer = createTabButton("Player", 130)
local btnMods = createTabButton("Modifications", 180)

-- ScrollFrames for tabs
local function createScrollFrame()
    local sf = Instance.new("ScrollingFrame")
    sf.Size = UDim2.new(1, -40, 1, -130)
    sf.Position = UDim2.new(0, 20, 0, 60)
    sf.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    sf.BorderSizePixel = 0
    sf.ScrollBarThickness = 8
    sf.Visible = false
    sf.Parent = mainframe

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 18)
    corner.Parent = sf

    return sf
end

local mainScroll = createScrollFrame()
local playerScroll = createScrollFrame()
local modsScroll = createScrollFrame()

-- Show one tab and style buttons
local function selectTab(tabButton, scrollFrame)
    btnMain:SetAttribute("Selected", false)
    btnPlayer:SetAttribute("Selected", false)
    btnMods:SetAttribute("Selected", false)
    btnMain.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btnMain.TextColor3 = Color3.fromRGB(235,235,235)
    btnPlayer.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btnPlayer.TextColor3 = Color3.fromRGB(235,235,235)
    btnMods.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btnMods.TextColor3 = Color3.fromRGB(235,235,235)

    tabButton:SetAttribute("Selected", true)
    tabButton.BackgroundColor3 = Color3.fromRGB(80,120,255)
    tabButton.TextColor3 = Color3.fromRGB(30,30,30)

    mainScroll.Visible = false
    playerScroll.Visible = false
    modsScroll.Visible = false
    scrollFrame.Visible = true
end

selectTab(btnMain, mainScroll)

btnMain.MouseButton1Click:Connect(function()
    selectTab(btnMain, mainScroll)
end)
btnPlayer.MouseButton1Click:Connect(function()
    selectTab(btnPlayer, playerScroll)
end)
btnMods.MouseButton1Click:Connect(function()
    selectTab(btnMods, modsScroll)
end)

-- ======= Main Tab Contents =======

-- Label "MaxRunsYou99"
local labelMR = Instance.new("TextLabel")
labelMR.Size = UDim2.new(1, -40, 0, 40)
labelMR.Position = UDim2.new(0, 20, 0, 20)
labelMR.BackgroundTransparency = 1
labelMR.Text = "MaxRunsYou99"
labelMR.TextColor3 = Color3.fromRGB(220, 220, 220)
labelMR.Font = Enum.Font.Arimo
labelMR.TextScaled = true
labelMR.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
labelMR.TextXAlignment = Enum.TextXAlignment.Left
labelMR.Parent = mainScroll

-- Button "Gun Dupe"
local gunDupeBtn = Instance.new("TextButton")
gunDupeBtn.Size = UDim2.new(0, 260, 0, 50)
gunDupeBtn.Position = UDim2.new(0, 20, 0, 70)
gunDupeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
gunDupeBtn.Text = "Gun Dupe"
gunDupeBtn.Font = Enum.Font.Arimo
gunDupeBtn.TextScaled = true
gunDupeBtn.TextColor3 = Color3.fromRGB(230, 230, 230)
gunDupeBtn.AutoButtonColor = false
gunDupeBtn.Parent = mainScroll

local gunDupeCorner = Instance.new("UICorner")
gunDupeCorner.CornerRadius = UDim.new(0, 14)
gunDupeCorner.Parent = gunDupeBtn

local gunDupeStroke = Instance.new("UIStroke")
gunDupeStroke.Color = Color3.fromRGB(80, 120, 255)
gunDupeStroke.Thickness = 2
gunDupeStroke.Parent = gunDupeBtn

-- Hover effect
gunDupeBtn.MouseEnter:Connect(function()
    gunDupeBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
    gunDupeBtn.TextColor3 = Color3.fromRGB(30, 30, 30)
end)
gunDupeBtn.MouseLeave:Connect(function()
    gunDupeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    gunDupeBtn.TextColor3 = Color3.fromRGB(230, 230, 230)
end)

-- Gun Dupe Functionality
gunDupeBtn.MouseButton1Click:Connect(function()
    local character = player.Character
    if not character then return end

    -- Find equipped tool
    local tool = nil
    for _, child in pairs(character:GetChildren()) do
        if child:IsA("Tool") then
            tool = child
            break
        end
    end

    if tool then
        local backpack = player:FindFirstChildOfClass("Backpack")
        if backpack then
            -- Duplicate the tool and put the duplicate into the backpack
            local clone = tool:Clone()
            clone.Parent = backpack

            -- Unequip the tool
            player.Character.Humanoid:UnequipTools()

            -- Optional: brief flash to indicate success
            gunDupeBtn.Text = "Duplicated!"
            wait(1)
            gunDupeBtn.Text = "Gun Dupe"
        end
    else
        gunDupeBtn.Text = "No Tool Equipped!"
        wait(1.5)
        gunDupeBtn.Text = "Gun Dupe"
    end
end)

-- ===== Keybind: RightShift toggles GUI =====
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        screengui.Enabled = not screengui.Enabled
    end
end)

-- ===== Simulate loading delay and then fade loading screen out, show mainframe =====
task.spawn(function()
    wait(1.5)  -- Simulate loading work
    local tweenOut = TweenService:Create(loadingFrame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
    tweenOut:Play()
    tweenOut.Completed:Wait()
    loadingFrame.Visible = false
    mainframe.Visible = true
end)

