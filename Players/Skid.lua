-- Important Variables
local Players            =  game:GetService('Players')
local LocalPlayer        =  Players.LocalPlayer
local Backpack           =  LocalPlayer.Backpack
local PlayerGui          =  LocalPlayer.PlayerGui
local ReplicatedStorage  =  game:GetService("ReplicatedStorage")
-- Variables
local VirtualInputManager  =  game:GetService('VirtualInputManager')
local Data                 =  LocalPlayer['MAIN_DATA']
local UI                   =  PlayerGui.UI
-- GetFruit
local function GetFruit()
    return tostring(tostring(Data.Slots[tostring(Data.Slot.Value)].Value))
end
-- GetLevel
local function GetLevel()
    return tostring(Data.Fruits[GetFruit()].Level.Value)
end
-- GetStamina
local function GetStamina()
    return (tonumber(GetLevel()) * 4) + 200
end
-- Percent
local function Percent(Part, Whole)
    return (Part / Whole) * 100
end
-- Respawn
local function Respawn()
    require(ReplicatedStorage.Loader).ServerEvent('Core', 'LoadCharacter', {})
    require(ReplicatedStorage.Loader).ServerEvent('Main', 'LoadCharacter')
    if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) and LocalPlayer.Character:WaitForChild('Humanoid',2) then
        Workspace.CurrentCamera.CameraSubject =  LocalPlayer.Character.Humanoid
        game:GetService('StarterGui'):SetCoreGuiEnabled('Backpack',false)
        game:GetService('StarterGui'):SetCoreGuiEnabled('PlayerList',true)
        game:GetService('StarterGui'):SetCoreGuiEnabled('Chat',true)
        UI.MainMenu.Visible  =  false
        UI.HUD.Visible       =  true
    end
end
-- AutoFarm : Attack
task.spawn(function()
    while AutoFarm do task.wait()
        if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) and LocalPlayer.Character:WaitForChild('HumanoidRootPart',2) then
            for i,v in pairs(LocalPlayer:GetDescendants()) do
                if v.ClassName == 'Tool' then
                    if v:GetAttribute('Name') then 
                        local Attack = v:GetAttribute('Name')
                        ReplicatedStorage.Replicator:InvokeServer(GetFruit(),Attack)
                    else
                        local Attack = v.Name:gsub(" ","")
                        ReplicatedStorage.Replicator:InvokeServer(GetFruit(),Attack)
                    end
                end
            end
        end
    end
end)
-- AutoFarm : Position
task.spawn(function()
    while AutoFarm do task.wait()
        if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) and LocalPlayer.Character:WaitForChild('HumanoidRootPart',2) then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-304, 697, -1241)
        end
    end
end)
-- AutoFarm : Respawn : 1/3
task.spawn(function()
    while AutoFarm do task.wait()
        -- Hide Gui On Death
        if PlayerGui:FindFirstChild('DeathScreen') then
            UI.HUD.Visible       =  false
            UI.Safezone.Visible  =  false
        end
        -- Hide Gui On Spawn
        if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) and LocalPlayer.Character:WaitForChild('Humanoid',2) then
            game:GetService('StarterGui'):SetCoreGuiEnabled('Backpack',false)
            game:GetService('StarterGui'):SetCoreGuiEnabled('PlayerList',true)
            game:GetService('StarterGui'):SetCoreGuiEnabled('Chat',true)
            UI.MainMenu.Visible  =  false
            UI.HUD.Visible       =  true
        end
        -- Fix Camera On Spawn
        if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) and LocalPlayer.Character:WaitForChild('Humanoid',2) then
            Workspace.CurrentCamera.CameraSubject =  LocalPlayer.Character.Humanoid
            Workspace.CurrentCamera.CameraType    =  Enum.CameraType.Custom
        end
    end
end)
-- AutoFarm : Respawn : 2/3
task.spawn(function()
    while AutoFarm do task.wait()
        if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) then
            if Percent(LocalPlayer.Character:WaitForChild('Stats',2):GetAttribute("Stamina"),GetStamina()) <= getgenv().Stamina then
                LocalPlayer.Character:BreakJoints()
            end
        end
    end
end)
-- AutoFarm : Respawn : 3/3
task.spawn(function()
    while AutoFarm do task.wait()
        if LocalPlayer.Character == nil and UI.HUD.Visible == false then
            Respawn()
        end
    end
end)
