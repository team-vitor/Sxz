-- Services
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

-- Variables
local placeId = game.PlaceId
local UniverseID = HttpService:JSONDecode(
    game:HttpGet("https://apis.roblox.com/universes/v1/places/"..placeId.."/universe")
).universeId

-- Anti-Idle
Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- Game Loader

if placeId == 121864768012064 then
    -- Fish It: only show "Back Soon" message, no other notifications
    StarterGui:SetCore("SendNotification", {
        Title = "Sxz Hub",
        Text = "Fish It não está funcionando",
        Icon = "rbxassetid://113216348436285",
        Duration = 8
    })
    return -- Importante: Para garantir que nenhuma outra lógica seja executada após a notificação do Fish It
end

local success, err

if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 or placeId == 122478697296975 then
    -- Blox Fruits loader
    success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/BloxFruits.luau"))()
    end)

elseif placeId == 10260193230 or UniverseID == 7709344486 then
    -- ServerVipFinder loader
    success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/ServerVipFinder.luau"))()
    end)

elseif placeId == 127742093697776 then
    -- Plants Vs Brainrots loader
    success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/Plants%20Vs%20Brainrots.luau"))()
    end)

else
    -- Notificação para jogos não suportados (apenas se não for Fish It)
    StarterGui:SetCore("SendNotification", {
        Title = "Sxz Hub",
        Text = "Game not supported",
        Icon = "rbxassetid://113216348436285",
        Duration = 8
    })
end

if err then
    warn("Error loading script: "..err)
end
