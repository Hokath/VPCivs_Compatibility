print("Flanders Civ Related")

include( "IconSupport" );
include( "InstanceManager" );
include( "SupportFunctions"  );
local g_BuyPlotButtonIM = InstanceManager:new( "LS13FlandersIN", "LS13FlandersWA", Controls.LS13FlandersCS );
local WorldPositionOffset = { x = 0, y = 0, z = 0 };
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "LS13FLANDERSUI";
local FaithUID = YieldTypes.YIELD_FAITH;
local ZIBPDT = GameInfoTypes.IMPROVEMENT_LS_IBPDT;
local ZimbPPT = 63;
local PPPP = 0;
local TipiCamp = {}
local SiouxTipi = NULL;
local Flanders = GameInfoTypes.CIVILIZATION_FLANDERS_LS_MOD;
local YieldMID = YieldTypes.YIELD_FOOD;
local YieldPID = YieldTypes.YIELD_PRODUCTION;
local YieldGID = YieldTypes.YIELD_GOLD;
local MarshF = GameInfoTypes.FEATURE_MARSH;
local FarmI = GameInfoTypes.IMPROVEMENT_FARM;
local TradingI = GameInfoTypes.IMPROVEMENT_TRADING_POST;
local Luxury = GameInfoTypes.RESOURCE_LS_TAPESTRY;
local misTR = MissionTypes.MISSION_ESTABLISH_TRADE_ROUTE;
local iMarsh = GameInfoTypes.BUILD_MARSH_FLANDERS;

for i, player in pairs(Players) do
	if player:IsBarbarian() then
		ZimbPPT = Teams[player:GetTeam()];
		PPPP = ZimbPPT:GetImprovementYieldChange(ZIBPDT, FaithUID);
		break;
	end
end

Events.SequenceGameInitComplete.Add(function()
	for i = 0, Map:GetNumPlots() - 1, 1 do
		local fPlot = Map.GetPlotByIndex( i );
		if load(fPlot, "LS13FlandersON") then
			TipiCamp[fPlot] = 1;
		end
	end
end)

function ChangePlotYield(fPlot, nYield, value)
	local cYield = fPlot:GetYield(nYield);
	Game.SetPlotExtraYield(fPlot:GetX(), fPlot:GetY(), nYield, 0)
	Game.SetPlotExtraYield(fPlot:GetX(), fPlot:GetY(), nYield, value + cYield - fPlot:GetYield(nYield))
end

GameEvents.PlayerDoTurn.Add(function(iPlayer)
	if iPlayer == Game.GetActivePlayer() then
		UpdateInstances(iPlayer)
	end
	if Players[PPPP]:GetImprovementCount(SiouxTipi) > 0 then
		RecheckTipis(PPPP)
	end
	if Players[iPlayer]:GetCivilizationType() == Flanders then
		if not Players[iPlayer]:IsHuman() then
			DoAIHelpTR(iPlayer)
		end
	end
	if Players[PPPP]:GetCivilizationType() == Flanders then
		AssignProperLuxuryAmount(PPPP)
	end
	PPPP = iPlayer;
	ZimbPPT:ChangeImprovementYieldChange(ZIBPDT, YieldFID, iPlayer - ZimbPPT:GetImprovementYieldChange(ZIBPDT, YieldFID)); 
end)

function AssignProperLuxuryAmount(player)
	local pPlayer = Players[player];
	local pAmount = load(pPlayer, "LS13FlanderLUXA") or 0;
	local cAmount = 0;
	for i,v in ipairs(pPlayer:GetTradeRoutes()) do
		local dPlayer = v.ToCity:GetOwner();
		if Players[dPlayer]:IsMinorCiv() then
			cAmount = cAmount + 2;
		end
	end
	if cAmount ~= pAmount then
		if cAmount > pAmount then
			pPlayer:ChangeNumResourceTotal(Luxury, cAmount - pAmount);
			save(pPlayer, "LS13FlanderLUXA", cAmount)
		else
			local aAmount = pPlayer:GetNumResourceAvailable(Luxury)
			if (pAmount - cAmount) < aAmount then
				pPlayer:ChangeNumResourceTotal(Luxury, aAmount * -1);
				save(pPlayer, "LS13FlanderLUXA", pAmount - aAmount)
			else
				pPlayer:ChangeNumResourceTotal(Luxury, cAmount - pAmount);
				save(pPlayer, "LS13FlanderLUXA", cAmount)
			end
		end
	end
end

GameEvents.BuildFinished.Add(function(iPlayer, x, y, improID)
	if improID == SiouxTipi then
		local iPlot = Map.GetPlot(x, y);
		TipiCamp[iPlot] = 1;
		save(iPlot, "LS13FlandersON", iPlayer)
		save(iPlot, "LS13FlandersQD", 0)
		ResetQuests(iPlot)
		AssignCorrectBonus(iPlot, -1, -1, -1)
		AssignQuests(iPlot, iPlayer)
		if iPlayer == Game.GetActivePlayer() then
			UpdateInstances(iPlayer)
		end
	end
end)

function AssignCorrectBonus(iPlot, food, gold, prod)
	local cFBonus = load(iPlot,"LS13FlandersFoodB") or 0;
	if cFBonus ~= food then
		ChangePlotYield(iPlot, YieldMID, food - cFBonus)
		save(iPlot,"LS13FlandersFoodB", food)
	end
	local cGBonus = load(iPlot,"LS13FlandersGoldB") or 0;
	if cFBonus ~= gold then
		ChangePlotYield(iPlot, YieldGID, gold - cGBonus)
		save(iPlot,"LS13FlandersGoldB", gold)
	end
	local cPBonus = load(iPlot,"LS13FlandersProdB") or 0;
	if cPBonus ~= prod then
		ChangePlotYield(iPlot, YieldPID, prod - cPBonus)
		save(iPlot,"LS13FlandersProdB", prod)
	end
end

function RecheckTipis(player)
	for plot, int in pairs(TipiCamp) do
		if plot:GetImprovementType() == SiouxTipi then
			if plot:IsImprovementPillaged() then
				AssignCorrectBonus(plot, 0, 0, 0)
			elseif plot:GetOwner() ~= -1 then
				if plot:GetOwner() ~= load(plot, "LS13FlandersON") then
					ResetQuests(plot)
					AssignQuests(iPlot, plot:GetOwner())
					save(plot, "LS13FlandersON", plot:GetOwner())
				elseif plot:GetOwner() == player then
					CheckQuests(plot, player)
				end
			end
		else
			AssignCorrectBonus(plot, 0, 0, 0)
			TipiCamp[plot] = nil;
			save(plot, "LS13FlandersON", nil)
		end
	end
end

function CheckQuests(plot, player)
	local qdone = load(plot, "LS13FlandersQD");
	if qdone < 6 then
		local q1d = load(plot, "LS13FlandQT1") or -1;
		local rea = false;
		local iCity = Map.GetPlotByIndex(load(plot, "LS13FlandersCityIndex")):GetPlotCity();
		if iCity then
			if q1d ~= -1 then
				if Players[player]:GetNumResourceTotal(q1d, true) > 0 then
					save(plot, "LS13FlandQT1", -1)
					AssignCorrectBonus(plot, load(plot,"LS13FlandersFoodB") + 1, load(plot,"LS13FlandersGoldB"), load(plot,"LS13FlandersProdB"))
					rea = true;
					qdone = qdone + 1;
					save(plot, "LS13FlandersQD", qdone)
					if qdone == 6 then
						return;
					end
				end
			else
				rea = true;
			end
			local q2d = load(plot, "LS13FlandQT2") or -1;
			if q2d ~= -1 then
				if iCity:GetPopulation() >= q2d then
					save(plot, "LS13FlandQT2", -1)
					AssignCorrectBonus(plot, load(plot,"LS13FlandersFoodB") + 1, load(plot,"LS13FlandersGoldB"), load(plot,"LS13FlandersProdB"))
					rea = true;
					qdone = qdone + 1;
					save(plot, "LS13FlandersQD", qdone)
					if qdone == 6 then
						return;
					end
				end
			else
				rea = true;
			end
			local q3d = load(plot, "LS13FlandQT3") or -1;
			if q3d ~= -1 then
				if iCity:GetNumBuildings() >= q3d then
					save(plot, "LS13FlandQT3", -1)
					AssignCorrectBonus(plot, load(plot,"LS13FlandersFoodB"), load(plot,"LS13FlandersGoldB"), load(plot,"LS13FlandersProdB") + 1)
					rea = true;
					qdone = qdone + 1;
					save(plot, "LS13FlandersQD", qdone)
					if qdone == 6 then
						return;
					end
				end
			else
				rea = true;
			end
			local q4d = load(plot, "LS13FlandQT4") or -1;
			if q4d ~= -1 then
				if iCity:GetNumWorldWonders() >= q4d then
					save(plot, "LS13FlandQT4", -1)
					AssignCorrectBonus(plot, load(plot,"LS13FlandersFoodB"), load(plot,"LS13FlandersGoldB") + 2, load(plot,"LS13FlandersProdB"))
					rea = true;
					qdone = qdone + 1;
					save(plot, "LS13FlandersQD", qdone)
					if qdone == 6 then
						return;
					end
				end
			else
				rea = true;
			end
			local q5d = load(plot, "LS13FlandQT5") or -1;
			if q5d ~= -1 then
				if Map.GetPlotByIndex(q5d):GetPlotCity() then
					if HasTradeRouteWith(player, q5d) then
						save(plot, "LS13FlandQT5", -1)
						AssignCorrectBonus(plot, load(plot,"LS13FlandersFoodB"), load(plot,"LS13FlandersGoldB") + 2, load(plot,"LS13FlandersProdB"))
						rea = true;
						qdone = qdone + 1;
						save(plot, "LS13FlandersQD", qdone)
						if qdone == 6 then
							return;
						end
					end
				else
					save(plot, "LS13FlandQT5", -1)
					rea = true;
				end
			else
				rea = true;
			end
		else
			rea = true;
		end
		if rea then
			AssignQuests(plot, player)
		end
	end
end

function GetQuestText(plot, iPlayer)
	local iCity = Players[iPlayer]:GetCityByID(plot:GetCityPurchaseID());
	local text = "+" .. (2 + load(plot,"LS13FlandersFoodB")) .. "[ICON_FOOD] +" .. (2 + load(plot,"LS13FlandersProdB")) .. "[ICON_PRODUCTION] +" .. (1 + load(plot,"LS13FlandersGoldB")) .. "[ICON_GOLD]";
	text = text .. "[NEWLINE]Quests done: " .. load(plot, "LS13FlandersQD") .. "/6.";
	local q1d = load(plot, "LS13FlandQT1") or -1;
	if q1d ~= -1 then
		text = text .. "[NEWLINE][ICON_BULLET]Commune demands " .. GameInfo.Resources[q1d].IconString .. " " .. Locale.Lookup(GameInfo.Resources[q1d].Description) .. " (+1[ICON_FOOD]).";
	end
	q1d = load(plot, "LS13FlandQT2") or -1;
	if q1d ~= -1 then
		text = text .. "[NEWLINE][ICON_BULLET]Commune wants " .. iCity:GetName() .. " to reach " .. q1d .. " [ICON_CITIZEN] Population (+1[ICON_FOOD]).";
	end
	q1d = load(plot, "LS13FlandQT3") or -1;
	if q1d ~= -1 then
		text = text .. "[NEWLINE][ICON_BULLET]Commune needs (".. (q1d - iCity:GetNumBuildings()) .. ") new buildings in " .. iCity:GetName() .. " (+1[ICON_PRODUCTION]).";
	end
	q1d = load(plot, "LS13FlandQT4") or -1;
	if q1d ~= -1 then
		text = text .. "[NEWLINE][ICON_BULLET]Commune desires new World Wonder in " .. iCity:GetName() .. " (+2[ICON_GOLD]).";
	end
	q1d = load(plot, "LS13FlandQT5") or -1;
	if q1d ~= -1 then
		local dCity = Map.GetPlotByIndex(q1d):GetPlotCity();
		if dCity then
			text = text .. "[NEWLINE][ICON_BULLET]Commune finds it crucial to establish Trade Route with " .. dCity:GetName() .. " (+2[ICON_GOLD]).";
		end
	end
	return text;
end

function UpdateInstances(iPlayer)
	g_BuyPlotButtonIM:ResetInstances();
	for plot, int in pairs(TipiCamp) do
		if plot:GetImprovementType() == SiouxTipi then
			if not plot:IsImprovementPillaged() then
				if plot:GetOwner() == iPlayer then
					if load(plot, "LS13FlandersQD") ~= 6 then
						local iPlotIndex = plot:GetPlotIndex();
						local hexPos = ToHexFromGrid( Vector2( plot:GetX(), plot:GetY() ) );
						local worldPos = HexToWorld( hexPos );
						local controlTable = g_BuyPlotButtonIM:GetInstance();						
						controlTable.LS13FlandersWA:SetWorldPosition( VecAdd( worldPos, WorldPositionOffset ) );
						controlTable.CommuneButtonDetailClick:SetText( "!" );
						controlTable.CommuneButtonDetailClick:SetDisabled(true);
						controlTable.CommuneButtonDetailClick:SetToolTipString( GetQuestText(plot, iPlayer) );
					end
				end
			end
		end
	end
end

function AssignQuests(iPlot, iPlayer)
	local iCity = Players[iPlayer]:GetCityByID(iPlot:GetCityPurchaseID());
	if iCity then
		local questDone = load(iPlot, "LS13FlandersQD");
		if questDone < 6 then
			local index = iCity:Plot():GetPlotIndex();
			local change = false;
			if index ~= load(iPlot, "LS13FlandersCityIndex") then
				save(iPlot, "LS13FlandersCityIndex", index);
				change = true;
			end
			local quest1 = load(iPlot, "LS13FlandQT1") or -1;
			if (quest1 == -1) or change then
				save(iPlot, "LS13FlandQT1", GetQuest1(iCity, iPlayer))
			end
			quest1 = load(iPlot, "LS13FlandQT2") or -1;
			if (quest1 == -1) or change then
				save(iPlot, "LS13FlandQT2", (iCity:GetPopulation() + 6 - math.min(4, math.floor(iCity:GetPopulation()/5))))
			end			
			quest1 = load(iPlot, "LS13FlandQT3") or -1;
			if (quest1 == -1) or change then
				save(iPlot, "LS13FlandQT3", iCity:GetNumBuildings() + 3)
			end
			quest1 = load(iPlot, "LS13FlandQT4") or -1;
			if (quest1 == -1) or change then
				save(iPlot, "LS13FlandQT4", iCity:GetNumWorldWonders() + 1)
			end
			quest1 = load(iPlot, "LS13FlandQT5") or -1;
			if (quest1 == -1) or change then
				save(iPlot, "LS13FlandQT5", GetTradeRouteTarget(iPlayer))
			end
		end
	end
end

function GetQuest1(iCity, iPlayer)
	local iRes = iCity:GetResourceDemanded();
	if iRes ~= -1 then
		if Players[iPlayer]:GetNumResourceTotal(iRes, true) == 0 then
			return iRes;
		end
	end
	for jCity in Players[iPlayer]:Cities() do
		local iRes = jCity:GetResourceDemanded();
		if iRes ~= -1 then
			if Players[iPlayer]:GetNumResourceTotal(iRes, true) == 0 then
				return iRes;
			end
		end
	end
	return -1;
end

function ResetQuests(iPlot)
	for i = 1, 5 do
		save(iPlot, "LS13FlandQT" .. i, nil)
	end
end

function GetTradeRouteTarget(iPlayer)
	local pPlayer = Players[iPlayer];
	local hTable = {}
	for i,v in ipairs(pPlayer:GetTradeRoutes()) do
		hTable[v.ToCity] = true;
	end
	local rTab = {}
	local mTab = {}
	local mCount = 0;
	local rCount = 0;
	for i,v in ipairs(pPlayer:GetTradeRoutesAvailable()) do
		local vCity = v.ToCity;
		if not hTable[vCity] then
			hTable[vCity] = true;
			if vCity:GetOwner() ~= iPlayer then
				if Players[vCity:GetOwner()]:IsMinorCiv() then
					mCount = mCount + 1;
					mTab[mCount] = vCity:Plot():GetPlotIndex();
				end
				rCount = rCount + 1;
				rTab[rCount] = vCity:Plot():GetPlotIndex();
			end
		end
	end
	if mCount > 0 then
		return mTab[math.random(1,mCount)]
	elseif rCount > 0 then
		return rTab[math.random(1,rCount)]
	end
	return -1;
end

function HasTradeRouteWith(player, q5d)
	for i,v in ipairs(Players[player]:GetTradeRoutes()) do
		if v.ToCity:Plot():GetPlotIndex() == q5d then
			return true;
		end
	end
end

function DoAIHelpTR(iPlayer)
	local pPlayer = Players[iPlayer];
	for iUnit in pPlayer:Units() do
		if iUnit:IsTrade() then
			local iPlot = iUnit:GetPlot();
			if CheckCaravan(iUnit, iPlot, iPlayer) then
				local iCity = iPlot:GetPlotCity();
				local domainT = iUnit:GetDomainType();
				for i,v in ipairs(pPlayer:GetTradeRoutesAvailable()) do
					if v.FromCity == iCity then
						if v.domain == domainT then
							local vCity = v.ToCity;
							if Players[vCity:GetOwner()]:IsMinorCiv() then
								iUnit:PushMission(misTR, vCity:Plot():GetPlotIndex(), 0)
							end
						end
					end
				end
			end
		end
	end
end

function CheckCaravan(cUnit, cPlot, player)
	for i = 0, cPlot:GetNumUnits() - 1 do
		local iUnit = cPlot:GetUnit(i);
		if iUnit == cUnit then
			return true;
		end
	end
	return false;
end

function YesWeCanF(iPlayer, iUnit, iX, iY, iBuild)
	if iBuild == iMarsh then
		local plot = Map.GetPlot(iX, iY)
		plot:SetImprovementType(-1)
		plot:SetFeatureType(FeatureTypes.FEATURE_MARSH, -1)
	end
end

GameEvents.PlayerBuilt.Add(YesWeCanF)