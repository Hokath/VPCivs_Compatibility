print("Durrani Civ Related")

local Writers = GameInfoTypes.BUILDING_PALACE;
local Marker = GameInfoTypes.BUILDINGCLASS_DUMMY_DUR_GW1;
local Amphi = GameInfoTypes.BUILDINGCLASS_AMPHITHEATER;
local LiteratureNight = GameInfoTypes.BUILDING_LITERATURE_NIGHT;
local DurID = GameInfoTypes.CIVILIZATION_DURRANI_LS_MOD;
local FaithID = YieldTypes.YIELD_FAITH;
local CultureID = YieldTypes.YIELD_CULTURE;
local ZIBPDT = GameInfoTypes.IMPROVEMENT_LS_IBPDT;
local DurBuiTab = {GameInfoTypes.BUILDING_DUMMY_DUR_GW1, GameInfoTypes.BUILDING_DUMMY_DUR_GW2, GameInfoTypes.BUILDING_DUMMY_DUR_GW4, GameInfoTypes.BUILDING_DUMMY_DUR_GW8, GameInfoTypes.BUILDING_DUMMY_DUR_GW16, GameInfoTypes.BUILDING_DUMMY_DUR_GW32, GameInfoTypes.BUILDING_DUMMY_DUR_GW64}
local DurBase = GameInfoTypes.BUILDINGCLASS_DUMMY_DUR_GW0;
local DurMountains = {}

Events.SequenceGameInitComplete.Add(function()
	local DurMCount = 0;
	for i = 0, Map:GetNumPlots() - 1, 1 do
		local fPlot = Map.GetPlotByIndex( i );
		if fPlot:IsMountain() then
			DurMCount = DurMCount + 1;
			DurMountains[DurMCount] = fPlot;
		end
	end
end)

GameEvents.PlayerDoTurn.Add(function(iPlayer)
	if Players[DurPrePlayer]:GetCivilizationType() == DurID then
		DurMountCheck(DurPrePlayer)
	end
	DurPrePlayer = iPlayer;
	ZimbPPT:ChangeImprovementYieldChange(ZIBPDT, FaithID, iPlayer - ZimbPPT:GetImprovementYieldChange(ZIBPDT, FaithID));
end)

for i, player in pairs(Players) do
	if player:IsBarbarian() then
		ZimbPPT = Teams[player:GetTeam()];
		DurPrePlayer = Teams[player:GetTeam()]:GetImprovementYieldChange(ZIBPDT, FaithID);
		break;
	end
end

function DurMountGW(iPlayer, DurMountCount)
	for dCity in Players[iPlayer]:Cities() do
		for i = 1, 7 do
			if dCity:IsHasBuilding(Writers) then
				dCity:SetNumRealBuilding(DurBase, 1);
				if not ( DurMountCount < math.pow(2,7 - i) ) then
					dCity:SetNumRealBuilding(DurBuiTab[8 - i], 1);
					DurMountCount = DurMountCount - math.pow(2,7 - i)
				else
					dCity:SetNumRealBuilding(DurBuiTab[8 - i], 0);
				end
			else
				dCity:SetNumRealBuilding(DurBuiTab[8 - i], 0);
			end
		end
	end
end

function DurMountCheck(DurPrePlayer)
	local DurHelpI = 0;
	for i, plot in pairs(DurMountains) do
		if plot:GetOwner() == DurPrePlayer then
			DurHelpI = DurHelpI + 1.5;
		end
	end
	DurHelpI = math.floor(1.5 * DurHelpI);
	for dCity in Players[DurPrePlayer]:Cities() do
		if dCity:IsHasBuilding(LiteratureNight) then
			if dCity:GetBuildingGreatWork(Amphi, 0) ~= -1 then
				DurHelpI = DurHelpI + 1;
			end
			if dCity:GetBuildingGreatWork(Amphi, 1) ~= -1 then
				DurHelpI = DurHelpI + 1;
			end
		end
	end
	DurMountGW(DurPrePlayer, math.floor(DurHelpI))
end