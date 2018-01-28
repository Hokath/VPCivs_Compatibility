-- Buildings
------------------------------	
INSERT INTO Buildings 	
	(Type, BuildingClass, TrainedFreePromotion, CitySupplyModifier,  Cost, GoldMaintenance, PrereqTech, ArtDefineTag, XBuiltTriggersIdeologyChoice, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier, Help, Description, Civilopedia, Strategy, IconAtlas, PortraitIndex)
SELECT	'BUILDING_PLATEAU_FARM', BuildingClass, 'PROMOTION_ALTITUDE_TRAINING', '10',  Cost, GoldMaintenance, PrereqTech, ArtDefineTag, XBuiltTriggersIdeologyChoice, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier, 'TXT_KEY_BUILDING_PLATEAU_FARM_HELP', 'TXT_KEY_BUILDING_PLATEAU_FARM', 'TXT_KEY_BUILDING_PLATEAU_FARM_TEXT', 'TXT_KEY_BUILDING_PLATEAU_FARM_STRATEGY', 'RICE_ATLAS', 1
FROM Buildings WHERE Type = 'BUILDING_STABLE';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_PLATEAU_FARM',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_STABLE';
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_PLATEAU_FARM',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_STABLE';
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_PLATEAU_FARM',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_STABLE';

------------------------------	
-- Building_UnitCombatProductionModifiers
------------------------------
INSERT INTO Building_UnitCombatProductionModifiers 	
			(BuildingType, UnitCombatType, Modifier)
SELECT 'BUILDING_PLATEAU_FARM', UnitCombatType, Modifier
FROM Building_UnitCombatProductionModifiers WHERE BuildingType = 'BUILDING_STABLE';

------------------------------	
-- Building_YieldModifiers
------------------------------
INSERT INTO Building_YieldModifiers 	
			(BuildingType, YieldType, Yield)
SELECT 'BUILDING_PLATEAU_FARM', YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_STABLE';

------------------------------	
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges 	
			(BuildingType, ResourceType, YieldType, Yield)
SELECT 'BUILDING_PLATEAU_FARM', ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_STABLE';

INSERT INTO Building_ResourceYieldChanges 	
			(BuildingType, ResourceType, YieldType, Yield)
VALUES  ('BUILDING_PLATEAU_FARM', 'RESOURCE_BISON', 'YIELD_PRODUCTION', 2);



INSERT INTO Building_YieldPerXTerrainTimes100
			(BuildingType, TerrainType, YieldType, Yield)
VALUES
	('BUILDING_PLATEAU_FARM', 'TERRAIN_MOUNTAIN', 'YIELD_FOOD', '50'),
	('BUILDING_PLATEAU_FARM', 'TERRAIN_MOUNTAIN', 'YIELD_CULTURE', '50');


