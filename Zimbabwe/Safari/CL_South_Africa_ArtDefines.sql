--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_ZIMBABWE_LS_MOD', 	'BUILDINGCLASS_THEATRE',	'BUILDING_ZIM_SAFARI_PARK');
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('CL_SOUTH_AFRICA_ATLAS', 					256, 		'South_Africa_IconAtlas256.dds',			2, 				2),
		('CL_SOUTH_AFRICA_ATLAS', 					128, 		'South_Africa_IconAtlas128.dds',			2, 				2),
		('CL_SOUTH_AFRICA_ATLAS', 					80, 		'South_Africa_IconAtlas80.dds',				2, 				2),
		('CL_SOUTH_AFRICA_ATLAS', 					64, 		'South_Africa_IconAtlas64.dds',				2, 				2),
		('CL_SOUTH_AFRICA_ATLAS', 					45, 		'South_Africa_IconAtlas45.dds',				2, 				2),
		('CL_SOUTH_AFRICA_ATLAS', 					32, 		'South_Africa_IconAtlas32.dds',				2, 				2),
		('CL_SOUTH_AFRICA_RESOURCES_ATLAS', 		256, 		'South_Africa_IconAtlas_resources256.dds',	3, 				1),
		('CL_SOUTH_AFRICA_RESOURCES_ATLAS', 		128, 		'South_Africa_IconAtlas_resources128.dds',	3, 				1),
		('CL_SOUTH_AFRICA_RESOURCES_ATLAS', 		80, 		'South_Africa_IconAtlas_resources80.dds',	3, 				1),
		('CL_SOUTH_AFRICA_RESOURCES_ATLAS', 		64, 		'South_Africa_IconAtlas_resources64.dds',	3, 				1),
		('CL_SOUTH_AFRICA_RESOURCES_ATLAS', 		45, 		'South_Africa_IconAtlas_resources45.dds',	3, 				1),
		('CL_SOUTH_AFRICA_RESOURCES_ATLAS', 		32, 		'South_Africa_IconAtlas_resources32.dds',	3, 				1),
		('CL_SOUTH_AFRICA_ALPHA_ATLAS', 			128, 		'South_Africa_AlphaIconAtlas128.dds',		1,				1),
		('CL_SOUTH_AFRICA_ALPHA_ATLAS', 			80, 		'South_Africa_AlphaIconAtlas80.dds',		1, 				1),
		('CL_SOUTH_AFRICA_ALPHA_ATLAS', 			64, 		'South_Africa_AlphaIconAtlas64.dds',		1, 				1),
		('CL_SOUTH_AFRICA_ALPHA_ATLAS', 			48, 		'South_Africa_AlphaIconAtlas48.dds',		1, 				1),
		('CL_SOUTH_AFRICA_ALPHA_ATLAS', 			45, 		'South_Africa_AlphaIconAtlas45.dds',		1, 				1),
		('CL_SOUTH_AFRICA_ALPHA_ATLAS', 			32, 		'South_Africa_AlphaIconAtlas32.dds',		1, 				1),
		('CL_SOUTH_AFRICA_ALPHA_ATLAS', 			24, 		'South_Africa_AlphaIconAtlas24.dds',		1, 				1),
		('CL_SOUTH_AFRICA_ALPHA_ATLAS', 			16, 		'South_Africa_AlphaIconAtlas16.dds',		1, 				1),
		('CL_SOUTH_AFRICA_FENGU_GUNNER_FLAG', 		32, 		'South_Africa_FenguGunner_Flag.dds',		1, 				1);
--==========================================================================================================================
-- IconFontTextures
--==========================================================================================================================
INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_SOUTH_AFRICA_RESOURCES', 	'South_Africa_Resources_fonticon');
--==========================================================================================================================
-- IconFontMapping
--==========================================================================================================================
INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,							IconMapping)
VALUES	('ICON_RES_ZIM_LION', 							'ICON_FONT_TEXTURE_SOUTH_AFRICA_RESOURCES',	3),
		('ICON_RES_ZIM_RHINO', 							'ICON_FONT_TEXTURE_SOUTH_AFRICA_RESOURCES',	2),
		('ICON_RES_ZIM_SPRINGBOK', 						'ICON_FONT_TEXTURE_SOUTH_AFRICA_RESOURCES',	1);