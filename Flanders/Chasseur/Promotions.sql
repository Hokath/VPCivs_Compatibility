--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 									Description, 								Help, 												Sound, 				CannotBeChosen, LostWithUpgrade,	AlwaysHeal, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_MORI_CHASSEUR', 			'TXT_KEY_PROMOTION_MORI_CHASSEUR',			'TXT_KEY_PROMOTION_MORI_CHASSEUR_HELP', 			'AS2D_IF_LEVELUP', 	1, 				1, 					0, 			2, 			'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_MORI_CHASSEUR'),
			('PROMOTION_MORI_CHASSEUR_MARCH', 		'TXT_KEY_PROMOTION_MORI_CHASSEUR_MARCH',	'TXT_KEY_PROMOTION_MORI_CHASSEUR_MARCH_HELP', 		'AS2D_IF_LEVELUP', 	1, 				1, 					1, 			31, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_MORI_CHASSEUR_MARCH');
