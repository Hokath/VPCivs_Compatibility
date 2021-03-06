--==========================================================================================================================
-- Civilization_JFD_CultureTypes
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag);

INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,	ArtDefineTag,		CultureType,			SplashScreenTag,		SoundtrackTag)
VALUES		('CIVILIZATION_MINOAN_LS_MOD', '_JFD_CLASSICAL', 'CULTURE_JFD_CLASSICAL', 'JFD_Classical', 'JFD_Classical');
--==========================================================================================================================
--==========================================================================================================================

--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================			
INSERT INTO Diplomacy_Responses 
			(LeaderType, 				ResponseType, 											Response, 																		Bias)
VALUES		('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_FIRST_GREETING', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_FIRSTGREETING%', 									2),	
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_DEFEATED', 									'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DEFEATED%', 										2),	
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_REPEAT_TOO_MUCH', 					'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_REPEAT_TOO_MUCH%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_REPEAT_TRADE_TOO_MUCH', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_REPEAT_TRADE_TOO_MUCH%', 							2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_HOSTILE_REPEAT', 					'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_REPEAT_TOO_MUCH%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_HOSTILE_HELLO', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_HOSTILE_HELLO%', 						2),	
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_POLITE_HELLO', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_POLITE_HELLO%', 							2),	
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_HOSTILE_HUMAN_AT_WAR', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_HOSTILE_HUMAN_AT_WAR%', 					2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_HUMAN_AT_WAR', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_HUMAN_AT_WAR%', 							2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 		'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 			2),	
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_AGGRESSIVE_MILITARY', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_AGGRESSIVE_MILITARY_WARNING%', 					2),	
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_HOSTILE_AGGRESSIVE_PLOT_BUYING', 	'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_HOSTILE_AGGRESSIVE_PLOT_BUYING%', 		2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_AGGRESSIVE_PLOT_BUYING', 			'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_AGGRESSIVE_PLOT_BUYING%', 				2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_HOSTILE_AGGRESSIVE_EXPANSION', 		'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_HOSTILE_AGGRESSIVE_EXPANSION%', 			2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_AGGRESSIVE_EXPANSION', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_AGGRESSIVE_EXPANSION%', 					2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_FRIENDLY_STRONG_MILITARY', 			'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_FRIENDLY_STRONG_MILITARY%', 				2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_FRIENDLY_STRONG_ECONOMY', 			'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_FRIENDLY_STRONG_ECONOMY%', 				2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_HOSTILE_HUMAN_FEW_CITIES', 			'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_HOSTILE_HUMAN_FEW_CITIES%', 				2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_HOSTILE_HUMAN_SMALL_ARMY', 			'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_HOSTILE_HUMAN_SMALL_ARMY%', 				2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_GREETING_HOSTILE_HUMAN_IS_WARMONGER', 		'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GREETING_HOSTILE_HUMAN_IS_WARMONGER%', 			2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_TOO_SOON_FOR_DOF', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_TOO_SOON_FOR_DOF%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_RESPONSE_TO_BEING_DENOUNCED%', 					2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_WORK_AGAINST_SOMEONE', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DENOUNCE%', 										2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_AI_DOF_BACKSTAB', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DENOUNCE%', 										2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_RESPONSE_TO_BEING_DENOUNCED%', 					2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_DOFED_FRIEND', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_HUMAN_DOFED_FRIEND%', 							2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_DOFED_ENEMY', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_HUMAN_DOFED_ENEMY%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_DENOUNCED_ENEMY', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_HUMAN_DENOUNCED_ENEMY%', 							2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_DENOUNCED_FRIEND', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_HUMAN_DENOUNCED_FRIEND%', 						2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_DOF_SO_AI_DOF', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_HUMAN_DOF_SO_AI_DOF%', 							2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_DENOUNCE_SO_AI_DENOUNCE', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_HUMAN_DENOUNCE_SO_AI_DENOUNCE%', 					2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_DOF_SO_AI_DENOUNCE', 					'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_HUMAN_DOF_SO_AI_DENOUNCE%', 						2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_COOP_WAR_REQUEST', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_COOP_WAR_REQUEST%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_COOP_WAR_TIME', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_COOP_WAR_TIME%', 									2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_WORK_WITH_US', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DEC_FRIENDSHIP%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_PLOT_BUYING_WARNING', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_PLOT_BUYING_WARNING%', 							2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_PLOT_BUYING_SERIOUS_WARNING%', 					2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_EXPANSION_SERIOUS_WARNING', 					'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_EXPANSION_SERIOUS_WARNING%', 						2),	
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_EXPANSION_WARNING', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_EXPANSION_WARNING%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_AGGRESSIVE_MILITARY_WARNING', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_AGGRESSIVE_MILITARY_WARNING%', 					2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_INSULT_UNHAPPINESS', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_INSULT_UNHAPPINESS%', 							2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_INSULT_CITIES', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_INSULT_CITIES%', 									2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_INSULT_BULLY', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_INSULT_BULLY%', 									2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_INSULT_MILITARY', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_INSULT_MILITARY%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_INSULT_GENERIC', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_INSULT_JFD_LOUIS_XIV%', 							2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_INSULT_CULTURE', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_INSULT_CULTURE%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_INSULT_POPULATION', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_INSULT_POPULATION%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_RETURNED_CIVILIAN', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_CIVILIAN%', 										2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_DECLARATION_PROTECT_CITY_STATE', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DECLARATION_PROTECT_CITY_STATE%', 				2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_DECLARATION_ABANDON_CITY_STATE', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DECLARATION_ABANDON_CITY_STATE%', 				2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_DONT_SETTLE_YES', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DONT_SETTLE_YES%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_DONT_SETTLE_NO', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DONT_SETTLE_NO%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_LUXURY_TRADE', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_LUXURY_TRADE%', 									2),	
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_OPEN_BORDERS_EXCHANGE', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_OPEN_BORDERS_EXCHANGE%', 							2),	
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_REQUEST', 									'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_RESPONSE_REQUEST%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_ATTACKED_HOSTILE', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_ATTACKED_HOSTILE%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_ATTACKED_WEAK_HOSTILE', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_ATTACKED_HOSTILE%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_ATTACKED_STRONG_HOSTILE', 					'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_ATTACKED_HOSTILE%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_ATTACKED_EXCITED', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_ATTACKED_EXCITED%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_ATTACKED_WEAK_EXCITED', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_ATTACKED_EXCITED%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_ATTACKED_STRONG_EXCITED', 					'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_ATTACKED_EXCITED%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_ATTACKED_SAD', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_ATTACKED_SAD%', 									2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_ATTACKED_BETRAYED', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_ATTACKED_BETRAYED%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_DOW_GENERIC', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DOW_GENERIC%', 									2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_DOW_LAND', 									'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DOW_LAND%', 										2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_DOW_WORLD_CONQUEST', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DOW_WORLD_CONQUEST%', 							2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_DOW_OPPORTUNITY', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DOW_OPPORTUNITY%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_DOW_DESPERATE', 								'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_DOW_DESPERATE%', 									2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_TOO_SOON_NO_PEACE', 							'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_TOO_SOON_NO_PEACE%', 								2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING_GOOD',	'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GOOD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_AGGRESSIVE_MILITARY_WARNING_BAD',				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GOOD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HOSTILE_WE_ATTACKED_MINOR_BAD',				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GOOD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_WE_ATTACKED_MINOR_BAD',						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_GOOD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING_BAD', 	'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_ATTACKED_MINOR_BAD', 					'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_SERIOUS_EXPANSION_WARNING_BAD', 		'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_SERIOUS_PLOT_BUYING_WARNING_BAD', 		'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_PLOT_BUYING_WARNING_BAD', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_AGGRESSIVE_MILITARY_WARNING_GOOD', 			'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HOSTILE_WE_ATTACKED_MINOR_GOOD', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_WE_ATTACKED_MINOR_GOOD', 						'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_ATTACKED_MINOR_GOOD', 					'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_SERIOUS_EXPANSION_WARNING_GOOD', 		'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_SERIOUS_PLOT_BUYING_WARNING_GOOD', 		'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2),
			('LEADER_MINOAN_LS_MOD_MINOS', 	'RESPONSE_HUMAN_PLOT_BUYING_WARNING_GOOD', 				'TXT_KEY_LEADER_MINOAN_LS_MOD_MINOS_BAD%', 											2);		
--==========================================================================================================================			
--==========================================================================================================================						