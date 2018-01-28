print("Bull leaping")

Controls.MyButton:SetDisabled(true)
Controls.MyBackground:SetHide(true)
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "LS12MinoanArt";
local iMinoa = GameInfoTypes.CIVILIZATION_MINOAN_LS_MOD;
local Cavalry = GameInfoTypes.UNIT_LS_PENTECONTER;
local bPlayer = Players[63];
local GoodyHut = GameInfoTypes.IMPROVEMENT_GOODY_HUT;
local coastT = GameInfoTypes.TERRAIN_COAST;
local hasLeft = load(bPlayer, "LS12MinInitGH");
local selUnit = nil;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == iMinoa then
			include("Minoan Civ Related")
			break;
		end
	end
end

function IsValidfGH(fPlot)
	if fPlot:GetTerrainType() == coastT then
		if not fPlot:IsImpassable() then
			for i = 0, 5 do
				local jPlot = Map.PlotDirection(fPlot:GetX(), fPlot:GetY(), i);
				if jPlot then
					if not jPlot:IsWater() then
						return true;
					end
				end
			end
		end
	end
	return false;
end

function OnMoveMin(player, unit, x, y)
	local cUnit = Players[player]:GetUnitByID(unit);
	if cUnit then
		if cUnit:GetUnitType() == Cavalry then
			local cPlot = cUnit:GetPlot();
			if cPlot then
				if load(cPlot, "LS12MinGHon") then
					local iLeft = load(cUnit, "LS12MinUCL") or 3;
					if iLeft > 0 then
						save(cUnit, "LS12MinUCL", iLeft - 1)
						save(cPlot, "LS12MinGHon", nil)
						if cPlot:GetImprovementType() == -1 then
							cPlot:SetImprovementType(GoodyHut)
							cUnit:SetXY(x,y)
						end
						local bRed = load(bPlayer, "LS12MinInitGH") - 1;
						hasLeft = bRed;
						save(bPlayer, "LS12MinInitGH",bRed)
						if bRed == 0 then
							Controls.MyBackground:SetHide(true)
							Events.UnitSelectionChanged.Remove(Selection)
							GameEvents.UnitSetXY.Remove(OnMoveMin)
						elseif selUnit then
							if iLeft == 1 then
								selUnit = nil;
								Controls.MyBackground:SetHide(true)
							else
								Controls.MyButton:SetText((iLeft-1))
								Controls.MyButton:LocalizeAndSetToolTip("Can found [COLOR_POSITIVE_TEXT]" .. (iLeft - 1) .. "[ENDCOLOR] more hidden Ancient Ruins.[NEWLINE][NEWLINE]Hidden Ancient Ruins left: [COLOR_POSITIVE_TEXT]" .. hasLeft .. "[ENDCOLOR].")
							end
						end
					end
				end
			end
		end
	end
end

function Selection(player, unitID, x, y, a5, bool)
	Controls.MyBackground:SetHide(true)
	selUnit = nil;
	if bool then
		local cUnit = Players[player]:GetUnitByID(unitID);
		if cUnit:GetUnitType() == Cavalry then
			local iLeft = load(cUnit, "LS12MinUCL") or 3;
			if iLeft ~= 0 then
				selUnit = cUnit;
				Controls.MyBackground:SetHide(false)
				Controls.MyButton:SetText((iLeft))
				Controls.MyButton:LocalizeAndSetToolTip("Can found [COLOR_POSITIVE_TEXT]" .. (iLeft) .. "[ENDCOLOR] more hidden Ancient Ruins.[NEWLINE][NEWLINE]Hidden Ancient Ruins left: [COLOR_POSITIVE_TEXT]" .. hasLeft .. "[ENDCOLOR].")
			end
		end
	end
end

Events.SequenceGameInitComplete.Add(function()
	local prLVP = load(bPlayer, "LS12MinInitGH")
	if prLVP == nil then
		local GHc = 0;
		local VWp = 0;
		local ValidP = {}
		for i = 0, Map:GetNumPlots() - 1, 1 do
			local fPlot = Map.GetPlotByIndex( i );
			if fPlot:GetImprovementType() == GoodyHut then
				GHc = GHc + 1;
			elseif IsValidfGH(fPlot) then
				VWp = VWp + 1;
				ValidP[VWp] = fPlot;
			end
		end
		local numNGH = math.min(math.floor(GHc /2), math.floor(VWp / 18));
		save(bPlayer, "LS12MinInitGH",numNGH)
		hasLeft = numNGH;
		if numNGH > 0 then
			local iHelp = 0;
			while numNGH > iHelp do
				local nInt = math.random(1, VWp);
				local nPlot = ValidP[nInt];
				if load(nPlot, "LS12MinGHon") == nil then
					save(nPlot, "LS12MinGHon", 1)
					iHelp = iHelp + 1;
				end
			end
			GameEvents.UnitSetXY.Add(OnMoveMin)
			Events.UnitSelectionChanged.Add( Selection );	
		end
	elseif prLVP > 0 then
		GameEvents.UnitSetXY.Add(OnMoveMin)
		Events.UnitSelectionChanged.Add( Selection );	
	end
end)
