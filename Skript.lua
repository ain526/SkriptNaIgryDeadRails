local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:FindFirstChild("PlayerGui")

-- Создание текстового поля для координат
local positionLabel = Instance.new("TextLabel")
positionLabel.Size = UDim2.new(0, 250, 0, 50)
positionLabel.Position = UDim2.new(0, 10, 0, 10)
positionLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
positionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
positionLabel.TextScaled = true
positionLabel.Parent = screenGui

-- Поле для ввода имени игрока
local playerNameBox = Instance.new("TextBox")
playerNameBox.Size = UDim2.new(0, 200, 0, 40)
playerNameBox.Position = UDim2.new(0, 10, 0, 70)
playerNameBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerNameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
playerNameBox.PlaceholderText = "Введите имя игрока"
playerNameBox.Parent = screenGui

-- Поле для ввода X координаты
local xCoordBox = Instance.new("TextBox")
xCoordBox.Size = UDim2.new(0, 60, 0, 40)
xCoordBox.Position = UDim2.new(0, 10, 0, 120)
xCoordBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
xCoordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
xCoordBox.PlaceholderText = "X"
xCoordBox.Parent = screenGui

-- Поле для ввода Y координаты
local yCoordBox = Instance.new("TextBox")
yCoordBox.Size = UDim2.new(0, 60, 0, 40)
yCoordBox.Position = UDim2.new(0, 80, 0, 120)
yCoordBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
yCoordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
yCoordBox.PlaceholderText = "Y"
yCoordBox.Parent = screenGui

-- Поле для ввода Z координаты
local zCoordBox = Instance.new("TextBox")
zCoordBox.Size = UDim2.new(0, 60, 0, 40)
zCoordBox.Position = UDim2.new(0, 150, 0, 120)
zCoordBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
zCoordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
zCoordBox.PlaceholderText = "Z"
zCoordBox.Parent = screenGui

-- Кнопка для телепортации
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 200, 0, 50)
teleportButton.Position = UDim2.new(0, 10, 0, 180)
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportButton.Text = "Телепортировать"
teleportButton.Parent = screenGui

-- Функция для телепортации игрока
local function teleportPlayer()
    local targetPlayerName = playerNameBox.Text
    local targetPlayer = Players:FindFirstChild(targetPlayerName)

    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local x = tonumber(xCoordBox.Text)
        local y = tonumber(yCoordBox.Text)
        local z = tonumber(zCoordBox.Text)

        if x and y and z then
            targetPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z))
            print("Игрок " .. targetPlayerName .. " телепортирован в (" .. x .. ", " .. y .. ", " .. z .. ")")
        else
            warn("Неверный формат координат!")
        end
    else
        warn("Игрок не найден или его персонаж не загружен!")
    end
end

-- Привязка кнопки к функции
teleportButton.MouseButton1Click:Connect(teleportPlayer)

-- Обновление текущих координат игрока
RunService.RenderStepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local pos = player.Character.HumanoidRootPart.Position
        positionLabel.Text = string.format("Ваши координаты: X: %.2f | Y: %.2f | Z: %.2f", pos.X, pos.Y, pos.Z)
    end
end)
