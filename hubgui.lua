-- Void Hacks Final UI by ChatGPT – 2025 Edition
-- Visual-Only GUI, Professional Look & Feel

if game:GetService("CoreGui"):FindFirstChild("VoidHacksUI") then
	game:GetService("CoreGui"):FindFirstChild("VoidHacksUI"):Destroy()
end

local player = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "VoidHacksUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

-- Main
local main = Instance.new("Frame", gui)
main.Name = "Main"
main.Size = UDim2.new(0, 650, 0, 400)
main.Position = UDim2.new(0.5, -325, 0.5, -200)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

-- Topbar
local topbar = Instance.new("Frame", main)
topbar.Size = UDim2.new(1, 0, 0, 40)
topbar.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
Instance.new("UICorner", topbar).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", topbar)
title.Text = "VOID HACKS"
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 22
title.TextXAlignment = Enum.TextXAlignment.Left

-- Close button
local close = Instance.new("TextButton", topbar)
close.Text = "✕"
close.Size = UDim2.new(0, 40, 1, 0)
close.Position = UDim2.new(1, -40, 0, 0)
close.BackgroundTransparency = 1
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.Font = Enum.Font.GothamBold
close.TextSize = 22
close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- Sidebar
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 150, 1, -40)
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
local sidebarLayout = Instance.new("UIListLayout", sidebar)
sidebarLayout.Padding = UDim.new(0, 8)
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Content Frame
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, -150, 1, -40)
content.Position = UDim2.new(0, 150, 0, 40)
content.BackgroundColor3 = Color3.fromRGB(24, 24, 24)

-- Tabs & Content Setup
local tabNames = {"ESP", "Aimbot", "Player", "Misc", "Settings"}
local contentFrames = {}

local function createTab(tabName)
	local btn = Instance.new("TextButton", sidebar)
	btn.Size = UDim2.new(1, -20, 0, 35)
	btn.Text = "  " .. tabName
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 16
	btn.BorderSizePixel = 0
	btn.TextXAlignment = Enum.TextXAlignment.Left
	local corner = Instance.new("UICorner", btn)
	corner.CornerRadius = UDim.new(0, 6)

	local tabFrame = Instance.new("ScrollingFrame", content)
	tabFrame.Size = UDim2.new(1, 0, 1, 0)
	tabFrame.BackgroundTransparency = 1
	tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	tabFrame.ScrollBarThickness = 4
	tabFrame.Visible = false
	contentFrames[tabName] = tabFrame

	local layout = Instance.new("UIListLayout", tabFrame)
	layout.Padding = UDim.new(0, 6)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	local padding = Instance.new("UIPadding", tabFrame)
	padding.PaddingTop = UDim.new(0, 10)
	padding.PaddingLeft = UDim.new(0, 12)
	padding.PaddingRight = UDim.new(0, 12)

	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	end)
	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	end)

	btn.MouseButton1Click:Connect(function()
		for _, frame in pairs(contentFrames) do
			frame.Visible = false
		end
		tabFrame.Visible = true
	end)
end

for _, tab in ipairs(tabNames) do
	createTab(tab)
end

contentFrames["ESP"].Visible = true

-- Toggle creator
local function createToggle(text, parent)
	local holder = Instance.new("Frame", parent)
	holder.Size = UDim2.new(1, 0, 0, 30)
	holder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Instance.new("UICorner", holder).CornerRadius = UDim.new(0, 6)

	local label = Instance.new("TextLabel", holder)
	label.Text = text
	label.Size = UDim2.new(0.75, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(240, 240, 240)
	label.Font = Enum.Font.Gotham
	label.TextSize = 14
	label.TextXAlignment = Enum.TextXAlignment.Left

	local toggle = Instance.new("TextButton", holder)
	toggle.Text = "OFF"
	toggle.Size = UDim2.new(0, 60, 0, 24)
	toggle.Position = UDim2.new(1, -70, 0.5, -12)
	toggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
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

-- Real Button (Gun Dupe)
local function createButton(text, parent)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
end

-- Populate ESP
for _, opt in ipairs({"Name", "Health", "Distance", "Tool", "Box", "Chams"}) do
	createToggle(opt, contentFrames["ESP"])
end

-- Populate Aimbot
for _, opt in ipairs({"FOV", "Prediction", "Smoothing", "Team Check"}) do
	createToggle(opt, contentFrames["Aimbot"])
end

-- Populate Player
for _, opt in ipairs({"WalkSpeed", "JumpPower", "Fly", "NoClip"}) do
	createToggle(opt, contentFrames["Player"])
end

-- Populate Misc
createButton("DUPE", contentFrames["Misc"]) -- <- Gun Dupe
for _, opt in ipairs({"Anti-Lag", "Auto Pickup", "Rejoin"}) do
	createToggle(opt, contentFrames["Misc"])
end

-- Populate Settings
for _, opt in ipairs({"Dark Theme", "Close UI", "Void Hacks Info"}) do
	createToggle(opt, contentFrames["Settings"])
end

-- RightShift hide/show
local visible = true
UIS.InputBegan:Connect(function(input, gpe)
	if input.KeyCode == Enum.KeyCode.RightShift and not gpe then
		visible = not visible
		gui.Enabled = visible
	end
end)







