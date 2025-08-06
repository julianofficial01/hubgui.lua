--// Verbesserter GUI Hub mit dunklem Blau-Schwarz Design & Dragging

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MyHub"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- Farben
local colorBackground = Color3.fromRGB(10, 15, 25)      -- Sehr dunkelblau-schwarz
local colorAccent = Color3.fromRGB(0, 120, 255)         -- Blau
local colorButton = Color3.fromRGB(15, 25, 45)          -- Dunkelblau für Buttons
local colorButtonHover = Color3.fromRGB(30, 60, 110)    -- Hover-Farbe für Buttons
local textColor = Color3.fromRGB(220, 220, 240)         -- Hellgrau

-- Hauptframe (dragbar)
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 520, 0, 340)
main.Position = UDim2.new(0.5, -260, 0.5, -170)
main.BackgroundColor3 = colorBackground
main.BorderSizePixel = 0
main.Parent = gui

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 15)
uicorner.Parent = main

local uistroke = Instance.new("UIStroke")
uistroke.Color = colorAccent
uistroke.Thickness = 2
uistroke.Parent = main

-- Drag Funktion
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

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Sidebar für Buttons
local buttonHolder = Instance.new("Frame")
buttonHolder.Size = UDim2.new(0, 140, 1, -20)
buttonHolder.Position = UDim2.new(0, 10, 0, 10)
buttonHolder.BackgroundTransparency = 1
buttonHolder.Parent = main

-- Content-Halter
local contentHolder = Instance.new("Frame")
contentHolder.Size = UDim2.new(1, -160, 1, -20)
contentHolder.Position = UDim2.new(0, 150, 0, 10)
contentHolder.BackgroundTransparency = 1
contentHolder.Name = "ContentHolder"
contentHolder.Parent = main

-- Kategorienliste
local categories = {"Main", "Teleports", "Player", "Settings"}

local function showCategory(name)
	for _, child in pairs(contentHolder:GetChildren()) do
		if child:IsA("Frame") then
			child.Visible = (child.Name == name)
		end
	end
end

-- Button erstellen mit Hover-Effekt
local function createButton(text, parent, yPos)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, 0, 0, 45)
	button.Position = UDim2.new(0, 0, 0, yPos)
	button.BackgroundColor3 = colorButton
	button.TextColor3 = textColor
	button.Font = Enum.Font.GothamSemibold
	button.TextSize = 16
	button.Text = text
	button.AutoButtonColor = false
	button.Parent = parent
	button.ClipsDescendants = true

	local uicornerBtn = Instance.new("UICorner")
	uicornerBtn.CornerRadius = UDim.new(0, 10)
	uicornerBtn.Parent = button

	local uistrokeBtn = Instance.new("UIStroke")
	uistrokeBtn.Color = colorAccent
	uistrokeBtn.Thickness = 1.5
	uistrokeBtn.Parent = button

	-- Hover-Effekt
	button.MouseEnter:Connect(function()
		button.BackgroundColor3 = colorButtonHover
	end)
	button.MouseLeave:Connect(function()
		button.BackgroundColor3 = colorButton
	end)

	return button
end

-- Kategorien & Content erstellen
for i, name in ipairs(categories) do
	local button = createButton(name, buttonHolder, (i - 1) * 50)

	local contentFrame = Instance.new("Frame")
	contentFrame.Size = UDim2.new(1, 0, 1, 0)
	contentFrame.Position = UDim2.new(0, 0, 0, 0)
	contentFrame.BackgroundTransparency = 1
	contentFrame.Visible = false
	contentFrame.Name = name
	contentFrame.Parent = contentHolder

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -20, 0, 50)
	label.Position = UDim2.new(0, 10, 0, 10)
	label.BackgroundTransparency = 1
	label.TextColor3 = textColor
	label.Font = Enum.Font.GothamBold
	label.TextSize = 24
	label.Text = name .. " Panel"
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = contentFrame

	button.MouseButton1Click:Connect(function()
		showCategory(name)
	end)
end

-- Zeige "Main" als Default
showCategory("Main")


