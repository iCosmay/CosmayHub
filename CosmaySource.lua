if game.PlaceId == 8524876576 then
	local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()
	local win = SolarisLib:New({
	Name = "CosmayHub | Glider Sim",
	FolderToSave = "CosmayHub"
  })

  local Farmtab = win:Tab("Farm")
  local Farmsec = Farmtab:Section("Farm")
  Farmsec:Button("AutoFarm", function()
	getgenv().on = true; -- change to false to disable
	while getgenv().on == true do
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Collectables.CoinBoost.Weight.CFrame
	game:GetService("RunService").Heartbeat:wait();
	end;
  end)

elseif game.PlaceId == 10963175 then
	local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()
	local win = SolarisLib:New({
	Name = "CosmayHub | Game Store Tycoon",
	FolderToSave = "CosmayHub"
  })
  local Cashtab = win:Tab("Cash")
  local Cashsec = Cashtab:Section("Cash Gıver")
  Cashsec:Button("Cash Gıver", function()
	local money = 10000
	local children = workspace.Tycoons:GetChildren()
	for i, child in ipairs(children) do
   if child.Info.Owner.Value == game.Players.LocalPlayer.Name then
       child.Control.Money:FireServer(money)
   end
	end
  end)

elseif game.PlaceId == 11346342371 then
	local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()
	local win = SolarisLib:New({
	Name = "CosmayHub | making memes in your basement at 3 AM tycoon",
	FolderToSave = "CosmayHub"
  })
  local Autofarmtab = win:Tab("AutoFarm")
  local Autofarmsec = Autofarmtab:Section("Auto Upload")
  Autofarmsec:Button("Auto Upload", function()
	game:GetService("RunService").Heartbeat:Connect(function()
		game:GetService("ReplicatedStorage").Events.MemeToStorage:FireServer()
		game:GetService("ReplicatedStorage").Events.UploadCurrentMemes:FireServer()
	end)
  end)

elseif game.PlaceId == 3297964905 then
	local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()
	local win = SolarisLib:New({
	Name = "CosmayHub | Weaponry",
	FolderToSave = "CosmayHub"
  })
  local Aimbottab = win:Tab("Aimbot")
  local Aimbotsec = Aimbottab:Section("Aimbot")

  Aimbotsec:Button("Aimbot", function()
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
	
	_G.CircleSides = 64 -- How many sides the FOV circle would have.
	_G.CircleColor = Color3.fromRGB(255, 255, 255) -- (RGB) Color that the FOV circle would appear as.
	_G.CircleTransparency = 0.7 -- Transparency of the circle.
	_G.CircleRadius = 80 -- The radius of the circle / FOV.
	_G.CircleFilled = false -- Determines whether or not the circle is filled.
	_G.CircleVisible = true -- Determines whether or not the circle is visible.
	_G.CircleThickness = 0 -- The thickness of the circle.
	
	local FOVCircle = Drawing.new("Circle")
	FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
	FOVCircle.Radius = _G.CircleRadius
	FOVCircle.Filled = _G.CircleFilled
	FOVCircle.Color = _G.CircleColor
	FOVCircle.Visible = _G.CircleVisible
	FOVCircle.Radius = _G.CircleRadius
	FOVCircle.Transparency = _G.CircleTransparency
	FOVCircle.NumSides = _G.CircleSides
	FOVCircle.Thickness = _G.CircleThickness
	
	local function GetClosestPlayer()
		local MaximumDistance = _G.CircleRadius
		local Target = nil
	
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
		FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
		FOVCircle.Radius = _G.CircleRadius
		FOVCircle.Filled = _G.CircleFilled
		FOVCircle.Color = _G.CircleColor
		FOVCircle.Visible = _G.CircleVisible
		FOVCircle.Radius = _G.CircleRadius
		FOVCircle.Transparency = _G.CircleTransparency
		FOVCircle.NumSides = _G.CircleSides
		FOVCircle.Thickness = _G.CircleThickness
	
		if Holding == true and _G.AimbotEnabled == true then
			TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
		end
	end)
end)

local Visualstab = win:Tab("Visuals")
local Visualssec = Visualstab:Section("Visuals")

	Visualssec:Button("Esp", function()
		local Settings = {
			['Material'] = Enum.Material.Neon, -- Material
			['Color'] = Color3.fromRGB(190,37,42), -- Color
			['Transparency'] = 0.7 -- 0 to 1 Transparency
		}
		
		local ScreenGui = Instance.new('ScreenGui', game.CoreGui) -- Create screengui
		ScreenGui.IgnoreGuiInset = true
		
		local ViewportFrame = Instance.new('ViewportFrame', ScreenGui) -- Create viewport and define properties
		ViewportFrame.CurrentCamera = workspace.CurrentCamera
		ViewportFrame.Size = UDim2.new(1,0,1,0)
		ViewportFrame.BackgroundTransparency = 1
		ViewportFrame.ImageTransparency = Settings.Transparency
		
		local Chasms = {} -- Array for storing parts
		
		function generateChasm(player) -- functions that generates chasms for the player specififed
			local Character = workspace:FindFirstChild(player.Name)
			
			if Character then
				for _,Part in pairs(Character:GetChildren()) do
					if Part:IsA('Part') or Part:IsA('MeshPart') then
						local Chasm = Part:Clone()
						
						for _,Child in pairs(Chasm:GetChildren()) do
							if Child:IsA('Decal') then
								Child:Destroy()
							end
						end
						
						Chasm.Parent = ViewportFrame
						Chasm.Material = Settings.Material
						Chasm.Color = Settings.Color
						Chasm.Anchored = true
						
						table.insert(Chasms, Chasm)
					end
				end
			end
		end
		
		function clearChasms() -- remove all chasms
			for _,Chasm in pairs(Chasms) do
				Chasm:Destroy()
			end
			
			Chasms = {}
		end
		
		while game:GetService('RunService').RenderStepped:Wait() do -- loop this process
			clearChasms()
			
			for _,Player in pairs(game:GetService('Players'):GetPlayers()) do
				if Player ~= game:GetService('Players').LocalPlayer then
					generateChasm(Player)
				end
			end
		end
  end)
  
  local Misctab = win:Tab("Misc")
  local Miscsec = Misctab:Section("Misc")
  Miscsec:Button("Server Hop", function()
	SolarisLib:Notification("iCosmay", "I'm teleporting baby.")
	local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()

	module:Teleport(game.PlaceId)
  end)

end