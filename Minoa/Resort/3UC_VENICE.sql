-- Buildings
------------------------------	
INSERT INTO Buildings 	
	(Type, BuildingClass, LandmarksTourismPercent, GreatWorksTourismModifier, GreatWorkSlotType, GreatWorkCount,  Cost, FreeStartEra, Happiness, NeverCapture, GoldMaintenance, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier, Help, Description, Civilopedia, Strategy, IconAtlas, PortraitIndex)
SELECT	'BUILDING_3UC_CANALS', BuildingClass, '25', '25', GreatWorkSlotType, GreatWorkCount,  Cost, FreeStartEra, Happiness, 'true', GoldMaintenance, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,  'TXT_KEY_BUILDING_3UC_CANALS_HELP','TXT_KEY_BUILDING_3UC_CANALS', 'TXT_KEY_BUILDING_3UC_CANALS_TEXT', 'TXT_KEY_BUILDING_3UC_CANALS_STRATEGY', 'ATLAS_VENICE_CALAL', 0
FROM Buildings WHERE Type = 'BUILDING_HOTEL';	

------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_3UC_CANALS',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_HOTEL';

------------------------------	
-- Building_ResourceQuantityRequirements
------------------------------
INSERT INTO Building_ResourceQuantityRequirements 	
			(BuildingType, ResourceType, Cost)
SELECT 'BUILDING_3UC_CANALS', ResourceType, Cost
FROM Building_ResourceQuantityRequirements WHERE BuildingType = 'BUILDING_HOTEL';

------------------------------	
-- Building_YieldModifiers
------------------------------
INSERT INTO Building_YieldChanges 	
			(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_3UC_CANALS', 'YIELD_GOLD', '3'),
	('BUILDING_3UC_CANALS', 'YIELD_TOURISM', '3'),
	('BUILDING_3UC_CANALS', 'YIELD_FOOD', '3');


INSERT INTO Building_YieldPerXTerrainTimes100
			(BuildingType, TerrainType, YieldType, Yield)
VALUES
	('BUILDING_3UC_CANALS', 'TERRAIN_COAST', 'YIELD_TOURISM', '50'),
	('BUILDING_3UC_CANALS', 'TERRAIN_COAST', 'YIELD_GOLD', '50');

--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_MINOAN_LS_MOD',	'BUILDINGCLASS_HOTEL',	'BUILDING_3UC_CANALS');


