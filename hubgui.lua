-- VOID HACKS - Loader Menü + ServerHandler
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local ServerScriptService = game:GetService("ServerScriptService")
local LocalPlayer = Players.LocalPlayer

-- RemoteEvents Folder
local remoteFolder = ReplicatedStorage:FindFirstChild("RemoteEvents") or Instance.new("Folder", ReplicatedStorage)
remoteFolder.Name = "RemoteEvents"

local function ensureRemote(name)
	local existing = remoteFolder:FindFirstChild(name)
	if existing then return existing end
	local new = Instance.new("RemoteEvent")
	new.Name = name
	new.Parent = remoteFolder
	return new
end

local bringRemote = ensureRemote("BringPlayer")
local teleportRemote = ensureRemote("TeleportToPlayer")
local emoteRemote = ensureRemote("ForceEmote")

-- 🧠 ServerScript dynamisch erstellen
if not ServerScriptService:FindFirstChild("VoidHackServer") then
	local serverScript = Instance.new("Script")
	serverScript.Name = "VoidHackServer"
	serverScript.Source = [[
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local Events = ReplicatedStorage:WaitForChild("RemoteEvents")

		Events.BringPlayer.OnServerEvent:Connect(function(player, target)
			if target and target.Character and player.Character then
				local hrp = player.Character:FindFirstChild("HumanoidRootPart")
				local t_hrp = target.Character:FindFirstChild("HumanoidRootPart")
				if hrp and t_hrp then
					t_hrp.CFrame = hrp.CFrame + Vector3.new(2, 0, 0)
				end
			end
		end)

		Events.TeleportToPlayer.OnServerEvent:Connect(function(player, target)
			if target and target.Character and player.Character then
				local hrp = player.Character:FindFirstChild("HumanoidRootPart")
				local t_hrp = target.Character:FindFirstChild("HumanoidRootPart")
				if hrp and t_hrp then
					hrp.CFrame = t_hrp.CFrame + Vector3.new(2, 0, 0)
				end
			end
		end)

		Events.ForceEmote.OnServerEvent:Connect(function(player, target, animId)
			if target and target.Character then
				local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
				if humanoid then
					local animation = Instance.new("Animation")
					animation.AnimationId = animId
					local track = humanoid:LoadAnimation(animation)
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

-- 🖼️ GUI + Clientcode
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "VoidHacksGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 600)
Frame.Position = UDim2.new(0.5, -150, 0.5, -300)
Frame.BackgroundColor3 = Color3.new(0, 0, 0)

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "Void Hacks"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.TextColor3 = Color3.new(0, 0, 0)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24

local CloseButton = Instance.new("TextButton", Frame)
CloseButton.Text = "Close"
CloseButton.Size = UDim2.new(0, 60, 0, 30)
CloseButton.Position = UDim2.new(1, -70, 0, 5)
CloseButton.BackgroundColor3 = Color3.new(1, 1, 1)
CloseButton.TextColor3 = Color3.new(0, 0, 0)
CloseButton.MouseButton1Click:Connect(function()
	ScreenGui.Enabled = false
end)

-- Dropdown Creator
local function createDropdown(parent, posY)
	local dropdown = Instance.new("Frame", parent)
	dropdown.Position = UDim2.new(0, 10, 0, posY)
	dropdown.Size = UDim2.new(1, -20, 0, 30)
	dropdown.BackgroundColor3 = Color3.new(1, 1, 1)

	local selectedPlayer = Instance.new("TextLabel", dropdown)
	selectedPlayer.Size = UDim2.new(1, 0, 1, 0)
	selectedPlayer.Text = "Select Player"
	selectedPlayer.TextColor3 = Color3.new(0, 0, 0)
	selectedPlayer.BackgroundTransparency = 1
	selectedPlayer.Font = Enum.Font.SourceSans
	selectedPlayer.TextSize = 18
	selectedPlayer.TextXAlignment = Enum.TextXAlignment.Left

	local dropdownButton = Instance.new("TextButton", dropdown)
	dropdownButton.Size = UDim2.new(1, 0, 1, 0)
	dropdownButton.BackgroundTransparency = 1
	dropdownButton.Text = ""

	local listFrame = Instance.new("Frame", parent)
	listFrame.Position = UDim2.new(0, 10, 0, posY + 30)
	listFrame.Size = UDim2.new(1, -20, 0, 100)
	listFrame.BackgroundColor3 = Color3.new(1, 1, 1)
	listFrame.Visible = false
	listFrame.ClipsDescendants = true

	local UIList = Instance.new("UIListLayout", listFrame)

	local function refreshList()
		for _, child in ipairs(listFrame:GetChildren()) do
			if child:IsA("TextButton") then child:Destroy() end
		end
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer then
				local btn = Instance.new("TextButton", listFrame)
				btn.Text = plr.Name
				btn.Size = UDim2.new(1, 0, 0, 25)
				btn.BackgroundColor3 = Color3.new(0.9, 0.9, 0.9)
				btn.TextColor3 = Color3.new(0, 0, 0)
				btn.MouseButton1Click:Connect(function()
					selectedPlayer.Text = plr.Name
					listFrame.Visible = false
				end)
			end
		end
	end

	Players.PlayerAdded:Connect(refreshList)
	Players.PlayerRemoving:Connect(refreshList)
	dropdownButton.MouseButton1Click:Connect(function()
		listFrame.Visible = not listFrame.Visible
		refreshList()
	end)

	refreshList()
	return selectedPlayer, listFrame
end

-- Bring
local bringLabel = Instance.new("TextLabel", Frame)
bringLabel.Text = "Bring Player:"
bringLabel.Size = UDim2.new(1, -20, 0, 25)
bringLabel.Position = UDim2.new(0, 10, 0, 50)
bringLabel.TextColor3 = Color3.new(1, 1, 1)
bringLabel.BackgroundTransparency = 1

local bringDropdown = createDropdown(Frame, 80)

local bringButton = Instance.new("TextButton", Frame)
bringButton.Text = "Bring"
bringButton.Position = UDim2.new(0, 10, 0, 190)
bringButton.Size = UDim2.new(1, -20, 0, 30)
bringButton.BackgroundColor3 = Color3.new(1, 1, 1)
bringButton.TextColor3 = Color3.new(0, 0, 0)
bringButton.MouseButton1Click:Connect(function()
	local target = Players:FindFirstChild(bringDropdown.Text)
	if target then bringRemote:FireServer(target) end
end)

-- Teleport
local tpLabel = Instance.new("TextLabel", Frame)
tpLabel.Text = "Teleport to Player:"
tpLabel.Size = UDim2.new(1, -20, 0, 25)
tpLabel.Position = UDim2.new(0, 10, 0, 230)
tpLabel.TextColor3 = Color3.new(1, 1, 1)
tpLabel.BackgroundTransparency = 1

local tpDropdown = createDropdown(Frame, 260)

local tpButton = Instance.new("TextButton", Frame)
tpButton.Text = "Teleport"
tpButton.Position = UDim2.new(0, 10, 0, 370)
tpButton.Size = UDim2.new(1, -20, 0, 30)
tpButton.BackgroundColor3 = Color3.new(1, 1, 1)
tpButton.TextColor3 = Color3.new(0, 0, 0)
tpButton.MouseButton1Click:Connect(function()
	local target = Players:FindFirstChild(tpDropdown.Text)
	if target then teleportRemote:FireServer(target) end
end)

-- ForceEmote
local emoteTextBox = Instance.new("TextBox", Frame)
emoteTextBox.PlaceholderText = "Animation ID"
emoteTextBox.Position = UDim2.new(0, 10, 0, 410)
emoteTextBox.Size = UDim2.new(1, -20, 0, 30)
emoteTextBox.BackgroundColor3 = Color3.new(1, 1, 1)
emoteTextBox.TextColor3 = Color3.new(0, 0, 0)

local emoteDropdown = createDropdown(Frame, 450)

local forceBtn = Instance.new("TextButton", Frame)
forceBtn.Text = "Force"
forceBtn.Position = UDim2.new(0, 10, 0, 560)
forceBtn.Size = UDim2.new(1, -20, 0, 30)
forceBtn.BackgroundColor3 = Color3.new(1, 1, 1)
forceBtn.TextColor3 = Color3.new(0, 0, 0)
forceBtn.MouseButton1Click:Connect(function()
	local target = Players:FindFirstChild(emoteDropdown.Text)
	local animId = emoteTextBox.Text
	if target and tonumber(animId) then
		emoteRemote:FireServer(target, "http://www.roblox.com/asset/?id=" .. animId)
	end
end)






