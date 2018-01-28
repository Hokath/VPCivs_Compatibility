print("Khmer Civ Related")

local KhmerID = GameInfoTypes.CIVILIZATION_KHMER_LS_MOD;
local KhmerD = GameInfoTypes.BUILDINGCLASS_KHMERLS_DUMMY;
local KhmerDD = GameInfoTypes.BUILDING_KHMERLS_DUMMY;
local MilitiaID = GameInfoTypes.UNIT_LS_MILITIA;
local buildMission = MissionTypes.MISSION_BUILD;
local FarmBuild = GameInfoTypes.BUILD_FARM;
local PasBuild = GameInfoTypes.BUILD_PASTURE;
local PlanBuild = GameInfoTypes.BUILD_PLANTATION;
local QuaBuild = GameInfoTypes.BUILD_QUARRY;
local MinBuild = GameInfoTypes.BUILD_MINE;
local CamBuild = GameInfoTypes.BUILD_CAMP;
local FaithID = YieldTypes.YIELD_FAITH;
local GoldenAgeID = YieldTypes.YIELD_GOLDEN_AGE_POINTS;
local TourismID = YieldTypes.YIELD_TOURISM;
 
GameEvents.CityCaptureComplete.Add(function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local kplot = Map.GetPlot(iX, iY);	
	local kCity = kplot:GetPlotCity();
	if Players[iNewOwner]:GetCivilizationType() == KhmerID then
		CheckBaray(iNewOwner)
	end
	if Players[iOldOwner]:GetCivilizationType() == KhmerID then
		kCity:SetBuildingYieldChange(KhmerD, GoldenAgeID, 0);
		CheckCitizens(iOldOwner)
	end
end)

function CheckCitizens(iPlayer)
	for iCity in Players[iPlayer]:Cities() do
		local iVal = 0;	
		local cVal = iCity:GetBuildingYieldChange(KhmerD, GoldenAgeID);
		if iCity:IsCapital() then
			iVal = iCity:GetNumWorldWonders();
		end
		iCity:SetBuildingYieldChange(KhmerD, FaithID, 2 * iVal);
		iCity:SetBuildingYieldChange(KhmerD, GoldenAgeID, 1 * iVal);
		iCity:SetBuildingYieldChange(KhmerD, TourismID, 3 * iVal);
		if iVal ~= cVal then
			ChangeCitizens(iCity, iVal - cVal)
		end	
	end
end

function ChangeCitizens(iCity, value)
	local Rise = true;
	if value < 0 then
		Rise = false;
		value = -1 * value;
	end
	for i = 1, value do
		iCity:ChangePopulation(1, Rise);
		iCity:ChangePopulation(-1, not Rise);
	end
end

GameEvents.PlayerDoTurn.Add(function(iPlayer)
	if Players[iPlayer]:GetCivilizationType() == KhmerID then
		CheckCitizens(iPlayer)
		CheckBaray(iPlayer)
		if not Players[iPlayer]:IsHuman() then
			local pTeam = Teams[Players[iPlayer]:GetTeam()];
			if pTeam:GetAtWarCount(false) == 0 then
				for iUnit in Players[iPlayer]:Units() do
					if iUnit:GetUnitType() == MilitiaID then
						local iPlot = iUnit:GetPlot();
						if iPlot:GetImprovementType() == -1 then
							if iPlot:GetOwner() == iPlayer then
								KhmerMiltiaWork(iUnit, iPlot, FarmBuild)
								KhmerMiltiaWork(iUnit, iPlot, PasBuild)
								KhmerMiltiaWork(iUnit, iPlot, PlanBuild)
								KhmerMiltiaWork(iUnit, iPlot, MinBuild)
								KhmerMiltiaWork(iUnit, iPlot, QuaBuild)
								KhmerMiltiaWork(iUnit, iPlot, CamBuild)
							end
						end
					end
				end
			end
		end
	end
end)

function KhmerMiltiaWork(iUnit, iPlot, BuildKhmer)
	if iUnit:CanBuild(iPlot, BuildKhmer) then
		iUnit:PushMission(buildMission,BuildKhmer,BuildKhmer);
	end
end

GameEvents.PlayerCityFounded.Add(function(iPlayer, iCityX, iCityY)
	if Players[iPlayer]:GetCivilizationType() == KhmerID then
		CheckBaray(iPlayer)
	end
end)

function CheckBaray(iPlayer)
	for iCity in Players[iPlayer]:Cities() do
		if iCity:IsCapital() then
			iCity:SetNumRealBuilding(KhmerDD, 1);
		end
	end
end