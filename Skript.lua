local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Создаем объект для отображения названия предмета при наведении
local itemNameLabel = Instance.new("TextLabel")
itemNameLabel.Size = UDim2.new(0, 200, 0, 50)
itemNameLabel.Position = UDim2.new(0, 0, 0, 0)
itemNameLabel.BackgroundTransparency = 1
itemNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
itemNameLabel.TextScaled = true
itemNameLabel.Text = "Название предмета"
itemNameLabel.Visible = false  -- Сначала скрыто
itemNameLabel.Parent = screenGui

-- Функция для отслеживания наведения на предметы
local function onItemHover(item)
    itemNameLabel.Text = item.Name  -- Показываем имя предмета
    itemNameLabel.Visible = true    -- Показываем название
end

-- Функция для скрытия названия, когда мышь уходит с предмета
local function onItemUnhover()
    itemNameLabel.Visible = false
end

-- Проверка на объекты типа Tool в StarterPack
local function checkForHover()
    local target = mouse.Target
    if target and target:IsA("Tool") then
        onItemHover(target)
    else
        onItemUnhover()
    end
end

-- Подключаем отслеживание движения мыши
mouse.Move:Connect(checkForHover)

-- Создаем список предметов в StarterPack
local StarterPack = game:GetService("StarterPack")

-- Функция для отображения списка предметов
local function updateItemList()
    -- Очистка списка
    -- (Допустим, у вас есть код для добавления кнопок в список предметов)
end

-- Функция для добавления предмета в инвентарь
local function giveItemToBackpack(itemName)
    local item = StarterPack:FindFirstChild(itemName)
    if item then
        local clonedItem = item:Clone()  -- Клонируем предмет
        clonedItem.Parent = player.Backpack     -- Добавляем в рюкзак игрока
        print("Предмет '" .. itemName .. "' добавлен в инвентарь.")
    else
        warn("Предмет с именем '" .. itemName .. "' не найден в StarterPack!")
    end
end

-- Функция для обновления GUI и взаимодействия с кнопками и предметами
updateItemList()
