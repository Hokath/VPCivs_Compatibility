--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,	PovertyHappinessChange, 	BuildingClass,		PrereqTech,			EnhancedYieldTech,	NeverCapture,	Cost,	GoldMaintenance,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Description,						Help,									Strategy,									Civilopedia,								ArtDefineTag,						MinAreaSize) 
SELECT 'BUILDING_FA_SHALEPLANT', '30',	'BUILDINGCLASS_COAL_PLANT',	'TECH_COMBUSTION',		'TECH_REFRIGERATION',		1,				1200,	5,					0,					'FA_UB_ATLAS',		11,				'TXT_KEY_BUILDING_FA_SHALEPLANT',	'TXT_KEY_BUILDING_FA_SHALEPLANT_HELP',	'TXT_KEY_BUILDING_FA_SHALEPLANT_STRATEGY',	'TXT_KEY_BUILDING_FA_SHALEPLANT_TEXT',	'ART_DEF_BUILDING_HYDRO_PLANT',		-1;

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_SHALEPLANT',					'YIELD_PRODUCTION',		3;

--------------------------------------------------------------------------------------------------
--Building, City Yield Modifiers
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_SHALEPLANT',					'YIELD_PRODUCTION',		15;

--------------------------------------------------------------------------------------------------
--Building Tech Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_TechEnhancedYieldChanges (BuildingType,	YieldType,			Yield)
SELECT 'BUILDING_FA_SHALEPLANT',								'YIELD_GOLD',	5;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,					Flavor)
SELECT 'BUILDING_FA_SHALEPLANT',				'FLAVOR_GOLD',			15 UNION ALL
SELECT 'BUILDING_FA_SHALEPLANT',				'FLAVOR_PRODUCTION',		60;

--------------------------------------------------------------------------------------------------
--Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,				BuildingType)
SELECT 'CIVILIZATION_ANCIENT_LIBYA_MOD',  'BUILDINGCLASS_COAL_PLANT',	'BUILDING_FA_SHALEPLANT';

--------------------------------------------------------------------------------------------------
--Building Resource Production
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantity (BuildingType,	ResourceType,		Quantity)
VALUES 
	('BUILDING_FA_SHALEPLANT', 'RESOURCE_OIL',		2),
	('BUILDING_FA_SHALEPLANT', 'RESOURCE_COAL',		3);

INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_FA_SHALEPLANT', 'RESOURCE_OIL', 'YIELD_GOLD', '2'),
	('BUILDING_FA_SHALEPLANT', 'RESOURCE_OIL', 'YIELD_SCIENCE', '2'),
	('BUILDING_FA_SHALEPLANT', 'RESOURCE_OIL', 'YIELD_PRODUCTION', '2');