print("Glorious Lion")

local iGot = GameInfoTypes.CIVILIZATION_FLANDERS_LS_MOD;
local iMarsh = GameInfoTypes.BUILD_MARSH_FLANDERS;


for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == iGot then
			include("Flanders Civ Related")
			break;
		end
	end
end

function CanWeBuildItF(iPlayer, iUnit, iX, iY, iBuild)
	if iBuild == iMarsh and Players[iPlayer]:GetCivilizationType() == iGot then
		return true
	elseif iBuild == iMarsh then
		return false
	end
	return true
end

GameEvents.PlayerCanBuild.Add(CanWeBuildItF)

function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end

local civilisationID = GameInfoTypes["CIVILIZATION_FLANDERS_LS_MOD"];
local isLuxembourgCivActive = JFD_IsCivilisationActive(civilisationID);
local unitPromotionChasseurID		= GameInfoTypes["PROMOTION_JFD_CHASSEUR"]
local unitPromotionChasseurMarchID	= GameInfoTypes["PROMOTION_JFD_CHASSEUR_MARCH"]

function JFD_GetWarPartner(player)
	local warPartner
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS-1 do
		if playerID ~= player:GetID() then
			if Teams[Players[playerID]:GetTeam()]:IsAtWar(player:GetTeam()) then
				warPartner = Players[playerID]
			end
		end
	end
		
	return warPartner
end

function JFD_ChasseurMarch(playerID)
	local player = Players[playerID]
	if player:IsEverAlive() then
		local coalitionWar = false
		if JFD_GetWarPartner(player) then
			local warPartner = JFD_GetWarPartner(player)
			for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS-1 do
				if otherPlayerID ~= playerID then
					local otherPlayer = Players[otherPlayerID]
					local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
					if (JFD_GetWarPartner(otherPlayer) == warPartner and otherPlayer:IsDoF(playerID)) then
						coalitionWar = true
						break
					end
				end
			end
				
			for unit in player:Units() do
				if coalitionWar then
					if unit:IsHasPromotion(unitPromotionChasseurID) then
						unit:SetHasPromotion(unitPromotionChasseurMarchID, true)
						unit:SetHasPromotion(unitPromotionChasseurID, false)
					end
				else
					if unit:IsHasPromotion(unitPromotionChasseurMarchID) then
						unit:SetHasPromotion(unitPromotionChasseurMarchID, false)
						unit:SetHasPromotion(unitPromotionChasseurID, true)
					end
				end
			end
		end
	end
end
if isLuxembourgCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_ChasseurMarch)
end

function buildATap(pPlayer, pCity)
	for pCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
		local pSpecificPlot = pCity:GetCityIndexPlot(pCityPlot)
		if
			pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS then
			if pSpecificPlot:GetFeatureType() == (-1) and not pSpecificPlot:IsMountain() then
				if pSpecificPlot:GetResourceType(-1) == (-1) then
					pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_LS_TAPESTRY, 1)
					print("Tapestry Placed on Grasslands")
					return true
				end
			end
				elseif
			pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS then
			if pSpecificPlot:GetFeatureType() == (-1) and not pSpecificPlot:IsMountain() then
				if pSpecificPlot:GetResourceType(-1) == (-1) then
					pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_LS_TAPESTRY, 1)
					print("Tapestry Placed on Plains")
					return true
				end
			end
		end
	end
	return false
end
	
function PutTapSomewhere(player, city, building)
	if building == GameInfoTypes.BUILDING_LS_CRAFT_GUILD then
		local pPlayer = Players[player]
			local pCity = pPlayer:GetCityByID(city)
			if buildATap(pPlayer, pCity) == false then
				print("No place to place a Cow.")
		end
	elseif building == GameInfoTypes.BUILDING_MORI_LACE_MAKER then
		local pPlayer = Players[player]
			local pCity = pPlayer:GetCityByID(city)
			if buildALace(pPlayer, pCity) == false then
				print("No place to place a Cow.")
		end
	end
end
GameEvents.CityConstructed.Add(PutTapSomewhere)

function buildALace(pPlayer, pCity)
	for pCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
		local pSpecificPlot = pCity:GetCityIndexPlot(pCityPlot)
		if
			pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS then
			if pSpecificPlot:GetFeatureType() == (-1) and not pSpecificPlot:IsMountain() then
				if pSpecificPlot:GetResourceType(-1) == (-1) then
					pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_MORI_LACE, 1)
					print("Lace Placed on Grasslands")
					return true
				end
			end
				elseif
			pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS then
			if pSpecificPlot:GetFeatureType() == (-1) and not pSpecificPlot:IsMountain() then
				if pSpecificPlot:GetResourceType(-1) == (-1) then
					pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_MORI_LACE, 1)
					print("Lace Placed on Plains")
					return true
				end
			end
		end
	end
	return false
end