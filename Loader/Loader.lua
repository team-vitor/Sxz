local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

Players.LocalPlayer.Idled:Connect(function()
    local VirtualUser = game:GetService("VirtualUser")
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

local placeId = game.PlaceId
local UniverseID = HttpService:JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/"..placeId.."/universe")).universeId

local scripts = {
    [2753915549] = "https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/BloxFruit.luau",
    [4442272183] = "https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/BloxFruit.luau",
    [7449423635] = "https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/BloxFruit.luau",
    [122478697296975] = "https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/bloxfruit.luau",
    [10260193230] = "https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/ServerVipFinder.luau",
    [126509999114328] = "https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/99nights.luau",
    [79546208627805]  = "https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/99nights.luau",
    [127742093697776] = "https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/pvsb.luau",
    [121864768012064] = "https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/fishit.luau"
}

local function loadScript(url)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
    if not success then
        warn("Failed to load script: "..err)
    end
end

if scripts[placeId] then
    getgenv().ModeKaitun = "Fruit Farm"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Loader/Loader.lua"))()
    loadScript(scripts[placeId])
elseif UniverseID == 7709344486 then
    loadScript("https://raw.githubusercontent.com/team-vitor/Sxz/refs/heads/main/Scripts/ServerVipFinder.luau")
else
    StarterGui:SetCore("SendNotification", {
        Title = "Sxz Hub Loader",
        Text = "Game not supported",
        Icon = "rbxassetid://113216348436285",
        Duration = 8
    })
end
