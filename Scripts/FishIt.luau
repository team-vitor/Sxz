local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "FishItBlocker"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,255)
bg.Parent = gui

local inner = Instance.new("Frame")
inner.Size = UDim2.new(0.6,0,0.3,0)
inner.Position = UDim2.new(0.2,0,0.35,0)
inner.BackgroundColor3 = Color3.fromRGB(0,0,0)
inner.Parent = bg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.1,0)
corner.Parent = inner

local txt = Instance.new("TextLabel")
txt.Size = UDim2.new(1,0,1,0)
txt.BackgroundTransparency = 1
txt.Text = "Fish It Script Not working\nBack Soon"
txt.TextColor3 = Color3.fromRGB(255,255,255)
txt.Font = Enum.Font.FredokaOne
txt.TextScaled = true
txt.TextWrapped = true
txt.TextYAlignment = Enum.TextYAlignment.Center
txt.Parent = inner

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.3,0,0.15,0)
button.Position = UDim2.new(0.35,0,0.75,0)
button.BackgroundColor3 = Color3.fromRGB(255,0,0)
button.TextColor3 = Color3.fromRGB(255,255,255)
button.Text = "Close"
button.Font = Enum.Font.FredokaOne
button.TextScaled = true
button.Parent = bg

button.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
