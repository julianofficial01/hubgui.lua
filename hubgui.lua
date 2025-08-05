--// GUI Hub mit schwarzem Hintergrund & blauen Akzenten
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MyHub"
gui.ResetOnSpawn = false

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 500, 0, 300)
main.Position = UDim2.new(0.5, -250, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 120, 255)
stroke.Thickness = 2
stroke.Parent = main

local categories = {"Main", "Teleports", "Player", "Settings"}

local buttonHolder = Instance.new("Frame")
buttonHolder.Size = UDim2.new(0, 120, 1, 0)
buttonHolder.Position = UDim2.new(0, 0, 0, 0)
buttonHolder.BackgroundTransparency = 1
buttonHolder.Parent = main

local contentHolder = Instance.new("Frame")
contentHolder.Size = UDim2.new(1, -130, 1, -10)
contentHolder.Position = UDim2.new(0, 130, 0, 5)
contentHolder.BackgroundTransparency = 1
contentHolder.Name = "ContentHolder"
contentHolder.Parent = main

local function showCategory(name)
	for _, child in pairs(contentHolder:GetChildren()) do
		if child:IsA("Frame") then
			child.Visible = (child.Name == name)
		end
	end
end

for i, name in ipairs(categories) do
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, -10, 0, 40)
	button.Position = UDim2.new(0, 5, 0, ((i - 1) * 45) + 10)
	button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Font = Enum.Font.Gotham
	button.TextSize = 14
	button.Text = name
	button.Parent = buttonHolder

	local uiCorner = Instance.new("UICorner")
	uiCorner.CornerRadius = UDim.new(0, 8)
	uiCorner.Parent = button

	local contentFrame = Instance.new("Frame")
	contentFrame.Size = UDim2.new(1, 0, 1, 0)
	contentFrame.Position = UDim2.new(0, 0, 0, 0)
	contentFrame.BackgroundTransparency = 1
	contentFrame.Visible = false
	contentFrame.Name = name
	contentFrame.Parent = contentHolder

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -10, 0, 40)
	label.Position = UDim2.new(0, 5, 0, 10)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 18
	label.Text = name .. " Panel"
	label.Parent = contentFrame

	button.MouseButton1Click:Connect(function()
		showCategory(name)
	end)
end

showCategory("Main")
