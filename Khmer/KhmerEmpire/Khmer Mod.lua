print ("Angkor Trait Mod")

local khmer = GameInfoTypes.CIVILIZATION_KHMER_LS_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == khmer then
			include("Khmer Civ Related")
			break;
		end
	end
end

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

function DJSH_KhmerPlantationBonusRes (playerID, plotX, plotY, improvementID) 
	local pPlot = Map.GetPlot(plotX, plotY)
	local improvementID = pPlot:GetImprovementType()
	local Owner = pPlot:GetOwner()
	local player = Players[Owner];
	if (player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_KHMER_LS_MOD"] and player:IsAlive()) then
		if improvementID == GameInfoTypes.IMPROVEMENT_FARM then
			if pPlot:IsFreshWater() and not pPlot:IsImprovementPillaged() then
				if JFD_GetRandom(1,100) <= 25 then
					if pPlot:GetResourceType() == -1 then
						pPlot:SetResourceType(GameInfoTypes["RESOURCE_FA_RICE"], 1)
						if player:IsHuman() then
							Events.GameplayAlertMessage(Locale.ConvertTextKey("Citizens found suitable arable land for [ICON_RES_FA_RICE] [COLOR_POSITIVE_TEXT]Rice[ENDCOLOR] cultivation!"))
						end
					end
				end
			end
		end
	end
end
GameEvents.BuildFinished.Add(DJSH_KhmerPlantationBonusRes)