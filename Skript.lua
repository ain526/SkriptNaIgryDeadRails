local train = game.Workspace:FindFirstChild("Train") -- Поиск поезда
if train then
    -- Попробуем изменить скорость через BodyVelocity
    local bodyVelocity = train:FindFirstChildWhichIsA("BodyVelocity", true)
    if bodyVelocity then
        bodyVelocity.Velocity = bodyVelocity.Velocity * 2 -- Увеличиваем скорость в 2 раза
        print("Скорость поезда увеличена через BodyVelocity")
    end

    -- Попробуем изменить скорость через VehicleSeat
    local seat = train:FindFirstChildWhichIsA("VehicleSeat", true)
    if seat then
        seat.Throttle = 1 -- Вперед
        print("Скорость поезда увеличена через VehicleSeat")
    end

    -- Попробуем изменить LinearVelocity
    local linearVelocity = train:FindFirstChildWhichIsA("LinearVelocity", true)
    if linearVelocity then
        linearVelocity.MaxForce = linearVelocity.MaxForce * 2
        print("Скорость поезда увеличена через LinearVelocity")
    end
else
    warn("Поезд не найден!")
end
