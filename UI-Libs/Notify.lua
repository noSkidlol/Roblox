--[[
  // Made by SupLua#0945
]]

local LibNotify = {}

local TweenService = game:GetService("TweenService")

function LibNotify:Notify(Name, Desc, t) -- might bug
for _,w in pairs(game.CoreGui:GetChildren()) do
    if w.Name == "Notification" then
        w:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton1 = Instance.new("TextLabel")
local TextButton12 = Instance.new("TextLabel") 

ScreenGui.Name = "Notification" 
ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0,0,0)
Frame.BackgroundTransparency = 1
Frame.BorderColor3 = Color3.fromRGB(0,255,255)
Frame.Position = UDim2.new(1, -25, 1, -25)
Frame.AnchorPoint = Vector2.new(1, 1)
Frame.Size = UDim2.new(0,280,0,100)
Frame.AutomaticSize = Enum.AutomaticSize.Y
Frame.Active = true

TextButton1.Parent = Frame
TextButton1.BackgroundColor3 = Color3.fromRGB(0,0,0)
TextButton1.BorderSizePixel = 0
TextButton1.BackgroundTransparency = 1
TextButton1.TextTransparency = 1
TextButton1.Position = UDim2.new(0,10.0,0,0)
TextButton1.Size = UDim2.new(0.5,0,0.2)
TextButton1.Font = Enum.Font.Gotham
TextButton1.Text = "- "..Name
TextButton1.TextColor3 = Color3.fromRGB(0,255,255)
TextButton1.TextScaled = true
TextButton1.TextSize = 8
TextButton1.TextWrapped = true
TextButton1.TextXAlignment = Enum.TextXAlignment.Left

TextButton12.Parent = Frame
TextButton12.BackgroundColor3 = Color3.fromRGB(0,0,0)
TextButton12.BorderSizePixel = 0
TextButton12.BackgroundTransparency = 1
TextButton12.TextTransparency = 1
TextButton12.Position = UDim2.new(0,0,0.2,0)
TextButton12.Size = UDim2.new(0,260,0,50)
TextButton12.Font = Enum.Font.Code
TextButton12.Text = Desc
TextButton12.TextColor3 = Color3.fromRGB(0,255,255)
TextButton12.TextSize = 14
TextButton12.TextWrapped = true
TextButton12.TextXAlignment = Enum.TextXAlignment.Right

TweenService:Create(Frame, TweenInfo.new(.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play() 
TweenService:Create(TextButton1, TweenInfo.new(.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play() 
TweenService:Create(TextButton12, TweenInfo.new(.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play() 
wait(t)
TweenService:Create(Frame, TweenInfo.new(.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play() 
TweenService:Create(TextButton1, TweenInfo.new(.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play() 
TweenService:Create(TextButton12, TweenInfo.new(.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play() 
wait(.7)
ScreenGui:Destroy() 
end
return LibNotify
