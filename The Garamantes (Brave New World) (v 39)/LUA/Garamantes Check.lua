print ("Garamantes Check")

local GaramantesID = GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == GaramantesID then
			include("Garamantes Scripts")
			break;
		end
	end
end

local bWatermill = GameInfoTypes.BUILDING_WATERMILL;
local bHydro = GameInfoTypes.BUILDING_HYDRO_PLANT;

GameEvents.CityCanConstruct.Add(
function(iPlayer, iCity, iBuilding) 
	local pPlayer = Players[iPlayer];
	local pCity = pPlayer:GetCityByID(iCity);
	local cPlot = pCity:Plot()
  	if (iBuilding == bWatermill) then
		if not (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) then
			if (cPlot:IsRiver()) then
				return true
			else
				return false
			end
		end
	end
	if (iBuilding == bHydro) then
		if not (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) then
			if (cPlot:IsRiver()) then
				return true
			else
				return false
			end
		elseif (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) then
			if not (pPlayer:IsHuman()) then
				if (cPlot:IsRiver()) then
					return true
				else
					return false
				end
			elseif (pPlayer:IsHuman()) then
				return true
			end
		end
	end
	return true
end);