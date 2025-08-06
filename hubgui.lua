--// VOID HACKS MOD MENU [Client + Server Setup]
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local LocalPlayer = Players.LocalPlayer

-- Setup RemoteEvents
local function ensureRemote(name)
	local folder = ReplicatedStorage:FindFirstChild("RemoteEvents") or Instance.new("Folder", ReplicatedStorage)
	folder.Name = "RemoteEvents"
	folder.Parent = ReplicatedStorage

	local remote = folder:FindFirstChild(name)
	if not remote then
		remote = Instance.new("RemoteEvent")
		remote.Name = name
		remote.Parent = folder
	end
	return remote
end

local BringEvent = ensureRemote("BringPlayer")
local TeleportEvent = ensureRemote("TeleportToPlayer")
local ForceEmoteEvent = ensureRemote("ForceEmote")

-- ServerScript erstellen falls nicht vorhanden
if not ServerScriptService:FindFirstChild("VoidServer") then
	local serverScript = Instance.new("Script")
	serverScript.Name = "VoidServer"
	serverScript.Source = [[
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local Events = ReplicatedStorage:WaitForChild("RemoteEvents")
		
		Events.BringPlayer.OnServerEvent:Connect(function(plr, target)
			if target and target.Character and plr.Character then
				local tHRP = target.Character:FindFirstChild("HumanoidRootPart")
				local pHRP = plr.Character:FindFirstChild("HumanoidRootPart")
				if tHRP and pHRP then
					tHRP.CFrame = pHRP.CFrame + Vector3.new(2, 0, 0)
				end
			end
		end)

		Events.TeleportToPlayer.OnServerEvent:Connect(function(plr, target)
			if target and target.Character and plr.Character then
				local tHRP = target.Character:FindFirstChild("HumanoidRootPart")
				local pHRP = plr.Character:FindFirstChild("HumanoidRootPart")
				if tHRP and pHRP then
					pHRP.CFrame = tHRP.CFrame + Vector3.new(2, 0, 0)
				end
			end
		end)

		Events.ForceEmote.OnServerEvent:Connect(function(plr, target, animId)
			if target and target.Character then
				local hum = target.Character:FindFirstChildOfClass("Humanoid")
				if hum then
					local anim = Instance.new("Animation")
					anim.AnimationId = animId
					local track = hum:LoadAnimation(anim)
					track:Play()
					task.delay(10, function()
						track:Stop()
					end)
				end
			end
		end)
	]]
	serverScript.Parent = ServerScriptService
end

-- GUI erstellen
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "VoidHacksGUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 250)
frame.Position = UDim2.new(0.5, -150, 0.5, -125)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Active = true
frame.Draggable = true

local uicorner = Instance.new("UICorner", frame)
uicorner.CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", frame)
title.Text = "Void Hacks"
title.Size = UDim2.new(1, -40, 0, 30)
title.Position = UDim2.new(0, 10, 0, 5)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.TextXAlignment = Enum.TextXAlignment.Left

local close = Instance.new("TextButton", frame)
close.Text = "X"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.BackgroundColor3 = Color3.new(1, 1, 1)
close.TextColor3 = Color3.new(0, 0, 0)
close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- Utility: Player Dropdown
local function createPlayerDropdown(yPos)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, -20, 0, 25)
	frame.Position = UDim2.new(0, 10, 0, yPos)
	frame.BackgroundColor3 = Color3.new(1,1,1)
	
	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = "Select Player"
	label.TextColor3 = Color3.new(0,0,0)
	label.TextXAlignment = Enum.TextXAlignment.Left
	
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.Text = ""
	btn.BackgroundTransparency = 1
	
	local menu = Instance.new("Frame", frame)
	menu.Size = UDim2.new(1, 0, 0, 100)
	menu.Position = UDim2.new(0, 0, 1, 0)
	menu.BackgroundColor3 = Color3.new(1,1,1)
	menu.Visible = false
	menu.ClipsDescendants = true
	
	local layout = Instance.new("UIListLayout", menu)

	local function refresh()
		for _, c in pairs(menu:GetChildren()) do
			if c:IsA("TextButton") then c:Destroy() end
		end
		for _, p in ipairs(Players:GetPlayers()) do
			local option = Instance.new("TextButton", menu)
			option.Text = p.Name
			option.Size = UDim2.new(1, 0, 0, 20)
			option.BackgroundColor3 = Color3.new(0.9,0.9,0.9)
			option.TextColor3 = Color3.new(0,0,0)
			option.MouseButton1Click:Connect(function()
				label.Text = p.Name
				menu.Visible = false
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
	return frame, label
end

-- Bring
local bringDropdown, bringLabel = createPlayerDropdown(40)
bringDropdown.Parent = frame

local bringBtn = Instance.new("TextButton", frame)
bringBtn.Text = "Bring"
bringBtn.Position = UDim2.new(0, 10, 0, 70)
bringBtn.Size = UDim2.new(1, -20, 0, 25)
bringBtn.BackgroundColor3 = Color3.new(1,1,1)
bringBtn.TextColor3 = Color3.new(0,0,0)
bringBtn.MouseButton1Click:Connect(function()
	local target = Players:FindFirstChild(bringLabel.Text)
	if target then BringEvent:FireServer(target) end
end)

-- Teleport
local tpDropdown, tpLabel = createPlayerDropdown(105)
tpDropdown.Parent = frame

local tpBtn = Instance.new("TextButton", frame)
tpBtn.Text = "Teleport"
tpBtn.Position = UDim2.new(0, 10, 0, 135)
tpBtn.Size = UDim2.new(1, -20, 0, 25)
tpBtn.BackgroundColor3 = Color3.new(1,1,1)
tpBtn.TextColor3 = Color3.new(0,0,0)
tpBtn.MouseButton1Click:Connect(function()
	local target = Players:FindFirstChild(tpLabel.Text)
	if target then TeleportEvent:FireServer(target) end
end)

-- Emote
local emoteBox = Instance.new("TextBox", frame)
emoteBox.PlaceholderText = "Animation ID"
emoteBox.Position = UDim2.new(0, 10, 0, 170)
emoteBox.Size = UDim2.new(1, -20, 0, 25)
emoteBox.BackgroundColor3 = Color3.new(1,1,1)
emoteBox.TextColor3 = Color3.new(0,0,0)

local emoteDropdown, emoteLabel = createPlayerDropdown(200)
emoteDropdown.Parent = frame

local forceBtn = Instance.new("TextButton", frame)
forceBtn.Text = "Force"
forceBtn.Position = UDim2.new(0, 10, 0, 230)
forceBtn.Size = UDim2.new(1, -20, 0, 25)
forceBtn.BackgroundColor3 = Color3.new(1,1,1)
forceBtn.TextColor3 = Color3.new(0,0,0)
forceBtn.MouseButton1Click:Connect(function()
	local target = Players:FindFirstChild(emoteLabel.Text)
	local id = emoteBox.Text
	if target and tonumber(id) then
		ForceEmoteEvent:FireServer(target, "http://www.roblox.com/asset/?id=" .. id)
	end
end)








