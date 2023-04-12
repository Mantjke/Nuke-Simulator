if game.PlaceId == 11599913094 then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Nuke Simulator GUI", HidePremium = false, IntroText = "Made by Mantje#9988", IntroEnabled = true, SaveConfig = true, ConfigFolder = "Nuke Simulator GUI"})

-- Join my discord because I don't add people : https://discord.gg/NgNFjBGHbt	
	
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

-- Silo Names

local siloNames = {
	["Starter 1k"] = "Silo 1",
	["Starter 4k"] = "Silo 2",
	["Starter 9k"] = "G Silo 3",
	["Starter 15k"] = "G Silo 4",
	["City 15k"] = "Silo 5",
	["City 26,5k"] = "Silo 6",
	["City 75k"] = "G Silo 7",
	["City 150k"] = "G Silo 8",
	["Jungle 32,5k"] = "Silo 9",
	["Jungle 50k"] = "Silo 10",
	["Jungle 350k"] = "G Silo 11",
	["Jungle 600k"] = "G Silo 12",
	["Desert 275k"] = "Silo 13",
	["Desert 300k"] = "Silo 14",
	["Desert 2.9M"] = "G Silo 15",
	["Desert 3.3M"] = "G Silo 16",
	["Beach 900k"] = "Silo 17",
	["Beach 1.2M"] = "Silo 18",
	["Beach 8.5M"] = "G Silo 19",
	["Beach 10M"] = "G Silo 20",
	["Deep Blue 2M"] = "Silo 21",
	["Deep Blue 3M"] = "Silo 22",
	["Deep Blue 19.2M"] = "G Silo 23",
	["Deep Blue 28.5M"] = "G Silo 24",
	["Test Lab 7.5M"] = "Silo 25",
	["Test Lab 13.5M"] = "Silo 26",
	["Test Lab 65M"] = "G Silo 27",
	["Test Lab 89.5M"] = "G Silo 28",
	["Volcano 20M"] = "Silo 29",
	["Volcano 35M"] = "Silo 30",
	["Volcano 210M"] = "G Silo 31",
	["Volcano 400M"] = "G Silo 32",
	["Starter Quest Silo"] = "Starter Explorer Fragmented Silo",
	["Volcano Quest Silo"] = "Volcano Explorer Fragmented Silo",
	["Moon Base 10K"] = "Lunar 1",
	["Moon Base 100K"] = "G Lunar 2",
	["Excavation Site 58K"] = "Lunar 3",
	["Excavation Site 464K"] = "G Lunar 4",
	["Dark Side 485K"] = "Lunar 5",
	["Dark Side 4M"] = "G Lunar 6",
	["Dark Lab 727K"] = "Lunar 7",
	["Dark Lab 6M"] = "G Lunar 8",
	["Moon Quest Silo"] = "Moon Explorer Fragmented Silo",
	["CyberTopia 225K"] = "cyber 1",
	["CyberTopia 2.5M"] = "cyber 2",
	["Vapor Valley 1.1M"] = "cyber 3",
	["Vapor Valley 12.6M"] = "cyber 4",
	["Cyber Bridge 2.8M"] = "cyber 5",
	["Cyber Bridge 31.5M"] = "cyber 6",
	["Nuclear Lab 8.4M"] = "cyber 7",
	["Nuclear Lab 94.5M"] = "cyber 8",
	["Arcade 25.3M"] = "cyber 9",
	["Arcade 283M"] = "cyber 10",
	["Planet Ramek 50K"] = "anime 1",
	["Planet Ramek 350K"] = "anime 2",
	["Dragon City 105K"] = "anime 3",
	["Dragon City 735K"] = "anime 4",
	["Naru Valley 225K"] = "anime 5",
	["Naru Valley 1.6M"] = "anime 6",
	["Titan Cave 450K"] = "anime 7",
	["Titan Cave 3.1M"] = "anime 8",
	["Anime Quest 321.3K"] = "Anime Explorer Fragmented Silo",
}


--Values
_G.AutoOpen = true
_G.AutoHatch = true
_G.SelectEgg = "None"
_G.AutoCollect = false
_G.EquipBest = true
_G.AutoClaim = true
_G.AntiAFk = true
_G.AverageCalculation = false
_G.TableThing = {}
_G.rconsole = false
local startval = 60

if _G.rconsole then
    print("rconsole is enabled")
else
    print("rconsole is disabled")
end



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

function AverageCalculation()
	while _G.AverageCalculation do
		local startval = string.gsub(game.Players.LocalPlayer.PlayerGui.HUD.TopRight[_G.Tracking].Holder.Amount.Text, ",", "")
		if _G.rconsole then
			rconsoleprint('@@LIGHT_MAGENTA@@')
			rconsoleprint("Starting with: " .. startval .. " " .. _G.Tracking .. " Wait 60 Seconds" .. "\n")
		else
			print("Starting with: " .. startval .." " .. _G.Tracking .. " Wait 60 Seconds")
		end
	
		wait(60)

		local endval = string.gsub(game.Players.LocalPlayer.PlayerGui.HUD.TopRight[_G.Tracking].Holder.Amount.Text, ",", "")
		local diffy = tonumber(endval) - tonumber(startval)
		if _G.rconsole then
			rconsoleprint('@@LIGHT_CYAN@@')
			rconsoleprint("Ended with: " .. endval .. " " .. _G.Tracking .. " || Gained: " .. diffy .. " " .. _G.Tracking .. " in 60 seconds \n")
		else
			print("Ended with: " .. endval .. " " .. _G.Tracking .. " || Gained: " .. diffy .. " " .. _G.Tracking .. " in 60 seconds")
		end
		table.insert(_G.TableThing, diffy)
		
		local b = 0
		for i,v in pairs(_G.TableThing) do
			b = b + v
		end

		if _G.rconsole then
			rconsoleprint('@@GREEN@@')
			rconsoleprint("Total: " .. b .. " " .. _G.Tracking .. " in " ..  #_G.TableThing .. " mins || Average Per Min: " .. b/#_G.TableThing .. " " .. _G.Tracking .. "\n \n")
		else
			print("Total: " .. b .. " " .. _G.Tracking .. " in " .. #_G.TableThing .. " mins || Average Per Min: " .. b/#_G.TableThing .. " " .. _G.Tracking)
			CoolLabel:Set("Total: " .. b .. " " .. _G.Tracking .. " in " .. #_G.TableThing .. " mins || Average Per Min: " .. b/#_G.TableThing .. " " .. _G.Tracking)
		end

		if not _G.AverageCalculation then
			print("Stopping the calculation for an average")
			CoolLabel:Set("You can now start a new calculation")
			_G.TableThing = {}
			break
		end
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

local StatTab = Window:MakeTab({
	Name = "Stats",
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
		_G.AntiAFK = Value
        AntiAFK()
	end    
})

StatTab:AddToggle({
	Name = "Using Synapse X? External Console",
	Default = false,
	Callback = function(Value)
		_G.rconsole = Value
		if _G.rconsole then
			print("rconsole is enabled")
		end	
	end    
})

StatTab:AddButton({
	Name = "Start Calculating The Average",
	Callback = function(Value)
		print("Calculating The Average for " .. _G.Tracking)
		CoolLabel:Set("Calculating the Average For " .. _G.Tracking .. ". Wait 60 Seconds")
		_G.AverageCalculation = true
		AverageCalculation()
	end    
})

StatTab:AddButton({
	Name = "Stop Calculating The Average",
	Callback = function(Value)
		_G.AverageCalculation = false
		print("Stopped Calculating the Average for " .. _G.Tracking)
		CoolLabel:Set("Stopped Calculating the Average for " .. _G.Tracking)
		wait(2)
		CoolLabel:Set("Wait before starting a new calculation")
		if _G.rconsole then
			rconsoleclear()
		end
		wait(10)
		AverageCalculation()
	end    
})

-- Dropdowns

EggsTab:AddDropdown({
	Name = "Select Silo, Earth",
	Default = "Select",
	Options = {"None", "Starter 1k", "Starter 4k", "Starter 9k", "Starter 15k", "City 15k", "City 26,5k", "City 75k", "City 150k", "Jungle 32,5k", "Jungle 50k", "Jungle 350k", "Jungle 600k", "Desert 275k", "Desert 300k", "Desert 2.9M", "Desert 3.3M", "Beach 900k", "Beach 1.2M", "Beach 8.5M", "Beach 10M", "Deep Blue 2M", "Deep Blue 3M", "Deep Blue 19.2M", "Deep Blue 28.5M", "Test Lab 7.5M", "Test Lab 13.5M", "Test Lab 65M", "Test Lab 89.5M", "Volcano 20M", "Volcano 35M", "Volcano 210M", "Volcano 400M", "Starter Quest Silo", "Volcano Quest Silo"},
	Callback = function(Value)
		local selectedSilo = siloNames[Value]
		_G.SelectEgg = selectedSilo
		print(_G.SelectEgg)
	end    
})

EggsTab:AddDropdown({
	Name = "Select Silo, Moon",
	Default = "Select",
	Options = {"None", "Moon Base 10K", "Moon Base 100K", "Excavation Site 58K", "Excavation Site 464K", "Dark Side 485K", "Dark Side 4M", "Dark Lab 727K", "Dark Lab 6M", "Moon Quest Silo"},
	Callback = function(Value)
		local selectedSilo = siloNames[Value]
		_G.SelectEgg = selectedSilo
		print(_G.SelectEgg)
	end    
})

EggsTab:AddDropdown({
	Name = "Select Silo, The Future",
	Default = "Select",
	Options = {"None", "CyberTopia 225K", "CyberTopia 2.5M", "Vapor Valley 1.1M", "Vapor Valley 12.6M", "Cyber Bridge 2.8M", "Cyber Bridge 31.5M", "Nuclear Lab 8.4M", "Nuclear Lab 94.5M", "Arcade 25.3M", "Arcade 283M"},
	Callback = function(Value)
		local selectedSilo = siloNames[Value]
		_G.SelectEgg = selectedSilo
		print(_G.SelectEgg)
	end    
})

EggsTab:AddDropdown({
	Name = "Select Silo, Anime",
	Default = "Select",
	Options = {"None", "Planet Ramek 50K", "Planet Ramek 350K", "Dragon City 105K", "Dragon City 735K", "Naru Valley 225K", "Naru Valley 1.6M", "Titan Cave 450K", "Titan Cave 3.1M", "Anime Quest 321.3K"},
	Callback = function(Value)
		local selectedSilo = siloNames[Value]
		_G.SelectEgg = selectedSilo
		print(_G.SelectEgg)
	end    
})

StatTab:AddDropdown({
	Name = "Select Currency",
	Options = {"Gems", "Coins", "Otaku Coins", "Moon Coins", "Anime Coins", "Cyber Coins"},
	Callback = function(Value)
        _G.Tracking = Value
        print(_G.Tracking)
	end    
})

--Sliders

MiscTab:AddSlider({
	Name = "Movement Speed",
	Min = 10,
	Max = 420,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
        _G.Movementspeed = Value
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

-- Labels

CoolLabel = StatTab:AddLabel("Start A New Calculation")


end
OrionLib:Init()
