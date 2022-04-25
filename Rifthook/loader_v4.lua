--[[
    Copyright (C) 2020-2022 Rifthook Development Team
    Rifthook Loader (Pre-load enviorment/script)
]]

repeat wait() until game:IsLoaded() -- wait for game load
loadstring(game:HttpGet("https://raw.githubusercontent.com/basedproperty/Rifthook/main/Rifthook/init.lua"))() -- init script
local ProductInfo = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId) -- game info 

-- ui setup

local Rifthook_RLoad = Instance.new("ScreenGui")
local BackFrame = Instance.new("Frame")
local HL = Instance.new("Frame")
local Bar_2 = Instance.new("Frame")
local InnerFrame = Instance.new("Frame")
local GameIcon = Instance.new("ImageLabel")
local GameLabel = Instance.new("TextLabel")
local LastUpdated = Instance.new("TextLabel")
local Script = Instance.new("TextLabel")
local VersionLabel = Instance.new("TextLabel")
local Load = Instance.new("TextButton")
local LoadBeta = Instance.new("TextButton")
local Build = Instance.new("TextLabel")
local Bar_1 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")

Rifthook_RLoad.Name = "Rifthook_RLoad"
Rifthook_RLoad.Parent = game.CoreGui
Rifthook_RLoad.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

BackFrame.Name = "BackFrame"
BackFrame.Parent = Rifthook_RLoad
BackFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
BackFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
BackFrame.Size = UDim2.new(0, 300, 0, 200)

HL.Name = "HL"
HL.Parent = BackFrame
HL.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
HL.BorderSizePixel = 0
HL.Position = UDim2.new(0, 1, 0, 1)
HL.Size = UDim2.new(1, -2, 1, -2)

Bar_2.Name = "Bar_2"
Bar_2.Parent = HL
Bar_2.BackgroundColor3 = Color3.fromRGB(74, 255, 24)
Bar_2.BorderSizePixel = 0
Bar_2.Position = UDim2.new(0, 3, 0, 24)
Bar_2.Size = UDim2.new(1, -6, 0, 2)
Bar_2.ZIndex = 4

InnerFrame.Name = "InnerFrame"
InnerFrame.Parent = HL
InnerFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
InnerFrame.BorderSizePixel = 0
InnerFrame.Position = UDim2.new(0, 3, 0, 24)
InnerFrame.Size = UDim2.new(1, -6, 1, -27)

GameIcon.Name = "GameIcon"
GameIcon.Parent = InnerFrame
GameIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GameIcon.Position = UDim2.new(0, 10, 0, 10)
GameIcon.Size = UDim2.new(0, 100, 0, 100)
GameIcon.Image = "rbxassetid://"..ProductInfo.IconImageAssetId

GameLabel.Name = "GameLabel"
GameLabel.Parent = InnerFrame
GameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GameLabel.BackgroundTransparency = 1.000
GameLabel.BorderSizePixel = 0
GameLabel.Position = UDim2.new(0.415342569, 0, 0.0584795326, 0)
GameLabel.Size = UDim2.new(0, 163, 0, 14)
GameLabel.Font = Enum.Font.Code

local Name = ProductInfo.Name
if string.len(Name) > 15 then
	GameLabel.Text = "Game: "..string.sub(Name,1,15).."..."
else
	GameLabel.Text = "Game: "..ProductInfo.Name
end


GameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
GameLabel.TextScaled = true
GameLabel.TextSize = 14.000
GameLabel.TextStrokeTransparency = 0.000
GameLabel.TextWrapped = true
GameLabel.TextXAlignment = Enum.TextXAlignment.Left

LastUpdated.Name = "LastUpdated"
LastUpdated.Parent = InnerFrame
LastUpdated.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LastUpdated.BackgroundTransparency = 1.000
LastUpdated.BorderSizePixel = 0
LastUpdated.Position = UDim2.new(0.415342569, 0, 0.140350878, 0)
LastUpdated.Size = UDim2.new(0, 163, 0, 14)
LastUpdated.Font = Enum.Font.Code
LastUpdated.Text = "Last Updated: "..getgenv().GenData.LastUpdated
LastUpdated.TextColor3 = Color3.fromRGB(255, 255, 255)
LastUpdated.TextScaled = true
LastUpdated.TextSize = 14.000
LastUpdated.TextStrokeTransparency = 0.000
LastUpdated.TextWrapped = true
LastUpdated.TextXAlignment = Enum.TextXAlignment.Left

Script.Name = "Script"
Script.Parent = InnerFrame
Script.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Script.BackgroundTransparency = 1.000
Script.BorderSizePixel = 0
Script.Position = UDim2.new(0.415342569, 0, 0.222222224, 0)
Script.Size = UDim2.new(0, 163, 0, 14)
Script.Font = Enum.Font.Code
Script.Text = "Script: "..getgenv().GetCurrentGame()
Script.TextColor3 = Color3.fromRGB(255, 255, 255)
Script.TextScaled = true
Script.TextSize = 14.000
Script.TextStrokeTransparency = 0.000
Script.TextWrapped = true
Script.TextXAlignment = Enum.TextXAlignment.Left

VersionLabel.Name = "VersionLabel"
VersionLabel.Parent = InnerFrame
VersionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VersionLabel.BackgroundTransparency = 1.000
VersionLabel.BorderSizePixel = 0
VersionLabel.Position = UDim2.new(0.415342569, 0, 0.30994153, 0)
VersionLabel.Size = UDim2.new(0, 163, 0, 14)
VersionLabel.Font = Enum.Font.Code
VersionLabel.Text = "Version: "..getgenv().GenData.Version
VersionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
VersionLabel.TextScaled = true
VersionLabel.TextSize = 14.000
VersionLabel.TextStrokeTransparency = 0.000
VersionLabel.TextWrapped = true
VersionLabel.TextXAlignment = Enum.TextXAlignment.Left

Load.Name = "Load"
Load.Parent = InnerFrame
Load.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
Load.BorderColor3 = Color3.fromRGB(0, 0, 0)
Load.Position = UDim2.new(0, 7, 1, -50)
Load.Size = UDim2.new(0.5, -15, 0, 40)
Load.Font = Enum.Font.Code
Load.Text = "Load"
Load.TextColor3 = Color3.fromRGB(255, 255, 255)
Load.TextSize = 16.000
Load.TextStrokeTransparency = 0.000

LoadBeta.Name = "LoadBeta"
LoadBeta.Parent = InnerFrame
LoadBeta.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
LoadBeta.BorderColor3 = Color3.fromRGB(0, 0, 0)
LoadBeta.Position = UDim2.new(0.5, 7, 1, -50)
LoadBeta.Size = UDim2.new(0.5, -15, 0, 40)
LoadBeta.Font = Enum.Font.Code
LoadBeta.Text = "Exit"
LoadBeta.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadBeta.TextSize = 16.000
LoadBeta.TextStrokeTransparency = 0.000

Build.Name = "Build"
Build.Parent = InnerFrame
Build.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Build.BackgroundTransparency = 1.000
Build.BorderSizePixel = 0
Build.Position = UDim2.new(0.415342569, 0, 0.397660822, 0)
Build.Size = UDim2.new(0, 163, 0, 14)
Build.Font = Enum.Font.Code
Build.Text = "Build: "..Release
Build.TextColor3 = Color3.fromRGB(255, 255, 255)
Build.TextScaled = true
Build.TextSize = 14.000
Build.TextStrokeTransparency = 0.000
Build.TextWrapped = true
Build.TextXAlignment = Enum.TextXAlignment.Left

Bar_1.Name = "Bar_1"
Bar_1.Parent = HL
Bar_1.BackgroundColor3 = Color3.fromRGB(74, 255, 24)
Bar_1.BorderSizePixel = 0
Bar_1.Size = UDim2.new(1, 0, 0, 2)
Bar_1.ZIndex = 2

TextLabel.Parent = HL
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 5, 0, 6)
TextLabel.Size = UDim2.new(0, 200, 0, 15)
TextLabel.Font = Enum.Font.Code
TextLabel.Text = "Rifthook Loader"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

-- shit

Load.MouseButton1Click:connect(function()
	if Release == "Beta" then
		Rifthook_RLoad:Destroy()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/basedproperty/Rifthook/main/Rifthook/loader_beta.lua"))()
	else
		Rifthook_RLoad:Destroy()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/basedproperty/Rifthook/main/Rifthook/loader_release.lua"))()
	end
end)

LoadBeta.MouseButton1Click:connect(function()
	Rifthook_RLoad:Destroy()
end)

