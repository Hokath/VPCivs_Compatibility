print("Sleeping Dragon")

local iTib = GameInfoTypes.CIVILIZATION_TIBET_LS_MOD;
local bClass = GameInfoTypes.UNITCLASS_HORSEMAN;
local bType = GameInfoTypes.UNIT_RTAKHRAB_KNIGHT;

for i, player in pairs(Players) do
	if player:GetCivilizationType() == iTib then
		if player:IsEverAlive() then
			include("TibetCivRelated")
			break;
		end
	end
end

GameEvents.PlayerDoTurn.Add(function(iPlayer)	
	if Players[iPlayer]:GetUnitClassCount(bClass) then
		for iUnit in Players[iPlayer]:Units() do
			if iUnit:GetUnitType() == bType then
				iUnit:SetBaseCombatStrength(iUnit:GetLevel() + 15);
			end
		end
	end
end)