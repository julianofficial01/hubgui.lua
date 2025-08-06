local Players = game:GetService("Players")
local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")

local screengui = Instance.new("ScreenGui")
screengui.Name = "Void Hacks"
screengui.ResetOnSpawn = false
screengui.Parent = playerGui

local textButton = Instance.new("TextButton")
textButton.Parent = screengui
textButton.Size = UDim2.new(0, 200, 0, 50)
textButton.Position = UDim2.new(0.5, -100, 0.5, -25)
textButton.Text = "Dupe"
textButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton.BackgroundTransparency = 0.5
textButton.TextTransparency = 0.5
textButton.BorderSizePixel = 0
textButton.ZIndex = 10

textButton.MouseButton1Click:Connect(function()
	local character = player.Character
	if not character then return end

	-- Suche nach einem Tool im Charakter
	local tool = nil
	for _, child in pairs(character:GetChildren()) do
		if child:IsA("Tool") then
			tool = child
			break
		end
	end

	if tool then
		-- Unequip the tool
		player.Character.Humanoid:UnequipTools()
		wait(0.1) -- Kleiner Delay, um das Unequip sicher abzuschließen

		-- Klonen und ins Backpack packen
		local clone = tool:Clone()
		clone.Parent = player.Backpack
	else
		print("Kein Tool ausgerüstet.")
	end
end)


