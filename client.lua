local Players = game:GetService('Players')

local Client = Players.LocalPlayer
local PlayerGui = Client.PlayerGui

local Keys = {'F','H','G','T','J','K','E','A','G','U'}

local Main = PlayerGui:WaitForChild('Main')
local ClashingUI = Main:WaitForChild('Clashing')

local UserInputService = game:GetService('UserInputService')

local ClashingData = {};
local ClashingKeys = {};

local CurrentClashingIndex = 0;

local function UpdateKeys()
	for i = 1, 4 do
		if #ClashingKeys > 4 then
			break
		end
		
		ClashingKeys[i] = Keys[math.random(1, #Keys)]
		ClashingKeys[i] = {Keys[math.random(1, #Keys)], false}
	end	
	
	for i,v in pairs(ClashingKeys) do
		ClashingUI[i]:WaitForChild('TextLabel').Text = v
	end
	
end

local CheckClashInput = coroutine.create(function()
	UserInputService.InputBegan:Connect(function(Input, GameProcessedEvent)
		if GameProcessedEvent then return end

	end)
end)

task.spawn(function()
	task.wait(5)
	
	local InputCounter = 0
	ClashingUI.Visible = true
	
	repeat task.wait()
		
		UpdateKeys()
		coroutine.resume(CheckClashInput)
		task.wait(4)
		coroutine.yield(CheckClashInput)
		
	until InputCounter >= 4
	
	ClashingUI.Visible = false
end)

