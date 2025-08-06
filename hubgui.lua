local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Alte GUIs löschen
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

-- Rekursive Deep-Copy Funktion inkl. Attribute
local function deepCopy(source)
    local clone = Instance.new(source.ClassName)
    clone.Name = source.Name

    -- Werte kopieren
    -- Versuche Properties zu kopieren (soweit sinnvoll & möglich)
    for _, prop in pairs(source:GetAttributes()) do
        clone:SetAttribute(prop, source:GetAttribute(prop))
    end

    -- Properties wie Ancestry, Parent etc. nicht kopieren
    -- Versuche auch typische Properties (Value, Text, etc.) zu kopieren (optional, je nach Typ)
    -- Das kann man ausbauen, hier ein Beispiel für Values:
    if source:IsA("ValueBase") then
        clone.Value = source.Value
    elseif source:IsA("BoolValue") then
        clone.Value = source.Value
    elseif source:IsA("IntValue") then
        clone.Value = source.Value
    elseif source:IsA("NumberValue") then
        clone.Value = source.Value
    elseif source:IsA("StringValue") then
        clone.Value = source.Value
    elseif source:IsA("ObjectValue") then
        clone.Value = source.Value
    end

    -- Children rekursiv kopieren
    for _, child in pairs(source:GetChildren()) do
        local childClone = deepCopy(child)
        childClone.Parent = clone
    end

    return clone
end

-- Skripte neu starten (Script und LocalScript)
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

    -- Tool im Character suchen
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

        -- Tool komplett deep kopieren (nicht nur clone)
        local clone = deepCopy(tool)
        clone.Parent = player.Backpack

        -- Skripte im Klon neu starten
        restartScripts(clone)

        print("Tool erfolgreich dupliziert!")
    else
        warn("Kein Tool ausgerüstet.")
    end
end)

-- GUI mit Z toggeln
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Z then
        screengui.Enabled = not screengui.Enabled
    end
end)






