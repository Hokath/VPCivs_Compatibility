--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, AllowsProductionTradeRoutes,	SpecialistType, SpecialistCount,	BuildingClass,				GoldMaintenance,	Cost,		PrereqTech,		ArtInfoCulturalVariation, Description,							Help,										Civilopedia,										Strategy,										ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	IconAtlas,				ConquestProb, 	PortraitIndex)
SELECT		('BUILDING_MORI_LACE_MAKER'), 'true', SpecialistType, SpecialistCount,	('BUILDINGCLASS_WORKSHOP'),	GoldMaintenance,					Cost,		'TECH_ECONOMICS',		ArtInfoCulturalVariation, ('TXT_KEY_BUILDING_MORI_LACE_MAKER'),	('TXT_KEY_BUILDING_MORI_LACE_MAKER_HELP'),	('TXT_KEY_CIV5_BUILDINGS_MORI_LACE_MAKER_TEXT'),	('TXT_KEY_BUILDING_MORI_LACE_MAKER_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	('MORI_HAINAUT_ATLAS'),	ConquestProb, 	2	
FROM Buildings WHERE Type = 'BUILDING_THEATRE';

INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_MORI_LACE_MAKER', 'BUILDINGCLASS_FORGE');
--==========================================================================================================================	
-- Building_ResourceQuantity
--==========================================================================================================================					
--INSERT INTO Building_ResourceQuantity 	
--			(BuildingType, 					ResourceType, 			Quantity)
--VALUES		('BUILDING_MORI_LACE_MAKER',	'RESOURCE_MORI_LACE',	1);

--INSERT INTO Building_ResourcePlotsToPlace
--	(BuildingType, 	ResourceType, NumPlots)
--VALUES
--	('BUILDING_MORI_LACE_MAKER', 'RESOURCE_MORI_LACE', '1');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================					
INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_MORI_LACE_MAKER', 'FEATURE_MARSH', 'YIELD_PRODUCTION', 1),
	('BUILDING_MORI_LACE_MAKER', 'FEATURE_FOREST', 'YIELD_PRODUCTION', 1),
	('BUILDING_MORI_LACE_MAKER', 'FEATURE_MARSH', 'YIELD_GOLD', 1),
	('BUILDING_MORI_LACE_MAKER', 'FEATURE_FOREST', 'YIELD_GOLD', 1);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MORI_LACE_MAKER', 'YIELD_PRODUCTION', 2);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================					
INSERT INTO Building_Flavors
			(BuildingType, 					FlavorType, Flavor)
SELECT		('BUILDING_MORI_LACE_MAKER'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_WORKSHOP';
--==========================================================================================================================	
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_FLANDERS_LS_MOD', 	'BUILDINGCLASS_THEATRE',		'BUILDING_MORI_LACE_MAKER');