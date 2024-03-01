-- made by https://lmaobox.net/forum/v/profile/34545496/somefemboy5141
-- https://gist.github.com/LewdDeveloper/6a7ffb91bb659a23874f8d67d7c8b2de 
local friend = -1 -- woops, forgot about this

local function CreateMove()
	local players = entities.FindByClass("CTFPlayer")
	local friendOnly = false
	
	for i, player in pairs(players) do -- get players
		
		if player:IsDormant() or not player:IsAlive() then -- if our player is nil, return
			return;
		end
			
		if playerlist.GetPriority(player) == friend then -- check if the player is our friend
			gui.SetValue("Follow bot", "friends only")			
			friendOnly = true	
			break	
		end
	end

	if not friendOnly then
		gui.SetValue("Follow bot", "all players") -- if no friends are found, follow all players
	end
end

callbacks.Unregister("CreateMove", "Followbot-Switcher")
callbacks.Register("CreateMove", "Followbot-Switcher", CreateMove)
