print ("One thousand nights")

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_DURRANI_LS_MOD then
			include("Durrani Civ Related")
			break;
		end
	end
end