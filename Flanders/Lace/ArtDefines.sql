-- Resources
------------------------------	
INSERT INTO Resources 
			(Type,	IsMonopoly, ArtDefineTag,				Description,		Help,				Civilopedia, 							ResourceClassType, 		Happiness,  AITradeModifier, 	ResourceUsage,	AIObjective,	'Unique', 	IconString, 			PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_MORI_LACE', '1', 'ART_DEF_IMPROVEMENT_TRADING_POST4',	'TXT_KEY_RESOURCE_MORI_LACE', 'TXT_KEY_RESOURCE_MORI_LACE_HELP',		'TXT_KEY_CIV5_RESOURCE_MORI_LACE_TEXT',	'RESOURCECLASS_LUXURY',	4,			10,					2, 				0, 				2, 			'[ICON_RES_MORI_LACE]',	3, 				'MORI_HAINAUT_ATLAS');
------------------------------
-- IconFontTextures
------------------------------
INSERT INTO IconFontTextures 
			(IconFontTexture, 					IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_MORI_LACE', 	'LaceFontIcons_22');
------------------------------
-- IconFontMapping
------------------------------
INSERT INTO IconFontMapping 
			(IconName, 				IconFontTexture,				IconMapping)
VALUES		('ICON_RES_MORI_LACE',	'ICON_FONT_TEXTURE_MORI_LACE',	1);

INSERT INTO Improvement_ResourceTypes
	(ImprovementType, ResourceType)
VALUES
	('IMPROVEMENT_LS_FLANDERS_COMMUNE', 'RESOURCE_MORI_LACE');

INSERT INTO Resource_CityYieldModFromMonopoly
	(ResourceType, YieldType, Yield)
VALUES
	('RESOURCE_MORI_LACE', 'YIELD_GOLD', '10');

INSERT INTO Corporation_ResourceMonopolyOrs
	(CorporationType, ResourceType)
VALUES
	('CORPORATION_GIORGIO_ARMEIER', 'RESOURCE_MORI_LACE');

INSERT INTO Corportation_ResourceYieldChanges
	(CorportationType, ResourceType, YieldType, Yield)
VALUES
	('CORPORATION_GIORGIO_ARMEIER', 'RESOURCE_MORI_LACE', 'YIELD_CULTURE', 1);

INSERT INTO Resource_TerrainBooleans
	(ResourceType, TerrainType)
VALUES
	('RESOURCE_MORI_LACE', 'TERRAIN_GRASS');

INSERT INTO Resource_FeatureBooleans
	(ResourceType, FeatureType)
VALUES
	('RESOURCE_MORI_LACE', 'FEATURE_MARSH');