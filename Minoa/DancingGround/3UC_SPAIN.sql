-- Buildings
------------------------------	
INSERT INTO Buildings 	
	(Type, BuildingClass, TrainedFreePromotion, Cost, FreeStartEra, Happiness, NeverCapture, GoldMaintenance, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier, Help, Description, Civilopedia, Strategy, IconAtlas, PortraitIndex)
SELECT	'BUILDING_3UC_BULLRING', BuildingClass, TrainedFreePromotion, Cost, FreeStartEra, Happiness, NeverCapture, 0, 'TECH_CHIVALRY', ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier, 'TXT_KEY_BUILDING_3UC_BULLRING_HELP', 'TXT_KEY_BUILDING_3UC_BULLRING', 'TXT_KEY_BUILDING_3UC_BULLRING_TEXT', 'TXT_KEY_BUILDING_3UC_BULLRING_STRATEGY', 'ICON_ATLAS', 36
FROM Buildings WHERE Type = 'BUILDING_CHANCERY';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_3UC_BULLRING',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CHANCERY';
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_3UC_BULLRING',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_CHANCERY';
------------------------------	
-- Building_ResourceYieldChanges
------------------------------		
INSERT INTO Building_ResourceYieldChanges	
		(BuildingType, 		ResourceType, 		YieldType, Yield)
VALUES 
	('BUILDING_3UC_BULLRING', 'RESOURCE_COW','YIELD_CULTURE', 1),
	('BUILDING_3UC_BULLRING', 'RESOURCE_COW','YIELD_FAITH', 2);

------------------------------	
-- Building_ResourceQuantityRequirements
------------------------------
INSERT INTO Building_ResourceQuantityRequirements 	
			(BuildingType, ResourceType, Cost)
SELECT 'BUILDING_3UC_BULLRING', ResourceType, Cost
FROM Building_ResourceQuantityRequirements WHERE BuildingType = 'BUILDING_CHANCERY';

------------------------------	
-- Building_YieldModifiers
------------------------------
INSERT INTO Building_YieldModifiers 	
			(BuildingType, YieldType, Yield)
SELECT 'BUILDING_3UC_BULLRING', YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_CHANCERY';


INSERT INTO Building_UnitCombatProductionModifiers
			(BuildingType, UnitCombatType, Modifier)
SELECT 'BUILDING_3UC_BULLRING', UnitCombatType, Modifier
FROM Building_UnitCombatProductionModifiers WHERE BuildingType = 'BUILDING_CHANCERY';

INSERT INTO Building_YieldPerFriend
			(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_3UC_BULLRING', 'YIELD_GOLD', 1),
	('BUILDING_3UC_BULLRING', 'YIELD_TOURISM', 1);

INSERT INTO Building_YieldPerAlly
			(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_3UC_BULLRING', 'YIELD_PRODUCTION', 2),
	('BUILDING_3UC_BULLRING', 'YIELD_CULTURE', 2);

INSERT INTO Building_ResourcePlotsToPlace
			(BuildingType, ResourceType, NumPlots)
VALUES
	('BUILDING_3UC_BULLRING', 'RESOURCE_COW', 1);
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_MINOAN_LS_MOD',	'BUILDINGCLASS_CHANCERY',	'BUILDING_3UC_BULLRING');


