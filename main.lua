
-- UNDEFEATED | Player Selector
-- Roblox LocalScript for your own game

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UNDEFEATED"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 280, 0, 350)
Main.Position = UDim2.new(0.5, -140, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Main.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Text = "UNDEFEATED"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
Title.TextSize = 23
Title.Parent = Main

local Selected = Instance.new("TextLabel")
Selected.Size = UDim2.new(1, 0, 0, 35)
Selected.Position = UDim2.new(0, 0, 0, 45)
Selected.Text = "Selected: None"
Selected.TextColor3 = Color3.new(1, 1, 1)
Selected.BackgroundTransparency = 1
Selected.Parent = Main

local List = Instance.new("ScrollingFrame")
List.Size = UDim2.new(1, -20, 1, -130)
List.Position = UDim2.new(0, 10, 0, 85)
List.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
List.ScrollBarThickness = 5
List.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 5)
Layout.Parent = List

local function RefreshPlayers()
    for _, item in pairs(List:GetChildren()) do
        if item:IsA("TextButton") then
            item:Destroy()
        end
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, -10, 0, 40)
            Button.Text = player.Name
            Button.TextColor3 = Color3.new(1, 1, 1)
            Button.BackgroundColor3 =
                Color3.fromRGB(50, 65, 85)
            Button.Parent = List

            Button.MouseButton1Click:Connect(function()
                Selected.Text = "Selected: " .. player.Name
            end)
        end
    end

    task.wait()
    List.CanvasSize = UDim2.new(
        0, 0, 0, Layout.AbsoluteContentSize.Y + 10
    )
end

local Refresh = Instance.new("TextButton")
Refresh.Size = UDim2.new(1, -20, 0, 35)
Refresh.Position = UDim2.new(0, 10, 1, -40)
Refresh.Text = "REFRESH PLAYERS"
Refresh.TextColor3 = Color3.new(1, 1, 1)
Refresh.BackgroundColor3 = Color3.fromRGB(0, 140, 90)
Refresh.Parent = Main

Refresh.MouseButton1Click:Connect(RefreshPlayers)

Players.PlayerAdded:Connect(RefreshPlayers)
Players.PlayerRemoving:Connect(RefreshPlayers)

RefreshPlayers()
