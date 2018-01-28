print ("Garamantes Scripts")

local tDesert = GameInfoTypes.TERRAIN_DESERT
local iFort = GameInfoTypes.IMPROVEMENT_MINE
local iCitadel = GameInfoTypes.IMPROVEMENT_CITADEL
local fFoggoras = GameInfoTypes.FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER
local tPlains = GameInfoTypes.TERRAIN_PLAINS;
local tGrass = GameInfoTypes.TERRAIN_GRASS
local tSnow = GameInfoTypes.TERRAIN_SNOW
local rSheep = GameInfoTypes.RESOURCE_SHEEP
local bQanat = GameInfoTypes.BUILDING_GARA_PRODUCTION_EDIT_BUILDING
local bQanat2 = GameInfoTypes.BUILDING_GARA_FOOD_EDIT_BUILDING
local bGarden = GameInfoTypes.BUILDING_GARDEN;
local bWatermill = GameInfoTypes.BUILDING_WATERMILL;
local bHydro = GameInfoTypes.BUILDING_HYDRO_PLANT;
local tEngineering = GameInfoTypes.TECH_ENGINEERING;

function gDecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end

function gCompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end

local garamantesPlots = {}

for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	if (pPlot:GetTerrainType() == tDesert) and (pPlot:IsHills()) then
		local sKey = gCompilePlotID(pPlot)
		garamantesPlots[sKey] = -1
    end
end

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
    local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	local isWar = 0;
    if (pPlayer:IsAlive()) then	
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) then
			if not (pPlayer:IsHuman()) then			
				for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
					local oPlayer = Players[oPlayer];
					if oPlayer ~= pPlayer then
						if (oPlayer:IsAlive()) then
							local oTeam = oPlayer:GetTeam();
							if Teams[pTeam]:IsAtWar(oTeam) then
								isWar = isWar + 1;
							end
						end
					end
				end
			end
			for pCity in pPlayer:Cities() do
				local cPlot = pCity:Plot();
				if cPlot:GetTerrainType() ~= tSnow then
					if cPlot:GetFeatureType() == -1 then
						cPlot:SetFeatureType(fFoggoras);
					end
				end
				if cPlot:GetTerrainType() == tPlains and cPlot:IsHills() then
					if not (pCity:GetNumBuilding(bQanat) > 0) then
						pCity:SetNumRealBuilding(bQanat, 1);
					end
				end
				if cPlot:GetTerrainType() == tGrass and cPlot:IsHills() and cPlot:GetResourceType() == rSheep then
					if not (pCity:GetNumBuilding(bQanat2) > 0) then
						pCity:SetNumRealBuilding(bQanat2, 1);
					end
				end
			end
		end
		for sKey, tTable in pairs(garamantesPlots) do
			local pPlot = gDecompilePlotID(sKey)
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) then
				if not (pPlayer:IsHuman()) then
					if isWar <= 0 then
						if (Players[pPlot:GetOwner()]) == pPlayer then
							if pPlot:GetFeatureType() == -1 and pPlot:GetImprovementType() == -1 and pPlot:GetResourceType() == -1 and not pPlot:IsUnit() and not pPlot:IsCity() and not pPlot:IsMountain() and not pPlot:IsImpassable() then			
								if (Teams[pTeam]:IsHasTech(tEngineering)) then
									pPlot:SetImprovementType(iFort);
								end
							end
						end
					end
				end
			end
			if pPlot:GetOwner() ~= -1 then
				local mPlayer = Players[pPlot:GetOwner()];
				if (mPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) and not pPlot:IsCity() then
					if pPlot:GetImprovementType() == iFort or pPlot:GetImprovementType() == iCitadel then
						pPlot:SetFeatureType(fFoggoras);
					elseif pPlot:GetImprovementType() ~= iFort and pPlot:GetImprovementType() ~= iCitadel then 
						if pPlot:GetFeatureType() == fFoggoras then
							pPlot:SetFeatureType(-1);
						end
					end
				elseif (mPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) and not pPlot:IsCity() then
					if pPlot:GetFeatureType() == fFoggoras then
						pPlot:SetFeatureType(-1);
					end
				end
			else
				if pPlot:GetFeatureType() == fFoggoras then
					pPlot:SetFeatureType(-1);
				end
			end
		end
	end
end);

GameEvents.CityCaptureComplete.Add(
function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local kPlot = Map.GetPlot(iX, iY);
	local kCity = kPlot:GetPlotCity();
	if kPlot:GetFeatureType() == fFoggoras then
		kPlot:SetFeatureType(-1);
	end
	if kCity:IsHasBuilding(bGarden) then
		if not kPlot:IsFreshWater() then
			kCity:SetNumRealBuilding(bGarden, 0);
		end
	end
	if kCity:IsHasBuilding(bWatermill) then
		if not kPlot:IsRiver() then
			kCity:SetNumRealBuilding(bWatermill, 0);
		end
	end
	if kCity:IsHasBuilding(bHydro) then
		if not kPlot:IsRiver() then
			kCity:SetNumRealBuilding(bHydro, 0);
		end
	end
end);

GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) then
			if pPlot:GetFeatureType() == -1 then
				pPlot:SetFeatureType(fFoggoras);
			end
		end
	end
end);

GameEvents.BuildFinished.Add(function(iPlayer, x, y, eImprovement) 
	local pPlayer = Players[iPlayer];
	local iPlot = Map.GetPlot(x, y);
	if iPlot:GetFeatureType() == fFoggoras then
		iPlot:SetFeatureType(-1);
	end
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) then
		if (iPlot:GetTerrainType() == tDesert) and (iPlot:IsHills()) then
			if (eImprovement == iFort) or (eImprovement == iCitadel) then
				iPlot:SetFeatureType(fFoggoras);
			end
		end
	end
end);
