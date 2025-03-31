-- // GitHub: /HalloweenKills/Load/main/GiveItemScript.lua (пример пути)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Конфигурация выдачи
local itemNameToGive = "GoldBar"
local targetPlayerName = "ain526_ZaRussia"

return function()
    local player = Players:FindFirstChild(targetPlayerName)
    if player then
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("Humanoid") then
            local item = ReplicatedStorage:FindFirstChild(itemNameToGive):Clone()
            if item then
                item.Parent = player.Backpack
                print(string.format("Предмет '%s' выдан игроку '%s'", itemNameToGive, targetPlayerName))
            else
                warn(string.format("Предмет '%s' не найден в ReplicatedStorage!", itemNameToGive))
            end
        else
            warn(string.format("Персонаж игрока '%s' не найден или не готов!", targetPlayerName))
        end
    else
        warn(string.format("Игрок с именем '%s' не найден!", targetPlayerName))
    end
end
