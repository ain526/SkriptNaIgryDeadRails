local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local backpack = player.Backpack

-- Создаем GUI для ввода
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Название окна
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 300, 0, 50)
titleLabel.Position = UDim2.new(0, 10, 0, 10)
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Text = "Получить предмет"
titleLabel.Parent = screenGui

-- Поле для названия предмета
local itemNameLabel = Instance.new("TextLabel")
itemNameLabel.Size = UDim2.new(0, 200, 0, 50)
itemNameLabel.Position = UDim2.new(0, 10, 0, 70)
itemNameLabel.Text = "Название предмета:"
itemNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
itemNameLabel.Parent = screenGui

local itemNameInput = Instance.new("TextBox")
itemNameInput.Size = UDim2.new(0, 200, 0, 30)
itemNameInput.Position = UDim2.new(0, 10, 0, 120)
itemNameInput.PlaceholderText = "Введите название предмета"
itemNameInput.Parent = screenGui

-- Кнопка для добавления предмета в инвентарь
local giveItemButton = Instance.new("TextButton")
giveItemButton.Size = UDim2.new(0, 200, 0, 40)
giveItemButton.Position = UDim2.new(0, 10, 0, 160)
giveItemButton.Text = "Добавить в инвентарь"
giveItemButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
giveItemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
giveItemButton.Parent = screenGui

-- Функция для добавления предмета в инвентарь
local function giveItemToBackpack(itemName)
    local item = ReplicatedStorage:FindFirstChild(itemName)
    if item then
        local clonedItem = item:Clone()  -- Клонируем предмет
        clonedItem.Parent = backpack     -- Добавляем в рюкзак игрока
        print("Предмет '" .. itemName .. "' добавлен в инвентарь.")
    else
        warn("Предмет с именем '" .. itemName .. "' не найден в ReplicatedStorage!")
    end
end

-- Обработка нажатия кнопки
giveItemButton.MouseButton1Click:Connect(function()
    local itemName = itemNameInput.Text
    
    -- Проверяем, что введено название предмета
    if itemName ~= "" then
        giveItemToBackpack(itemName)  -- Добавляем предмет в инвентарь
    else
        warn("Введите название предмета!")
    end
end)
