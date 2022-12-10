local Library = {}
function zigzag(X)
	return math.acos(math.cos(X * math.pi)) / math.pi
end
counter = 0

coroutine.wrap(
	function()
		while wait() do
			counter = counter + 0.002
		end
	end
)()

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local coreGui = game:GetService("CoreGui")
local tweenService = game:GetService("TweenService");

for i,v in pairs(game.CoreGui:GetChildren()) do
 if v.Name == "KeySystem" then
  v:Destroy()
 end
end

function DragUI(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		object.Position = pos
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

function createTween(Object,setup,settings)
	local style = (settings.Style or Enum.EasingStyle.Sine);
	local direction = (settings.Direction or Enum.EasingDirection.InOut);
	local length = (settings.TIME or 1);
	local repeatcount = (settings.repeatLimit or 0);
	local reverse = (settings.IsReversed or false);
	local dt = (settings.delay or 0);
	local tween = TweenInfo.new(
		length, style, direction, repeatcount, reverse, dt
	);
	local tweenService = game:GetService("TweenService");
	local Anim = tweenService:Create(Object,tween,setup);
	Anim:Play();
	return Anim;
end;

function Library:WindowLoad(name)
        local BlueXLoader = Instance.new("ScreenGui")
        local Loader = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local Menu = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local Title = Instance.new("TextLabel")
        local LoadBar = Instance.new("Frame")
        local UICorner_3 = Instance.new("UICorner")
        local Bar = Instance.new("Frame")
        local UICorner_4 = Instance.new("UICorner")
        local Message = Instance.new("TextLabel")

        BlueXLoader.Name = "BlueXLoader"
        BlueXLoader.Parent = coreGui
        BlueXLoader.ResetOnSpawn = false

        Loader.Name = "Loader"
        Loader.Parent = BlueXLoader
        Loader.AnchorPoint = Vector2.new(0.5, 0.5)
        Loader.BackgroundColor3 = Color3.fromRGB(120, 255, 0)
        Loader.BorderColor3 = Color3.fromRGB(120, 255, 0)
        Loader.BorderSizePixel = 2
        Loader.Position = UDim2.new(0.5, 0, 0.5, 0)
        Loader.Size = UDim2.new(0, 0,  0, 0)

        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = Loader

        Menu.Name = "Menu"
        Menu.Parent = Loader
        Menu.AnchorPoint = Vector2.new(0.5, 0.5)
        Menu.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
        Menu.Position = UDim2.new(0.5, 0, 0.5, 0)
        Menu.Size = UDim2.new(1, -4, 1, -4)

        UICorner_2.CornerRadius = UDim.new(0, 6)
        UICorner_2.Parent = Menu

        Title.Name = "Title"
        Title.Parent = Menu
        Title.AnchorPoint = Vector2.new(0.5, 0)
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.BorderSizePixel = 0
        Title.Position = UDim2.new(0.5, 0, 0, 4)
        Title.Size = UDim2.new(1, -6, -0.262604743, 55)
        Title.ZIndex = 4
        Title.Font = Enum.Font.SourceSansBold
        Title.Text = name.." | Loader" or "SAZA HUB | Loader"
        Title.TextColor3 = Color3.fromRGB(197, 197, 197)
        Title.TextSize = 22.000
        Title.TextTransparency = 1

        LoadBar.Name = "LoadBar"
        LoadBar.Parent = Menu
        LoadBar.AnchorPoint = Vector2.new(0.5, 0)
        LoadBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        LoadBar.BorderSizePixel = 0
        LoadBar.Position = UDim2.new(0.5, 0, 1, -28)
        LoadBar.Size = UDim2.new(1, -28, 0, 20)
        LoadBar.BackgroundTransparency = 1

        UICorner_3.CornerRadius = UDim.new(0, 4)
        UICorner_3.Parent = LoadBar

        Bar.Name = "Bar"
        Bar.Parent = LoadBar
        Bar.BackgroundColor3 = Color3.fromRGB(120, 255, 0)
        Bar.BorderSizePixel = 0
        Bar.Size = UDim2.new(0, 0, 1, 0)
        Bar.ZIndex = 4
        Bar.BackgroundTransparency = 1

        UICorner_4.CornerRadius = UDim.new(0, 4)
        UICorner_4.Parent = Bar

        Message.Name = "Message"
        Message.Parent = Menu
        Message.AnchorPoint = Vector2.new(0.5, 0)
        Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Message.BackgroundTransparency = 1.000
        Message.BorderSizePixel = 0
        Message.Position = UDim2.new(0.5, 0, 0, 32)
        Message.Size = UDim2.new(1, -28, 0, 28)
        Message.SizeConstraint = Enum.SizeConstraint.RelativeXX
        Message.ZIndex = 4
        Message.Font = Enum.Font.SourceSansItalic
        Message.Text = "Welcome, " .. game:GetService("Players").LocalPlayer.DisplayName
        Message.TextColor3 = Color3.fromRGB(197, 197, 197)
        Message.TextSize = 22.000
        Message.TextTransparency = 1
			
		coroutine.wrap(
			function()
				while wait() do
					Loader.BackgroundColor3 = Color3.fromHSV(zigzag(counter), .8, 1)
					Loader.BorderColor3 = Color3.fromHSV(zigzag(counter), .8, 1)
					Bar.BackgroundColor3 = Color3.fromHSV(zigzag(counter), .8, 1)
				end
			end
		)()

	wait(2)

        createTween(Loader,{Size = UDim2.new(0, 280, 0, 98)}, {
            Style = Enum.EasingStyle.Linear,
            Direction = Enum.EasingDirection.In,
            TIME = .4
        })
        
        createTween(Title,{TextTransparency = 0}, {
            Style = Enum.EasingStyle.Linear,
            Direction = Enum.EasingDirection.In,
            TIME = .4
        })
    
        createTween(Message,{TextTransparency = 0}, {
            Style = Enum.EasingStyle.Linear,
            Direction = Enum.EasingDirection.In,
            TIME = .4
        }).Completed:Wait(1)
        
        createTween(LoadBar,{BackgroundTransparency = 0}, {
            Style = Enum.EasingStyle.Linear,
            Direction = Enum.EasingDirection.In,
            TIME = .4
        })
    
        createTween(Bar,{BackgroundTransparency = 0}, {
            Style = Enum.EasingStyle.Linear,
            Direction = Enum.EasingDirection.In,
            TIME = .4
        })
    
        function setSize(int)
            local number = tonumber(int)
            local percent = 1 - ((100 - int) / (100 - 0));
            
            createTween(Bar, {Size = UDim2.new(percent, 0, 1, 0)}, {
                Style = Enum.EasingStyle.Linear,
                Direction = Enum.EasingDirection.In,
                TIME = .4
            })
        end
        
        wait(1)
        setSize(20)
        
        for i = 1, 3 do 
            Message.Text = "Checking ."
            wait(.4)
            Message.Text = "Checking . ."
            wait(.4)
            Message.Text = "Checking . . ."
            wait(.4)
        end
        setSize(60)
        Message.Text = "Looking for Updates!"
        wait(3)
        setSize(80)
        Message.Text = "Latest Update!" 
        wait(.5)
        setSize(100) 
        
        createTween(Bar,{BackgroundTransparency = 1}, {
            Style = Enum.EasingStyle.Linear,
            Direction = Enum.EasingDirection.In,
            TIME = .4
        }).Completed:Wait()
    
        createTween(LoadBar,{BackgroundTransparency = 1}, {
            Style = Enum.EasingStyle.Linear,
            Direction = Enum.EasingDirection.In,
            TIME = .4
        })
    
        Message.Text = "Loaded!"
        wait(.5)
        createTween(Message,{TextTransparency = 1}, {
            Style = Enum.EasingStyle.Linear,
            Direction = Enum.EasingDirection.In,
            TIME = .4
        })
    
        createTween(Title,{TextTransparency = 1}, {
            Style = Enum.EasingStyle.Linear,
            Direction = Enum.EasingDirection.In,
            TIME = .4
        })
    
        createTween(Loader,{Size = UDim2.new(0, 0, 0, 0)}, {
            Style = Enum.EasingStyle.Linear,
            Direction = Enum.EasingDirection.In,
            TIME = .4
        }).Completed:Wait(1)
	BlueXLoader:Destroy()
end

function Library:Close()
 for i,v in pairs(game.CoreGui:GetChildren()) do
  if v.Name == "KeySystem" then
   v:Destroy()
  end
 end
end

function Library:Window(Title)
        local Loader = Library:WindowLoad(Title)
	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local Frame_2 = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local TextLabel = Instance.new("TextLabel")

	ScreenGui.Name = "KeySystem"
	ScreenGui.Parent = game.CoreGui

	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Frame.BorderColor3 = Color3.fromRGB(120,255,0)
        Frame.BorderSizePixel = 2
	Frame.Position = UDim2.new(0.5, 0, 0.8, 0)
	Frame.Size = UDim2.new(0, 0, 0, 0)
        Frame.AnchorPoint = Vector2.new(0.5, 1)
        Frame.ClipsDescendants = true

	Frame_2.Parent = Frame
	Frame_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(0.06, 0, 0.145615742, 0)
	Frame_2.Size = UDim2.new(0, 0, 0, 0)
        Frame_2.ClipsDescendants = true

	UIListLayout.Parent = Frame_2
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 10)

	TextLabel.Parent = Frame
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.LayoutOrder = 5
	TextLabel.Position = UDim2.new(0.03, 0, -0.0105405708, 0)
	TextLabel.Size = UDim2.new(0, 274, 0, 40)
	TextLabel.ZIndex = 2
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.Text = Title.." • Welcome : "..game.Players.LocalPlayer.DisplayName
	TextLabel.TextColor3 = Color3.fromRGB(232, 232, 232)
	TextLabel.TextSize = 15.000
	TextLabel.TextWrapped = false
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        DragUI(Frame, Frame)

        TweenService:Create(Frame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 397, 0, 200)}):Play()
        TweenService:Create(Frame_2, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 347, 0, 160)}):Play()

		coroutine.wrap(
			function()
				while wait() do
					Frame.BorderColor3 = Color3.fromHSV(zigzag(counter), .8, 1)
				end
			end
		)()

local Feature = {}

function Feature:Setting(value)
 if value == true then
        TweenService:Create(Frame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 0, 0, 0)}):Play()
        TweenService:Create(Frame_2, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 0, 0, 0)}):Play()
 elseif value == false then
        TweenService:Create(Frame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 397, 0, 200)}):Play()
        TweenService:Create(Frame_2, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 347, 0, 160)}):Play()
    end
end

function Feature:Button(Name,Call)
		local TextButton = Instance.new("TextButton")
		
		TextButton.Parent = Frame_2
		TextButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                TextButton.BorderColor3 = Color3.fromRGB(120,255,0)
		TextButton.BorderSizePixel = 2
		TextButton.Size = UDim2.new(0, 200, 0, 50)
		TextButton.Font = Enum.Font.SourceSansBold
		TextButton.Text = Name
		TextButton.TextColor3 = Color3.fromRGB(235, 235, 235)
		TextButton.TextScaled = false
		TextButton.TextSize = 17.000
		TextButton.TextWrapped = true
                TextButton.AutoButtonColor = true 
                TextButton.MouseButton1Click:Connect(function()
                  pcall(Call)
   end)
		coroutine.wrap(
			function()
				while wait() do
					TextButton.BorderColor3 = Color3.fromHSV(zigzag(counter), .8, 1)
				end
			end
		)()
end

function Feature:Box(Name,Call)
		local TextButton2 = Instance.new("TextBox")
		
		TextButton2.Parent = Frame_2
		TextButton2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                TextButton2.BorderColor3 = Color3.fromRGB(120,255,0)
		TextButton2.BorderSizePixel = 2
		TextButton2.Size = UDim2.new(0, 200, 0, 50)
		TextButton2.Font = Enum.Font.SourceSansBold
		TextButton2.Text = Name
		TextButton2.TextColor3 = Color3.fromRGB(235, 235, 235)
		TextButton2.TextScaled = false
		TextButton2.TextSize = 17.000
		TextButton2.TextWrapped = true
  
TextButton2.Focused:Connect(function()
 TweenService:Create(TextButton2, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = Color3.fromRGB(255,255,255)}):Play()
end)

TextButton2.FocusLost:Connect(function()
 pcall(Call, TextButton2.Text)
 end)
		coroutine.wrap(
			function()
				while wait() do
					TextButton2.BorderColor3 = Color3.fromHSV(zigzag(counter), .8, 1)
				end
			end
		)()
end

	function Feature:Label(Name)
		local TextLabel = Instance.new("TextLabel")
		
		TextLabel.Parent = Frame_2
		TextLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		TextLabel.BorderSizePixel = 0
		TextLabel.Size = UDim2.new(0, 200, 0, 30)
		TextLabel.Font = Enum.Font.SourceSansBold
		TextLabel.Text = Name
		TextLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
  end
	return Feature
end
return Library
