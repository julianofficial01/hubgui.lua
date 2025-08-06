local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local screengui = Instance.new("ScreenGui")
screengui.Name = "Void Hacks"
screengui.ResetOnSpawn = false
screengui.Parent = playerGui

-- MainFrame (draggable, modern style)
local mainframe = Instance.new("Frame")
mainframe.Name = "MainFrame"
mainframe.BackgroundColor3 = Color3.fromRGB(24, 24, 24) -- dunkler und edel
mainframe.Size = UDim2.new(0, 700, 0, 520)
mainframe.Position = UDim2.new(0.32, 0, 0.18, 0)
mainframe.Active = true
mainframe.Draggable = true
mainframe.Parent = screengui

local mainframeStroke = Instance.new("UIStroke")
mainframeStroke.Color = Color3.fromRGB(100, 149, 237) -- Kornblumenblau als Akzent
mainframeStroke.Thickness = 3
mainframeStroke.Parent = mainframe

local mainframeCorner = Instance.new("UICorner")
mainframeCorner.CornerRadius = UDim.new(0, 15)
mainframeCorner.Parent = mainframe

-- Titel
local mainframeTitle = Instance.new("TextLabel")
mainframeTitle.BackgroundTransparency = 1
mainframeTitle.TextXAlignment = Enum.TextXAlignment.Left
mainframeTitle.Size = UDim2.new(1, -100, 0, 40)
mainframeTitle.Position = UDim2.new(0, 20, 0, 10)
mainframeTitle.Text = "Void Hacks"
mainframeTitle.TextColor3 = Color3.fromRGB(235, 235, 235)
mainframeTitle.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
mainframeTitle.TextScaled = true
mainframeTitle.Parent = mainframe

-- Close Button Frame
local closeFrame = Instance.new("Frame")
closeFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
closeFrame.Size = UDim2.new(0, 80, 0, 30)
closeFrame.Position = UDim2.new(1, -90, 0, 10)
closeFrame.AnchorPoint = Vector2.new(0, 0)
closeFrame.Parent = mainframe

local closeFrameCorner = Instance.new("UICorner")
closeFrameCorner.CornerRadius = UDim.new(0, 6)
closeFrameCorner.Parent = closeFrame

local closeFrameStroke = Instance.new("UIStroke")
closeFrameStroke.Color = Color3.fromRGB(100, 149, 237)
closeFrameStroke.Thickness = 2
closeFrameStroke.Parent = closeFrame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(1, 0, 1, 0)
closeButton.BackgroundTransparency = 1
closeButton.Text = "CLOSE"
closeButton.TextColor3 = Color3.fromRGB(235, 235, 235)
closeButton.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
closeButton.TextScaled = true
closeButton.Parent = closeFrame

closeButton.MouseButton1Click:Connect(function()
    screengui.Enabled = false
end)

-- Bottom Buttons Container
local bottomButtonsFrame = Instance.new("Frame")
bottomButtonsFrame.BackgroundTransparency = 1
bottomButtonsFrame.Size = UDim2.new(1, 0, 0, 45)
bottomButtonsFrame.Position = UDim2.new(0, 0, 1, -55)
bottomButtonsFrame.Parent = mainframe

local listLayout = Instance.new("UIListLayout")
listLayout.FillDirection = Enum.FillDirection.Horizontal
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 20)
listLayout.Parent = bottomButtonsFrame

-- Button Factory function for consistent style
local function createBottomButton(text, width)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, width, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    btn.Text = text:upper()
    btn.FontFace = Font.fromName("Arimo", Enum.FontWeight.SemiBold)
    btn.TextColor3 = Color3.fromRGB(235, 235, 235)
    btn.TextScaled = true
    btn.AutoButtonColor = false
    btn.Parent = bottomButtonsFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(100, 149, 237)
    stroke.Thickness = 2
    stroke.Parent = btn

    -- Hover effect
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(100, 149, 237)
        btn.TextColor3 = Color3.fromRGB(30, 30, 30)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
        btn.TextColor3 = Color3.fromRGB(235, 235, 235)
    end)

    return btn
end

local btnMain = createBottomButton("Main", 120)
local btnPlayer = createBottomButton("Player", 120)
local btnMods = createBottomButton("Modifications", 160)

-- ScrollingFrames (für Inhalt)
local function createScrollingFrame()
    local sf = Instance.new("ScrollingFrame")
    sf.Size = UDim2.new(1, -40, 1, -110)
    sf.Position = UDim2.new(0, 20, 0, 60)
    sf.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    sf.BorderSizePixel = 0
    sf.ScrollBarThickness = 8
    sf.CanvasSize = UDim2.new(0, 0, 1, 0)
    sf.Visible = false
    sf.Parent = mainframe

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 15)
    corner.Parent = sf

    return sf
end

local mainScroll = createScrollingFrame()
local playerScroll = createScrollingFrame()
local modsScroll = createScrollingFrame()

-- Show only mainScroll initially
mainScroll.Visible = true

-- Toggle function for bottom buttons
local function showFrame(frame)
    mainScroll.Visible = false
    playerScroll.Visible = false
    modsScroll.Visible = false
    frame.Visible = true
end

btnMain.MouseButton1Click:Connect(function()
    showFrame(mainScroll)
end)

btnPlayer.MouseButton1Click:Connect(function()
    showFrame(playerScroll)
end)

btnMods.MouseButton1Click:Connect(function()
    showFrame(modsScroll)
end)

-- MainScroll: Professioneller Toggle Switch mit Text "MaxRunsYou99"
local toggleContainer = Instance.new("Frame")
toggleContainer.Size = UDim2.new(0, 280, 0, 60)
toggleContainer.Position = UDim2.new(0.5, -140, 0.5, -30)
toggleContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleContainer.Parent = mainScroll

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = toggleContainer

-- Beschriftung links
local toggleLabel = Instance.new("TextLabel")
toggleLabel.Size = UDim2.new(0.65, 0, 1, 0)
toggleLabel.BackgroundTransparency = 1
toggleLabel.Text = "MaxRunsYou99"
toggleLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
toggleLabel.FontFace = Font.fromName("Arimo", Enum.FontWeight.SemiBold)
toggleLabel.TextScaled = true
toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
toggleLabel.Parent = toggleContainer

-- Toggle Switch (Slider)
local toggleSwitch = Instance.new("Frame")
toggleSwitch.Size = UDim2.new(0, 60, 0, 28)
toggleSwitch.Position = UDim2.new(0.7, 0, 0.5, 0)
toggleSwitch.AnchorPoint = Vector2.new(0, 0.5)
toggleSwitch.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggleSwitch.Parent = toggleContainer

local toggleSwitchCorner = Instance.new("UICorner")
toggleSwitchCorner.CornerRadius = UDim.new(0, 14)
toggleSwitchCorner.Parent = toggleSwitch

local toggleButton = Instance.new("Frame")
toggleButton.Size = UDim2.new(0, 26, 0, 26)
toggleButton.Position = UDim2.new(0, 2, 0, 1)
toggleButton.BackgroundColor3 = Color3.fromRGB(100, 149, 237)
toggleButton.Parent = toggleSwitch

local toggleButtonCorner = Instance.new("UICorner")
toggleButtonCorner.CornerRadius = UDim.new(0, 13)
toggleButtonCorner.Parent = toggleButton

local toggleOn = false

local function updateToggle()
    if toggleOn then
        toggleButton:TweenPosition(UDim2.new(1, -28, 0, 1), "Out", "Quad", 0.3, true)
        toggleSwitch.BackgroundColor3 = Color3.fromRGB(100, 149, 237)
    else
        toggleButton:TweenPosition(UDim2.new(0, 2, 0, 1), "Out", "Quad", 0.3, true)
        toggleSwitch.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end

toggleSwitch.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        toggleOn = not toggleOn
        updateToggle()
    end
end)

updateToggle()

-- Keybind: RightShift toggled GUI visibility
local guiVisible = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        guiVisible = not guiVisible
        screengui.Enabled = guiVisible
    end
end)







