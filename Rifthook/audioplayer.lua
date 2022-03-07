-- Gui to Lua
-- Version: 3.2

-- Instances:

local RifthookPlayer = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local TextLabel_2 = Instance.new("TextLabel")
local Items = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Sample = Instance.new("TextButton")

--Properties:

RifthookPlayer.Name = "RifthookPlayer"
RifthookPlayer.Parent = game.CoreGui
RifthookPlayer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = RifthookPlayer
Frame.Active = true
Frame.Draggable = true
Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0462677367, 0, 0.0736196339, 0)
Frame.Size = UDim2.new(0, 330, 0, 301)

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(0, 330, 0, 20)

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0181818176, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 324, 0, 20)
TextLabel.Font = Enum.Font.GothamBlack
TextLabel.Text = "Rifthook Audio Player"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(75, 0, 187)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(106, 0, 255))}
UIGradient.Parent = TextLabel

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.0181818176, 0, 0.0930232555, 0)
TextLabel_2.Size = UDim2.new(0, 260, 0, 11)
TextLabel_2.Font = Enum.Font.GothamSemibold
TextLabel_2.Text = "Put MP3 files in Rifthook/AudioPlayer"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

Items.Name = "Items"
Items.Parent = Frame
Items.Active = true
Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Items.BackgroundTransparency = 1.000
Items.BorderSizePixel = 0
Items.Position = UDim2.new(0, 0, 0.149501666, 0)
Items.Size = UDim2.new(0, 330, 0, 256)
Items.CanvasSize = UDim2.new(0, 0, 4, 0)
Items.ScrollBarThickness = 6

UIListLayout.Parent = Items
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)

Sample.Name = "Sample"
Sample.Parent = Frame
Sample.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Sample.BackgroundTransparency = 0
Sample.BorderSizePixel = 0
Sample.Size = UDim2.new(0, 320, 0, 17)
Sample.Visible = false
Sample.Font = Enum.Font.Gotham
Sample.TextColor3 = Color3.fromRGB(255, 255, 255)
Sample.TextSize = 14.000
Sample.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

if isfolder("Rifthook") == false or isfolder("Rifthook/AudioPlayer") == false then
    makefolder("Rifthook")
    makefolder("Rifthook/AudioPlayer")
end
local SoundItem = Instance.new("Sound",workspace)

while wait(.5) do
    local files = listfiles("Rifthook/AudioPlayer\\")
    for i,v in pairs(files) do
        files[i] = string.gsub(v,"Rifthook/AudioPlayer\\","")
    end
    for i,v in pairs(files) do
        if Items:FindFirstChild(v) == nil then
            local sound = Sample:clone()
            sound.Parent = Items
            sound.Name = v
            sound.Visible = true
            sound.Text = v
            sound.MouseButton1Click:connect(function()
                local asset = getsynasset("Rifthook/AudioPlayer\\"..v)
                SoundItem.SoundId = asset
                SoundItem:Play()
            end)
        end
    end
end
