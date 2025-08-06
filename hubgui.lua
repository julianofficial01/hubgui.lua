local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui mit Loading Animation
local screengui = Instance.new("ScreenGui")
screengui.Name = "Void Hacks"
screengui.ResetOnSpawn = false
screengui.Parent = playerGui
screengui.Enabled = false -- erstmal ausblenden

-- Loading Screen
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1,0,1,0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
loadingFrame.Parent = screengui

local loadingLabel = Instance.new("TextLabel")
loadingLabel.Size = UDim2.new(0,200,0,50)
loadingLabel.Position = UDim2.new(0.5,-100,0.5,-25)
loadingLabel.BackgroundTransparency = 1
loadingLabel.TextColor3 = Color3.fromRGB(255,255,255)
loadingLabel.TextScaled = true
loadingLabel.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
loadingLabel.Text = "Loading..."
loadingLabel.Parent = loadingFrame

-- MainFrame
local mainframe = Instance.new("Frame")
mainframe.Name = "MainFrame"
mainframe.BackgroundColor3 = Color3.fromRGB(16,16,16)
mainframe.Size = UDim2.new(0,693,0,507)
mainframe.Position = UDim2.new(0.319,0,0.184,0)
mainframe.Parent = screengui
mainframe.Active = true
mainframe.Draggable = true
mainframe.Visible = false -- erst nach Laden sichtbar

local mfStroke = Instance.new("UIStroke")
mfStroke.Color = Color3.fromRGB(255,255,255)
mfStroke.Thickness = 3
mfStroke.Parent = mainframe

local mfCorner = Instance.new("UICorner")
mfCorner.CornerRadius = UDim.new(0,10)
mfCorner.Parent = mainframe

-- Title Text
local title = Instance.new("TextLabel")
title.Name = "Title"
title.BackgroundTransparency = 1
title.Size = UDim2.new(0,400,0,36)
title.Position = UDim2.new(0.026,0,0.022,0)
title.Text = "Void Hacks"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
title.TextScaled = true
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainframe

-- CLOSE Button (oben rechts)
local closeBtnFrame = Instance.new("Frame")
closeBtnFrame.Name = "CloseBtnFrame"
closeBtnFrame.BackgroundColor3 = Color3.fromRGB(16,16,16)
closeBtnFrame.Size = UDim2.new(0,79,0,27)
closeBtnFrame.Position = UDim2.new(0.865,0,0.022,0)
closeBtnFrame.Parent = mainframe

local closeBtnStroke = Instance.new("UIStroke")
closeBtnStroke.Color = Color3.fromRGB(255,255,255)
closeBtnStroke.Thickness = 2
closeBtnStroke.Parent = closeBtnFrame

local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(0,3)
closeBtnCorner.Parent = closeBtnFrame

local closeBtn = Instance.new("TextButton")
closeBtn.BackgroundTransparency = 1
closeBtn.Size = UDim2.new(1,0,1,0)
closeBtn.Position = UDim2.new(0,0,0,0)
closeBtn.Text = "Close"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
closeBtn.TextScaled = true
closeBtn.Parent = closeBtnFrame

closeBtn.MouseButton1Click:Connect(function()
	local menu = playerGui:FindFirstChild("Void Hacks")
	if menu then
		menu:Destroy()
	end
end)

-- Bottom tab buttons container
local tabsFrame = Instance.new("Frame")
tabsFrame.Name = "TabButtons"
tabsFrame.BackgroundTransparency = 1
tabsFrame.Size = UDim2.new(0,693,0,36)
tabsFrame.Position = UDim2.new(0,0,0.901,0)
tabsFrame.Parent = mainframe

local list = Instance.new("UIListLayout")
list.Parent = tabsFrame
list.FillDirection = Enum.FillDirection.Horizontal
list.HorizontalAlignment = Enum.HorizontalAlignment.Center
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Padding = UDim.new(0,15)

-- Funktion für Tabs mit angepasster Breite (Modifications breiter)
local function mkTab(name)
	local btn = Instance.new("TextButton")
	btn.Name = name.."Tab"
	btn.BackgroundColor3 = Color3.fromRGB(24,24,24)
	btn.Text = name
	btn.TextColor3 = Color3.new(1,1,1)
	btn.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
	btn.TextScaled = true
	btn.Parent = tabsFrame
	
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 2
	stroke.Color = Color3.fromRGB(255,255,255)
	stroke.Parent = btn
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,4)
	corner.Parent = btn
	
	if name == "Modifications" then
		btn.Size = UDim2.new(0,130,0,36)
	else
		btn.Size = UDim2.new(0,100,0,36)
	end
	
	return btn
end

local tabMain = mkTab("Main")
local tabPlayer = mkTab("Player")
local tabMods = mkTab("Modifications")

-- ScrollingFrames Container
local contents = Instance.new("Frame")
contents.Name = "Contents"
contents.Size = UDim2.new(1,0,0.82,0)
contents.Position = UDim2.new(0,0,0.12,0)
contents.BackgroundTransparency = 1
contents.Parent = mainframe

local function mkScrolling(name)
	local sf = Instance.new("ScrollingFrame")
	sf.Name = name
	sf.BackgroundColor3 = Color3.fromRGB(20,20,20)
	sf.Size = UDim2.new(1,-20,1,-20)
	sf.Position = UDim2.new(0,10,0,10)
	sf.CanvasSize = UDim2.new(0,0,1,0)
	sf.ScrollBarThickness = 6
	sf.Parent = contents
	
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(255,255,255)
	stroke.Thickness = 2
	stroke.Parent = sf
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,8)
	corner.Parent = sf
	
	return sf
end

local sfMain = mkScrolling("MainScrollingFrame")
local sfPlayer = mkScrolling("PlayerScrollingFrame")
local sfMods = mkScrolling("ModificationsScrollingFrame")

-- Hide all by default
sfMain.Visible = false
sfPlayer.Visible = false
sfMods.Visible = false

-- Tab switching function
local function showTab(name)
	sfMain.Visible = (name == "Main")
	sfPlayer.Visible = (name == "Player")
	sfMods.Visible = (name == "Modifications")
end

tabMain.MouseButton1Click:Connect(function() showTab("Main") end)
tabPlayer.MouseButton1Click:Connect(function() showTab("Player") end)
tabMods.MouseButton1Click:Connect(function() showTab("Modifications") end)

-- -- MainScrollingFrame: Länglicher Frame mit Text und Toggle Switch

local holder = Instance.new("Frame")
holder.Size = UDim2.new(0.6,0,0,60)
holder.Position = UDim2.new(0.2,0,0.05,0)
holder.BackgroundColor3 = Color3.fromRGB(28,28,28)
holder.Parent = sfMain

local hStroke = Instance.new("UIStroke")
hStroke.Color = Color3.fromRGB(255,255,255)
hStroke.Thickness = 2
hStroke.Parent = holder

local hCorner = Instance.new("UICorner")
hCorner.CornerRadius = UDim.new(0,6)
hCorner.Parent = holder

local label = Instance.new("TextLabel")
label.BackgroundTransparency = 1
label.Size = UDim2.new(0.6,0,1,0)
label.Position = UDim2.new(0,10,0,0)
label.Text = "MaxRunsYou99"
label.TextColor3 = Color3.fromRGB(255,255,255)
label.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
label.TextScaled = true
label.TextXAlignment = Enum.TextXAlignment.Left
label.Parent = holder

-- Toggle Slider (professionell)
local toggleBackground = Instance.new("Frame")
toggleBackground.Size = UDim2.new(0, 50, 0, 28)
toggleBackground.Position = UDim2.new(1, -60, 0.5, 0)
toggleBackground.AnchorPoint = Vector2.new(1, 0.5)
toggleBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleBackground.Parent = holder
toggleBackground.ClipsDescendants = true
toggleBackground.Name = "ToggleBackground"
toggleBackground.AutoButtonColor = false

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0)
toggleCorner.Parent = toggleBackground

local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 24, 0, 24)
toggleButton.Position = UDim2.new(0, 2, 0.5, 0)
toggleButton.AnchorPoint = Vector2.new(0, 0.5)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleButton.Parent = toggleBackground
toggleButton.Name = "ToggleButton"
toggleButton.AutoButtonColor = false

local toggleBtnCorner = Instance.new("UICorner")
toggleBtnCorner.CornerRadius = UDim.new(1, 0)
toggleBtnCorner.Parent = toggleButton

local toggleState = false

local function updateToggle(state)
	if state then
		toggleButton.Position = UDim2.new(1, -26, 0.5, 0)
		toggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
	else
		toggleButton.Position = UDim2.new(0, 2, 0.5, 0)
		toggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
	end
end

toggleButton.MouseButton1Click:Connect(function()
	toggleState = not toggleState
	updateToggle(toggleState)
end)

updateToggle(toggleState)

-- Gun Dupe Button
local dupeBtn = Instance.new("TextButton")
dupeBtn.Size = UDim2.new(0.6,0,0,40)
dupeBtn.Position = UDim2.new(0.2,0,0.15,0)
dupeBtn.BackgroundColor3 = Color3.fromRGB(28,28,28)
dupeBtn.TextColor3 = Color3.fromRGB(255,255,255)
dupeBtn.FontFace = Font.fromName("Arimo", Enum.FontWeight.Bold)
dupeBtn.TextScaled = true
dupeBtn.Text = "Gun Dupe"
dupeBtn.Parent = sfMain

local dupeStroke = Instance.new("UIStroke")
dupeStroke.Color = Color3.fromRGB(255,255,255)
dupeStroke.Thickness = 2
dupeStroke.Parent = dupeBtn

local dupeCorner = Instance.new("UICorner")
dupeCorner.CornerRadius = UDim.new(0,6)
dupeCorner.Parent = dupeBtn

dupeBtn.MouseButton1Click:Connect(function()
	local char = player.Character
	if not char then return end
	
	local tool = nil
	for _, item in pairs(char:GetChildren()) do
		if item:IsA("Tool") then
			tool = item
			break
		end
	end
	
	if tool then
		-- Unequip tool
		player.Character.Humanoid:UnequipTools()
		wait(0.1)
		-- Duplicate tool to Backpack
		local clone = tool:Clone()
		clone.Parent = player.Backpack
		print("Gun duplicated:", clone.Name)
	else
		warn("No tool equipped!")
	end
end)

-- Keybind RightShift toggles GUI
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
		screengui.Enabled = not screengui.Enabled
		
		if screengui.Enabled then
			-- Loading anim
			loadingFrame.Visible = true
			mainframe.Visible = false
			wait(1) -- Ladezeit simulieren
			loadingFrame.Visible = false
			mainframe.Visible = true
		end
	end
end)

-- Starte direkt mit Main Tab sichtbar
showTab("Main")

-- GUI direkt anfangs ausblenden, wird durch Keybind aktiviert
screengui.Enabled = false


