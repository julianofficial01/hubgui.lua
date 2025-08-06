local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Alle existierenden ScreenGuis mit Namen "Void Hacks" entfernen
for _, gui in pairs(playerGui:GetChildren()) do
    if gui:IsA("ScreenGui") and gui.Name == "Void Hacks" then
        gui:Destroy()
    end
end

-- Neues ScreenGui erstellen
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

local function restartScripts(parent)
    for _, obj in pairs(parent:GetDescendants()) do
        if obj:IsA("Script") or obj:IsA("LocalScript") then
            local success, err = pcall(function()
                obj.Enabled = false
                obj.Enabled = true
            end)
            if not success then
                warn("Script konnte nicht neu gestartet werden: " .. tostring(err))
            end
        end
    end
end

textButton.MouseButton1Click:Connect(function()
    local character = player.Character
    if not character then 
        warn("Kein Charakter vorhanden.")
        return 
    end

    local tool = nil
    for _, child in pairs(character:GetChildren()) do
        if child:IsA("Tool") then
            tool = child
            break
        end
    end

    if tool then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:UnequipTools()
        else
            warn("Kein Humanoid im Charakter gefunden.")
        end
        wait(0.1)

        local clone = tool:Clone()
        clone.Parent = player.Backpack

        restartScripts(clone)

        print("Tool erfolgreich dupliziert!")
    else
        warn("Kein Tool ausgerüstet.")
    end
end)






