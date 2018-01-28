print("Minoan Civ Related")

local Minos =  GameInfoTypes.CIVILIZATION_MINOAN_LS_MOD;
local ValidR = {}
local PlotR = {}
local FaithUID = YieldTypes.YIELD_FAITH;
local ProductionUID = YieldTypes.YIELD_PRODUCTION;
local GoldUID = YieldTypes.YIELD_GOLD;
local Antakora = GameInfoTypes.BUILDING_LS_MINOAN_PALACE;
local RandT = {YieldTypes.YIELD_FOOD, YieldTypes.YIELD_CULTURE, FaithUID, GoldUID, YieldTypes.YIELD_TOURISM}
local ZimbPPT = 63;
local HetUUPP = 0;
local ZIBPDT = GameInfoTypes.IMPROVEMENT_LS_IBPDT;
local classWM = GameInfoTypes.BUILDINGCLASS_WATERMILL;
local pYield = YieldTypes.YIELD_PRODUCTION;

for iRow in GameInfo.Resource_YieldChanges() do
	if iRow.YieldType == "YIELD_FOOD" then
		ValidR[GameInfo.Resources[iRow.ResourceType].ID] = true;
	end 
end

Events.SequenceGameInitComplete.Add(function()
	for i = 0, Map:GetNumPlots() - 1, 1 do
		local fPlot = Map.GetPlotByIndex( i );
		if ValidR[fPlot:GetResourceType(-1)]  then
			PlotR[fPlot] = 1;
		end
	end
end)

GameEvents.PlayerDoTurn.Add(function(iPlayer)
	local pPlayer = Players[HetUUPP];
	if pPlayer:GetCivilizationType() == Minos then
		GrandeMinoanCheck(HetUUPP, true)
	end
	HetUUPP = iPlayer;
	ZimbPPT:ChangeImprovementYieldChange(ZIBPDT, FaithUID, iPlayer - ZimbPPT:GetImprovementYieldChange(ZIBPDT, FaithUID ));
end)

function ChangePlotYield(fPlot, nYield, value)
	local cYield = fPlot:GetYield(nYield);
	Game.SetPlotExtraYield(fPlot:GetX(), fPlot:GetY(), nYield, 0)
	Game.SetPlotExtraYield(fPlot:GetX(), fPlot:GetY(), nYield, value + cYield - fPlot:GetYield(nYield))
end

function GrandeMinoanCheck(iPlayer, bool)
	for fPlot, int in pairs(PlotR) do
		local fOwner = fPlot:GetOwner();
		local cYield = load(fPlot, "LS12MinUAbon")
		if cYield then
			if fOwner == -1 or Players[fOwner]:GetCivilizationType() ~= Minos then
				save(fPlot, "LS12MinUAbon", nil)
				ChangePlotYield(fPlot, cYield, -2)
			elseif iPlayer == fOwner and bool then
				local nYield = RandT[math.random(1,5)]
				if nYield ~= cYield then
					save(fPlot, "LS12MinUAbon", nYield)
					ChangePlotYield(fPlot, cYield, -2)
					ChangePlotYield(fPlot, nYield, 2)
				end
			end
		elseif fOwner == iPlayer and bool then
			local nYield = RandT[math.random(1,5)]
			save(fPlot, "LS12MinUAbon", nYield)
			ChangePlotYield(fPlot, nYield, 2)
		end
	end
end

function OnCityCaptureMin(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	if Players[iOldOwner]:GetCivilizationType() == Minos then
		GrandeMinoanCheck(iOldOwner, false)
	end
end
GameEvents.CityCaptureComplete.Add(OnCityCaptureMin)

for i, player in pairs(Players) do
	if player:IsBarbarian() then
		ZimbPPT = Teams[player:GetTeam()];
		HetUUPP = ZimbPPT:GetImprovementYieldChange(ZIBPDT, FaithUID);
		break;
	end
end