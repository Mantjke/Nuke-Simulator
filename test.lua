if game.PlaceId == 11599913094 then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Nuke Simulator GUI", HidePremium = false, IntroText = "Made by Mantje", IntroEnabled = true, SaveConfig = true, ConfigFolder = "Nuke Simulator GUI"})

--Always crit

local Knit = require(game:GetService("ReplicatedStorage").Packages.knit) -- // get the knit module
local Nuke = Knit.GetController("NukeController") -- // get the nuke controller

local AttackHook do -- // initialize the hook variable so we can return it later in the script
   AttackHook = hookfunction(Nuke.Attack, function(Self, Target, ...) -- // hook the attack function
       -- // the "Target" is just a bunch of info on the current target as a table
       rawset(Target, "nextAttackCritical", true) -- // make "nextAttackCritical" true, and bypass the __newindex metamethod using rawset just in case they decide to make the "Target" readonly
       
       return AttackHook(Self, Target, ...) -- // return & call the function with the newly edited nextAttackCritical value
   end)
end


--Values
_G.AutoOpen = true
_G.AutoHatch = true
_G.SelectEgg = "None"
_G.AutoCollect = true
_G.EquipBest = true
_G.AutoClaim = true
_G.AntiAFk = true


--Functions
function AutoHatch()
    while _G.AutoHatch == true do
        game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.Buy:InvokeServer(_G.SelectEgg)
        wait(.1)
     end   
end

function AutoCollect()
    if _G.AutoCollect == true then
        game:GetService("RunService").Stepped:Connect(function()
            for _, drop in pairs(game:GetService("Workspace").CurrencyDrops:GetChildren()) do
              drop.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
              drop:Destroy()
            end
        end)
    end
end

function EquipBest()
    while _G.EquipBest == true do
		game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.NukeService.RE.EquipBest:FireServer()
		wait(1)
     end   
end

function AutoClaim()
    while _G.AutoClaim == true do
		game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ChestService.RE.Claim:FireServer("NormalChest")
		wait(5)
     end   
end

function AntiAFK()
	if _G.AntiAFk == true then
		local lastInput = tick()
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			if tick() - lastInput > 300 then -- 5 minutes
				game:GetService("VirtualUser"):ClickButton2(Vector2.new())
			end
		end)
		game:GetService("UserInputService").InputBegan:Connect(function()
			lastInput = tick()
		end)
		game:GetService("UserInputService").InputEnded:Connect(function()
			lastInput = tick()
		end)
	end
end

-- Tabs
local EggsTab = Window:MakeTab({
	Name = "Silo Opener",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local AutoFarmTab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


-- Toggles
EggsTab:AddToggle({
	Name = "Auto open",
	Default = false,
	Callback = function(Value)
		_G.AutoHatch = Value
        AutoHatch()
	end    
})

AutoFarmTab:AddButton({
	Name = "Auto Collect (Once enabled no going back)",
	Callback = function(Value)
		_G.AutoCollect = true
        AutoCollect()
	end    
})

AutoFarmTab:AddToggle({
	Name = "Auto Equip Best",
	Default = false,
	Callback = function(Value)
		_G.EquipBest = Value
        EquipBest()
	end    
})

AutoFarmTab:AddToggle({
	Name = "Auto Claim Chest",
	Default = false,
	Callback = function(Value)
		_G.AutoClaim = Value
        AutoClaim()
	end    
})

MiscTab:AddToggle({
	Name = "AntiAFK",
	Default = false,
	Callback = function(Value)
		_G.AntiAFK = true
        AntiAFK()
	end    
})


-- Dropdowns

EggsTab:AddDropdown({
	Name = "Select Silo",
	Default = "Select",
	Options = {"Moon Explorer Fragmented Silo", "G Silo 12", "MegaSilo"},
	Callback = function(Value)
        _G.SelectEgg = Value
        print(_G.SelectEgg)
	end    
})

--Sliders

MiscTab:AddSlider({
	Name = "Movement Speed",
	Min = 10,
	Max = 420,
	Default = 25,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
        _G.Movementspeed = Value
		print(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})



end
OrionLib:Init()