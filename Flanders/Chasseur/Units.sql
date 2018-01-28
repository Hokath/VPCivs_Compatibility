--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Type, BaseLandAirDefense, 							PrereqTech, Class, Combat,	Cost, Moves, 	FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 					Civilopedia, 							Help, 									Strategy,									ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MORI_CHASSEUR'),	'8',		PrereqTech, Class, Combat+3,	Cost, Moves+1,	FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI, ('TXT_KEY_UNIT_MORI_CHASSEUR'), 	('TXT_KEY_CIV5_MORI_CHASSEUR_TEXT'), 	('TXT_KEY_UNIT_MORI_CHASSEUR_HELP'), 	('TXT_KEY_UNIT_MORI_CHASSEUR_STRATEGY'),	ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_MORI_CHASSEUR'),  	0,					('MORI_UNIT_FLAG_CHASSEUR_ATLAS'),	MoveRate,	2, 				('MORI_LUXEMBOURG_ATLAS')
FROM Units WHERE (Type = 'UNIT_INFANTRY');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MORI_CHASSEUR'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_MORI_CHASSEUR'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,			Flavor)
VALUES		('UNIT_MORI_CHASSEUR', 	'FLAVOR_OFFENSE',	12),
			('UNIT_MORI_CHASSEUR', 	'FLAVOR_DEFENSE',	20);
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions
			(UnitType, 				PromotionType)
VALUES		('UNIT_MORI_CHASSEUR', 	'PROMOTION_MORI_CHASSEUR');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_MORI_CHASSEUR'), 		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================	
--==========================================================================================================================	

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_MORI_CHASSEUR','BUILDINGCLASS_MILITARY_ACADEMY'; 
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_FLANDERS_LS_MOD',	'UNITCLASS_INFANTRY',	'UNIT_MORI_CHASSEUR');