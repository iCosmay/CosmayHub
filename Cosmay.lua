local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "CosmayHub", HidePremium = false, IntroText = "CosmayHub",Intro = false,SaveConfig = true, ConfigFolder = "CosmayHub"})


local GunTab = Window:MakeTab({
	Name = "Gun",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

GunTab:AddButton({
	Name = "Aimbot",
	Callback = function()
		local Camera = workspace.CurrentCamera
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local UserInputService = game:GetService("UserInputService")
		local TweenService = game:GetService("TweenService")
		local LocalPlayer = Players.LocalPlayer
		local Holding = false
		
		_G.AimbotEnabled = true
		_G.TeamCheck = true -- If set to true then the script would only lock your aim at enemy team members.
		_G.AimPart = "Head" -- Where the aimbot script would lock at.
		_G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
		
		local function GetClosestPlayer()
			local MaximumDistance = math.huge
			local Target = nil
		  
			  coroutine.wrap(function()
					wait(20); MaximumDistance = math.huge -- Reset the MaximumDistance so that the Aimbot doesn't remember it as a very small variable and stop capturing players...
			  end)()
		
			for _, v in next, Players:GetPlayers() do
				if v.Name ~= LocalPlayer.Name then
					if _G.TeamCheck == true then
						if v.Team ~= LocalPlayer.Team then
							if v.Character ~= nil then
								if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
									if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
										local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
										local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
										
										if VectorDistance < MaximumDistance then
											Target = v
													  MaximumDistance = VectorDistance
										end
									end
								end
							end
						end
					else
						if v.Character ~= nil then
							if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
								if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
									local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
									local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
									
									if VectorDistance < MaximumDistance then
										Target = v
												   MaximumDistance = VectorDistance
									end
								end
							end
						end
					end
				end
			end
		
			return Target
		end
		
		UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = true
			end
		end)
		
		UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = false
			end
		end)
		
		RunService.RenderStepped:Connect(function()
			if Holding == true and _G.AimbotEnabled == true then
				TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
			end
		end)
  	end    
})

GunTab:AddButton({
	Name = "No Spread And Recoil",
	Callback = function()
		local pathh = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.WeaponryClientFramework)

		pathh.RandomRecoilValue = function()
		   return 0
		end
		
		local pathh = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.WeaponryClientFramework)
		
		pathh.CalculateWeaponAccuracy = function()
		  return
		end
  	end    
})
local MovementTab = Window:MakeTab({
	Name = "Movement",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
MovementTab:AddToggle({
	Name = "Infınıte Jump",
	Default = false,
	Callback = function(Value)
		local Player = game:GetService'Players'.LocalPlayer;
		local UIS = game:GetService'UserInputService';
				
		_G.JumpHeight = 50;
				
		function Action(Object, Function) if Object ~= nil then Function(Object); end end
				
		UIS.InputBegan:connect(function(UserInput)
		 if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
			Action(Player.Character.Humanoid, function(self)
					 if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
					   Action(self.Parent.HumanoidRootPart, function(self)
						   self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
						   end)
					  end
				   end)
				 end
			end)
		 end    
	})   
MovementTab:AddToggle({
	Name = "Bypassed Fly",
	Default = false,
	Callback = function(Value)
		function Fly(bool) local localplayer = game.Players.LocalPlayer local mouse = localplayer:GetMouse() if workspace:FindFirstChild("Core") then workspace.Core:Destroy() end local Core = Instance.new("Part") Core.Name = "Core" Core.Size = Vector3.new(0.05, 0.05, 0.05) spawn(function() Core.Parent = workspace local Weld = Instance.new("Weld", Core) Weld.Part0 = Core Weld.Part1 = localplayer.Character.LowerTorso Weld.C0 = CFrame.new(0, 0, 0) end) workspace:WaitForChild("Core") local torso = workspace.Core flying = true local speed=10 local keys={a=false,d=false,w=false,s=false} local e1 local e2 local function start() local pos = Instance.new("BodyPosition",torso) local gyro = Instance.new("BodyGyro",torso) pos.Name="EPIXPOS" pos.maxForce = Vector3.new(math.huge, math.huge, math.huge) pos.position = torso.Position gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9) gyro.cframe = torso.CFrame repeat wait() localplayer.Character.Humanoid.PlatformStand=true local new=gyro.cframe - gyro.cframe.p + pos.position if not keys.w and not keys.s and not keys.a and not keys.d then speed=5 end if keys.w then new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed speed=speed+0 end if keys.s then new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed speed=speed+0 end if keys.d then new = new * CFrame.new(speed,0,0) speed=speed+0 end if keys.a then new = new * CFrame.new(-speed,0,0) speed=speed+0 end if speed>10 then speed=5 end pos.position=new.p if keys.w then gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0) elseif keys.s then gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0) else gyro.cframe = workspace.CurrentCamera.CoordinateFrame end until flying == false if gyro then gyro:Destroy() end if pos then pos:Destroy() end flying=false localplayer.Character.Humanoid.PlatformStand=false speed=10 end e1=mouse.KeyDown:connect(function(key) if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end if key=="w" then keys.w=true elseif key=="s" then keys.s=true elseif key=="a" then keys.a=true elseif key=="d" then keys.d=true elseif key=="x" then if flying==true then flying=false else flying=true start() end end end) e2=mouse.KeyUp:connect(function(key) if key=="w" then keys.w=false elseif key=="s" then keys.s=false elseif key=="a" then keys.a=false elseif key=="d" then keys.d=false end end) local function stop() end if bool == true then start() else stop() end end
return Fly
	end    
})

MovementTab:AddSlider({
	Name = "Walkspeed",
	Min = 16,
	Max = 350,
	Default = 16,
	Color = Color3.fromRGB(34,255,0),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end    
})
MovementTab:AddSlider({
	Name = "Jump Power",
	Min = 50,
	Max = 550,
	Default = 50,
	Color = Color3.fromRGB(34,255,0),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end    
})
local EspTab = Window:MakeTab({
	Name = "Esp",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
EspTab:AddToggle({
	Name = "Chams",
	Default = false,
	Callback = function(Value)
		local color1 = Color3.new(1,1,1) -- If this is changed it could look at bit wierd. I recommend letting this one stay the way it is.
local color2 = Color3.new(0.06666666666, 0.70588235294, 0.74117647058)
local hitboxes = {
	['Head'] = 'Cylinder',
	['Left Arm'] = 'Box',
	['Right Arm'] = 'Box',
	['Left Leg'] = 'Box',
	['Right Leg'] = 'Box',
	['Torso'] = 'Box',
	['Left Arm'] = 'Box',
	['LeftFoot'] = 'Box',
	['LeftHand'] = 'Box',
	['LeftLowerArm'] = 'Box',
	['LeftLowerLeg'] = 'Box',
	['LeftUpperArm'] = 'Box',
	['LeftUpperLeg'] = 'Box',
	['LowerTorso'] = 'Box',
	['RightFoot'] = 'Box',
	['RightHand'] = 'Box',
	['RightHand'] = 'Box',
	['RightLowerArm'] = 'Box',
	['RightLowerLeg'] = 'Box',
	['RightUpperArm'] = 'Box',
	['RightUpperLeg'] = 'Box',
	['UpperTorso'] = 'Box'
}

--<<<<<<< DO NOT EDIT ANYTHING BELOW HERE

-->>>>>>> Variables
local players = game:GetService('Players')
local lp = players.LocalPlayer
--<<<<<<<

game:GetService('RunService').RenderStepped:Connect(function()
	-- Running function every frame
	for _, player in pairs(players:GetPlayers()) do
		-- Getting all the players
		if player ~= lp and player.Character and player.Character:FindFirstChild('Humanoid') and player.Character:FindFirstChild('HumanoidRootPart') and player.Character:FindFirstChild('Head') and player.Character.Humanoid.Health > 0 then
			-- Checking if the player has base body parts
			local character = player.Character
			if character:FindFirstChild('CHAMS_u5i^9ovEu{/3s^^5fY{FA5>SyMr;j(UJ5q=G=7s6kya>Sf=^B^OV&1{%:UM:T*R') then
				-->>>>>>> Enabling / Disabling chams based on team
				if teamCheck == true then
					-- Checking if the team check setting is on
					for _, obj in pairs(character:GetChildren()) do
						if player.Team == lp.Team then
							-- Checking if the player is on our team
							if obj:FindFirstChildWhichIsA('BoxHandleAdornment') or obj:FindFirstChildWhichIsA('CylinderHandleAdornment') then
								-- Making sure he has chams
								for _, handle in pairs(obj:GetChildren()) do
									-- Getting all objects in the character part
									if handle:IsA('BoxHandleAdornment') or handle:IsA('CylinderHandleAdornment') then
										-- Checking for cham part
										handle.Transparency = 1 -- Making it invisible
									end
								end
							end
						else
							-- Player is not on our team
							if obj:FindFirstChildWhichIsA('BoxHandleAdornment') or obj:FindFirstChildWhichIsA('CylinderHandleAdornment') then
								-- Making sure he has chams
								for _, handle in pairs(obj:GetChildren()) do
									-- Getting all objects in the character part
									if handle:IsA('BoxHandleAdornment') or handle:IsA('CylinderHandleAdornment') then
										-- Checking for cham part
										if handle.Name == 'ok50' then -- Checking for visible only part
											handle.Transparency = 0.5 -- Making it visible
										else
											handle.Transparency = 0.75 -- Making it visible
										end
									end
								end
							end
						end
					end
				end
                --<<<<<<<
			end
			-->>>>>> Checking if chams already exist in the character
			if not character:FindFirstChild('CHAMS_u5i^9ovEu{/3s^^5fY{FA5>SyMr;j(UJ5q=G=7s6kya>Sf=^B^OV&1{%:UM:T*R') then
				local checkvalue = Instance.new('BoolValue')
				checkvalue.Parent = character
				checkvalue.Name = 'CHAMS_u5i^9ovEu{/3s^^5fY{FA5>SyMr;j(UJ5q=G=7s6kya>Sf=^B^OV&1{%:UM:T*R'
				--<<<<<<<

				for _, obj in pairs(character:GetChildren()) do
					-- Each object in the player's character
					if obj:IsA('BasePart') then
						-- Checking if its a part
						if hitboxes[obj.Name] and hitboxes[obj.Name] == 'Box' then
							-- Making sure the part is not the Head or the HumanoidRootPart
							-->>>>>> Adding chams
							local handle = Instance.new('BoxHandleAdornment',obj)
							handle.Size = obj.Size
							handle.ZIndex = 2
							handle.Color3 = color1
							handle.Transparency = 0.75
							handle.Adornee = obj
							handle.AlwaysOnTop = true
							handle.Parent = obj
							handle.Name = 'ok75'
							local handle2 = Instance.new('BoxHandleAdornment',obj)
							handle2.Size = obj.Size + Vector3.new(0.05,0.05,0.05)
							handle2.Color3 = color2
							handle2.Transparency = 0.5
							handle2.Adornee = obj
							handle2.AlwaysOnTop = true
							handle2.Parent = obj
							handle2.Name = 'ok75'
							--<<<<<<<
						elseif hitboxes[obj.Name] and hitboxes[obj.Name] == 'Cylinder' then
							-- Checking for Head
							-->>>>>>> Creating a rotated part cause of roblox's wierd Adornment system
							local part = Instance.new('Part',obj)
							part.Size = Vector3.new(0.01,0.01,0.01)
							part.Position = obj.Position
							part.Transparency = 1
							part.Name = 'Fixed'
							part.Orientation = Vector3.new(90, 0, 0)
							local weld = Instance.new('WeldConstraint',obj)
							weld.Part0 = obj
							weld.Part1 = part
							--<<<<<<<
							-->>>>>>> Adding chams
							local handle = Instance.new('CylinderHandleAdornment',obj)
							handle.Height = 1.25
							handle.Radius = 0.65
							handle.ZIndex = 2
							handle.Color3 = color1
							handle.Transparency = 0.75
							handle.Adornee = part
							handle.AlwaysOnTop = true
							handle.Parent = obj
							handle.Name = 'ok75'
							local handle2 = Instance.new('CylinderHandleAdornment',obj)
							handle2.Height = 1.3
							handle2.Radius = 0.7
							handle2.Color3 = color2
							handle2.Transparency = 0.5
							handle2.Adornee = part
							handle2.AlwaysOnTop = true
							handle2.Parent = obj
							handle2.Name = 'ok75'
							--<<<<<<<
						end
					end
				end
			end
		end
	end
end)
	end    
})


local DestroyTab = Window:MakeTab({
	Name = "Destroy Gui",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

	DestroyTab:AddButton({
	Name = "Destroy Gui",
	Callback = function()
		OrionLib:Init()

  	end    
})
