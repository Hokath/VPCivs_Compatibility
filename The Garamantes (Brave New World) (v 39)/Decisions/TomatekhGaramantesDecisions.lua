--Tomatekh

print("Garamantes Decisions")

local uChariotArcher = GameInfoTypes.UNITCLASS_CHARIOT_ARCHER;
local uWarChariot = GameInfoTypes.UNIT_EGYPTIAN_WARCHARIOT
local bChariotRoute = GameInfoTypes.BUILDING_GARAMANTES_DECISION_DUMMY;
local uCaravan = GameInfoTypes.UNIT_CARAVAN;
local tWheel = GameInfoTypes.TECH_THE_WHEEL;

--Chariot Routes

local Decisions_GaramantesChariots = {}
	Decisions_GaramantesChariots.Name = "TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_CHARIOTS"
	Decisions_GaramantesChariots.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_CHARIOTS_DESC")
	HookDecisionCivilizationIcon(Decisions_GaramantesChariots, "CIVILIZATION_ANCIENT_LIBYA_MOD")
	Decisions_GaramantesChariots.Weight = nil
	Decisions_GaramantesChariots.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_ANCIENT_LIBYA_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_GaramantesChariots") == true then
			Decisions_GaramantesChariots.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_CHARIOTS_ENACTED_DESC")
			return false, false, true
		end		
	
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end

		if pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_RENAISSANCE"] then return true, false end
		local cChariotCheck = 0;
		for pUnit in pPlayer:Units() do
			if (pUnit:GetUnitClassType() == uChariotArcher) then
				cChariotCheck = 1;
				break
			end
		end
		if cChariotCheck <= 0 then return true, false end

		return true, true
	end
	)
	
	Decisions_GaramantesChariots.DoFunc = (
	function(pPlayer)
		local pcCity = pPlayer:GetCapitalCity();
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)

		pcCity:SetNumRealBuilding(bChariotRoute, 1)
		pUnit = pPlayer:InitUnit(uCaravan, pcCity:GetX(), pcCity:GetY(), UNITAI_TRADE_UNIT);

		save(pPlayer, "Decisions_GaramantesChariots", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_ANCIENT_LIBYA_MOD"], "Decisions_GaramantesChariots", Decisions_GaramantesChariots)

--Cave Dwellers

local Decisions_GaramantesCaveDwellers = {}
	Decisions_GaramantesCaveDwellers.Name = "TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_CAVE_DWELLERS"
	Decisions_GaramantesCaveDwellers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_CAVE_DWELLERS_DESC")
	HookDecisionCivilizationIcon(Decisions_GaramantesCaveDwellers, "CIVILIZATION_ANCIENT_LIBYA_MOD")
	Decisions_GaramantesCaveDwellers.Weight = nil
	Decisions_GaramantesCaveDwellers.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_ANCIENT_LIBYA_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_GaramantesCaveDwellers") == true then
			Decisions_GaramantesCaveDwellers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_CAVE_DWELLERS_ENACTED_DESC")
			return false, false, true
		end		

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_MEDIEVAL"] then return true, false end

		return true, true
	end
	)
	
	Decisions_GaramantesCaveDwellers.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_GARAMANTES_CAVE_DWELLERS_MOD"], true)

		local pTeam = pPlayer:GetTeam();
		local pcCity = pPlayer:GetCapitalCity();
		if (Teams[pTeam]:IsHasTech(tWheel)) then 
			pUnit = pPlayer:InitUnit(uWarChariot, pcCity:GetX(), pcCity:GetY(), UNITAI_RANGED);
			pUnit:JumpToNearestValidPlot();
		end

		save(pPlayer, "Decisions_GaramantesCaveDwellers", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_ANCIENT_LIBYA_MOD"], "Decisions_GaramantesCaveDwellers", Decisions_GaramantesCaveDwellers)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) then
			if load(pPlayer, "Decisions_GaramantesChariots") == true then
				for pCity in pPlayer:Cities() do
					if pCity:IsCapital() then
						if not (pCity:GetNumBuilding(bChariotRoute) > 0) then
							pCity:SetNumRealBuilding(bChariotRoute, 1);
						end
					end
				end
			end
		end
	end
end)

local iTechWheel = GameInfo.Technologies["TECH_THE_WHEEL"].ID

GameEvents.TeamSetHasTech.Add(
function(iTeam, iTech, bAdopted) 
	if (iTech == iTechWheel) then
		local gPlayer = 0;
		local pTeam = 0;
		for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local pPlayer = Players[iPlayer]
			if (pPlayer:IsAlive()) then
				if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) then
					gPlayer = pPlayer;
					pTeam = pPlayer:GetTeam();
				end
			end
		end
		if pTeam == iTeam then
			if load(gPlayer, "Decisions_GaramantesCaveDwellers") == true then
				local pcCity = gPlayer:GetCapitalCity();
				pUnit = gPlayer:InitUnit(uWarChariot, pcCity:GetX(), pcCity:GetY(), UNITAI_RANGED);
				pUnit:JumpToNearestValidPlot();
			end
		end
	end
end)