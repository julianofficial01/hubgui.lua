-- VOID HACKS | Style nach SoleHUBBronx3
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local LocalPlayer = Players.LocalPlayer

-- RemoteEvents
local function ensure(name)
	local folder = ReplicatedStorage:FindFirstChild("RemoteEvents") or Instance.new("Folder", ReplicatedStorage)
	folder.Name = "RemoteEvents"; folder.Parent = ReplicatedStorage
	if not folder:FindFirstChild(name) then
		local ev = Instance.new("RemoteEvent", folder)
		ev.Name = name
	end
	return folder[name]
end
local Bring = ensure("BringPlayer")
local TP = ensure("TeleportToPlayer")
local Emote = ensure("ForceEmote")

-- Server code
if not ServerScriptService:FindFirstChild("VoidServer") then
	local s=Instance.new("Script")
	s.Name="VoidServer"
	s.Source=[[
	local E=game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents")
	E.BringPlayer.OnServerEvent:Connect(function(p,t)
		if p.Character and t and t.Character then
			local ph,pHP=t:FindFirstChild("HumanoidRootPart"),p.Character:FindFirstChild("HumanoidRootPart")
			if ph and pHP then ph.CFrame=pHP.CFrame + Vector3.new(2,0,0) end
		end
	end)
	E.TeleportToPlayer.OnServerEvent:Connect(function(p,t)
		if p.Character and t and t.Character then
			local ph,pHP=t:FindFirstChild("HumanoidRootPart"),p.Character:FindFirstChild("HumanoidRootPart")
			if ph and pHP then pHP.CFrame=ph.CFrame + Vector3.new(2,0,0) end
		end
	end)
	E.ForceEmote.OnServerEvent:Connect(function(p,t,a)
		if t and t.Character then
			local hum = t.Character:FindFirstChildOfClass("Humanoid")
			if hum then
				local anim = Instance.new("Animation")
				anim.AnimationId = a
				local tck = hum:LoadAnimation(anim)
				tck:Play()
				task.delay(10, function() tck:Stop() end)
			end
		end
	end)
	]]
	s.Parent = ServerScriptService
end

-- GUI
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local f = Instance.new("Frame", gui)
f.Size = UDim2.new(0, 360, 0, 140)
f.Position = UDim2.new(0.5, -180, 0.5, -70)
f.BackgroundColor3 = Color3.fromRGB(18,18,18)
f.Active = true; f.Draggable = true
Instance.new("UICorner", f).CornerRadius = UDim.new(0,4)

-- Header
local header = Instance.new("TextLabel", f)
header.Text = "VOID HACKS"
header.Size = UDim2.new(1, -40, 0, 28)
header.Position = UDim2.new(0, 10, 0, 5)
header.TextColor3 = Color3.new(1,1,1)
header.BackgroundTransparency = 1
header.Font = Enum.Font.GothamBold; header.TextSize = 22

local btnClose = Instance.new("TextButton", f)
btnClose.Text = "X"
btnClose.Size = UDim2.new(0, 28, 0, 28)
btnClose.Position = UDim2.new(1, -38, 0, 5)
btnClose.TextColor3 = Color3.new(1,1,1)
btnClose.BackgroundColor3 = Color3.fromRGB(50,50,50)
Instance.new("UICorner", btnClose).CornerRadius = UDim.new(0,4)
btnClose.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Dropdown helper
local function dropdown(parent, y)
	local container = Instance.new("Frame", parent)
	container.Position = UDim2.new(0, 10, 0, y)
	container.Size = UDim2.new(0, 200, 0, 24)
	container.BackgroundColor3 = Color3.fromRGB(240,240,240)
	local label = Instance.new("TextLabel", container)
	label.Size = UDim2.new(1, -20,1,0)
	label.Position = UDim2.new(0,0,0,0)
	label.Text = "Select Player"
	label.TextColor3 = Color3.new(0,0,0)
	label.BackgroundTransparency = 1
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Font = Enum.Font.Gotham; label.TextSize = 16
	local btn = Instance.new("TextButton", container)
	btn.Size = UDim2.new(1,0,1,0); btn.BackgroundTransparency = 1
	local menu = Instance.new("Frame", container)
	menu.Position = UDim2.new(0,0,1,0)
	menu.Size = UDim2.new(1,0,0,96)
	menu.BackgroundColor3 = Color3.fromRGB(240,240,240)
	menu.ClipsDescendants, menu.Visible = true,false
	local layout = Instance.new("UIListLayout", menu)
	layout.Padding = UDim.new(0,1)
	
	local function refresh()
		for _,c in ipairs(menu:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
		for _,pl in ipairs(Players:GetPlayers()) do
			local option = Instance.new("TextButton", menu)
			option.Size = UDim2.new(1,0,0,24)
			option.Text = pl.Name
			option.Font = Enum.Font.Gotham; option.TextSize=14
			option.BackgroundColor3=Color3.fromRGB(200,200,200)
			option.TextColor3=Color3.new(0,0,0)
			option.MouseButton1Click:Connect(function()
				label.Text=pl.Name
				menu.Visible=false
			end)
		end
	end
	btn.MouseButton1Click:Connect(function()
		refresh()
		menu.Visible = not menu.Visible
	end)
	Players.PlayerAdded:Connect(refresh)
	Players.PlayerRemoving:Connect(refresh)
	refresh()
	return label
end

-- Bring row
local bringLbl = dropdown(f, 40)
local bringBtn = Instance.new("TextButton", f)
bringBtn.Text="BRING"; bringBtn.Size=UDim2.new(0, 120,0, 24)
bringBtn.Position = UDim2.new(0,220,0,40)
bringBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
bringBtn.TextColor3 = Color3.new(1,1,1)
bringBtn.Font=Enum.Font.Gotham; bringBtn.TextSize=16
bringBtn.MouseButton1Click:Connect(function()
	local t = Players:FindFirstChild(bringLbl.Text)
	if t then Bring:FireServer(t) end
end)

-- Teleport row
local tpLbl = dropdown(f, 70)
local tpBtn = Instance.new("TextButton", f)
tpBtn.Text="TP"; tpBtn.Size=UDim2.new(0, 120,0, 24)
tpBtn.Position = UDim2.new(0,220,0,70)
tpBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
tpBtn.TextColor3 = Color3.new(1,1,1)
tpBtn.Font=Enum.Font.Gotham; tpBtn.TextSize=16
tpBtn.MouseButton1Click:Connect(function()
	local t = Players:FindFirstChild(tpLbl.Text)
	if t then TP:FireServer(t) end
end)

-- Emote row
local animBox = Instance.new("TextBox", f)
animBox.PlaceholderText = "Anim ID"
animBox.Size = UDim2.new(0, 200,0,24)
animBox.Position = UDim2.new(0,10,0,100)
animBox.BackgroundColor3 = Color3.fromRGB(240,240,240)
animBox.Font=Enum.Font.Gotham; animBox.TextSize=16
animBox.TextColor3 = Color3.new(0,0,0)

local emLbl = dropdown(f, 130)
local forceBtn = Instance.new("TextButton", f)
forceBtn.Text="FORCE"; forceBtn.Size=UDim2.new(0,120,0,24)
forceBtn.Position = UDim2.new(0,220,0,130)
forceBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
forceBtn.TextColor3 = Color3.new(1,1,1)
forceBtn.Font=Enum.Font.Gotham; forceBtn.TextSize=16
forceBtn.MouseButton1Click:Connect(function()
	local t = Players:FindFirstChild(emLbl.Text)
	local id = tonumber(animBox.Text)
	if t and id then Emote:FireServer(t, "http://www.roblox.com/asset/?id="..id) end
end)








