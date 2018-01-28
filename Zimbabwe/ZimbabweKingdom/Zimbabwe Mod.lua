print ("Great Zimbabwe")

Controls.MyBackground2:SetHide(true)

local ZimbCiv = GameInfoTypes.CIVILIZATION_ZIMBABWE_LS_MOD;
local PikemanID = GameInfoTypes.UNITCLASS_PIKEMAN;
local RozwiID = GameInfoTypes.UNIT_LS_ROZWI_WARRIOR;
local RozwiProm = {}
RozwiProm[0] = GameInfoTypes.PROMOTION_ZIMMERUSED_MOD0;
RozwiProm[1] = GameInfoTypes.PROMOTION_ZIMMERUSED_MOD1;
RozwiProm[2] = GameInfoTypes.PROMOTION_ZIMMERUSED_MOD2;
RozwiProm[3] = GameInfoTypes.PROMOTION_ZIMMERUSED_MOD3;
RozwiProm[4] = GameInfoTypes.PROMOTION_ZIMMERUSED_MOD4;
RozwiProm[5] = GameInfoTypes.PROMOTION_ZIMMERUSED_MOD5;


for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == ZimbCiv then
			include("Zimbabwe Civ Related")
			break;
		end
	end
end

function CheckFor(iPlayer)
	if Players[iPlayer]:GetUnitClassCount(PikemanID) then
		local numB = nil;
		for iUnit in Players[iPlayer]:Units() do
			if iUnit:GetUnitType() == RozwiID then
				if numB == nil then
					numB = GetNumTrade(iPlayer);
				end
				for i = 0, 5 do
					iUnit:SetHasPromotion(RozwiProm[i], (i == numB));
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(CheckFor)
Events.AIProcessingEndedForPlayer.Add(CheckFor)

function GetNumTrade(iPlayer)
	local Ret = 0;
	for i,v in ipairs(Players[iPlayer]:GetTradeRoutes()) do
		Ret = Ret + 1;
	end
	return math.min(Ret, 5);
end