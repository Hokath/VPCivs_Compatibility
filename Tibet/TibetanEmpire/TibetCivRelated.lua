print("Tibet Civ Related")

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "LS8TIBETUA";
local TibetID = GameInfoTypes.CIVILIZATION_TIBET_LS_MOD;
local GhantaID = GameInfoTypes.BUILDINGCLASS_SHRINE;
local FaithID = YieldTypes.YIELD_FAITH;
local ZIBPDT = GameInfoTypes.IMPROVEMENT_LS_IBPDT_T;
local Policy = GameInfoTypes.POLICY_TIBET_LS_DUM;
local ScytUUPP = 0;
local ZimbPPT = 63;

function TibetCore(iPlayer)	
	if Players[ScytUUPP]:GetCivilizationType() == TibetID then
		CultureGA(ScytUUPP, true)
	end
	if Players[iPlayer]:GetCivilizationType() == TibetID then
		CultureGA(iPlayer, false)
	end
	ScytUUPP = iPlayer;
	ZimbPPT:ChangeImprovementYieldChange(ZIBPDT, FaithID, iPlayer - ZimbPPT:GetImprovementYieldChange(ZIBPDT, FaithID));
end

GameEvents.PlayerDoTurn.Add(TibetCore)

for i, player in pairs(Players) do
	if player:IsBarbarian() then
		ZimbPPT = Teams[player:GetTeam()];
		ScytUUPP = ZimbPPT:GetImprovementYieldChange(ZIBPDT, FaithID);
		break;
	end
end

function CultureGA(iPlayer, bTrue)
	local pPlayer = Players[iPlayer];
	local prevBonus = load(pPlayer, "LS8TIBCCPT") or 0;
	local nBonus = 0;
	local cFaith = pPlayer:GetTotalFaithPerTurn();
	if pPlayer:GetGoldenAgeTurns() > 0 then
		nBonus = cFaith;
	elseif bTrue then
		pPlayer:ChangeJONSCulture(cFaith);
		pPlayer:ChangeJONSCulture(-1 * cFaith);
	end
	if nBonus ~= prevBonus then
		pPlayer:ChangeJONSCulturePerTurnForFree(nBonus - prevBonus)
		save(pPlayer, "LS8TIBCCPT", nBonus)
	end
end