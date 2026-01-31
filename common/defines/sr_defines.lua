-- If you're reading this, don't say anything about this, this is a secret between us (๑>؂•̀๑) (decreased from 4.5 vanilla value to 4.0).
NDefines.NProduction.BASE_FACTORY_SPEED_MIL = 4.3
NDefines.NOperatives.AGENCY_CREATION_DAYS = 9999			
NDefines.NOperatives.AGENCY_CREATION_FACTORIES = 9999
NDefines.NDiplomacy.EMBARGO_COST = 9999
NDefines.NIndustrialOrganisation.DESIGN_TEAM_CHANGE_XP_COST = 1
------ Recently Added -----
-- NDefines.NMilitary.FUEL_FLOW_PENALTY_FOR_SUPPLY_CHUNK_EDGE_RATIO = 0.25 --snaking 
NDefines.NProduction.FLOATING_HARBOR_MAX_NAV_FACTORIES_PER_LINE = 300
NDefines.NProduction.RAILWAY_GUN_MAX_MIL_FACTORIES_PER_LINE = 300
NDefines.NSupply.MAX_RAILWAY_LEVEL = 5
NDefines.NBuildings.INFRASTRUCTURE_RESOURCE_BONUS = 0.1
NDefines.NCountry.SCORCHED_EARTH_STATE_COST = 9999					-- pp cost to scorch a state
NDefines.NAir.SUPPLY_NEED_FACTOR = 0.01
NDefines.NBuildings.RADAR_INTEL_EFFECT = 160			-- Province covered by radar increases intel by 10 (where 255 is max). Province may be covered by multiple radars, then the value sums up.

NDefines.NTechnology.USE_BONUS_REGRET_TIMER = 10						-- Number of days the player has to regret using a limited tech bonus
NDefines.NMilitary.NAVAL_INVASION_PLANNING_BONUS_MALUS = 0

NDefines.NMilitary.RETREAT_SPEED_FACTOR = 0.5                   -- speed bonus when retreating
NDefines.NMilitary.WITHDRAWING_SPEED_FACTOR = 0.35               -- speed bonus when withdrawing
NDefines.NMilitary.ZERO_ORG_MOVEMENT_MODIFIER = -0.0		-- speed impact at 0 org.

NDefines.NMilitary.COMBAT_VALUE_ORG_IMPORTANCE = 5 		-- VANILLA 1     Multiplier on TotalOrganisation when determining the combat value of a division
NDefines.NMilitary.COMBAT_VALUE_STR_IMPORTANCE = 0 -- VANILLA 1      Multiplier on TotalStrength when determining the combat value of a division
NDefines.NMilitary.SOFT_ATTACK_TARGETING_FACTOR = 1.0		-- 1.0 How much we care about potential soft attacks when evaluating priority combat target
NDefines.NMilitary.HARD_ATTACK_TARGETING_FACTOR = 100.0		-- 1.2 How much we care about potential hard attacks when evaluating priority combat target

NDefines.NMilitary.ENGAGEMENT_WIDTH_PER_WIDTH = 1.00	-- how much enemy combat width we are allowed to engage per width of our own
NDefines.NMilitary.DAMAGE_SPLIT_ON_FIRST_TARGET = 0.90			--% of damage dealt to the first target in a combat. The rest will be split amongst subsequent targets. Modifiers can affect this up to a maximum of 0.9. That value must not be exposed as a define.

NDefines.NMilitary.COMBAT_STACKING_START = 4						-- vanilla is 8 -- at what nr of divisions stacking penalty starts
NDefines.NMilitary.COMBAT_STACKING_EXTRA = 1                      -- vanilla is 4 -- extra stacking from directions
NDefines.NMilitary.COMBAT_STACKING_PENALTY = -0.20                -- vanilla is -0.02 -- how much stacking penalty per division


--//////////////// Block of possibly useful future defines
-- NDefines.NMilitary.ATTRITION_DAMAGE_ORG = 0.08					   -- damage from attrition to Organisation
-- NDefines.NMilitary.ATTRITION_EQUIPMENT_LOSS_CHANCE = 0.1		   -- Chance for loosing equipment when suffer attrition. Scaled up the stronger attrition is. Then scaled down by equipment reliability.
-- NDefines.NMilitary.ATTRITION_EQUIPMENT_PER_TYPE_LOSS_CHANCE = 0.1 -- Chance for loosing equipment when suffer attrition. Scaled up the stronger attrition is. Then scaled down by equipment reliability.
-- NDefines.NMilitary.ATTRITION_WHILE_MOVING_FACTOR = 1
-- NDefines.NMilitary.RELIABILITY_ORG_REGAIN = -0.3                 -- how much reliability affects org regain
-- NDefines.NMilitary.RELIABILITY_ORG_MOVING = -1.0                 -- how much reliability affects org loss on moving
-- NDefines.NMilitary.RELIABILITY_WEATHER = 3.0                     -- how much reliability is afffecting weather impact
-- NDefines.NMilitary.RELIABILTY_RECOVERY = 0.1                     -- factor affecting how much equipment is returned "from the dead"
-- NDefines.NMilitary.COMBAT_MOVEMENT_SPEED = 0.33	               -- speed reduction base modifier in combat
NDefines.NMilitary.PREFERRED_TACTIC_CHARACTER_SKILL_LEVEL_REQUIRED = 5 -- Which level a field marhal or general has to be before they can pick their preferred tactic
NDefines.NMilitary.COUNTRY_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.075  -- extra weight multiplier for the country preferred tactic when doing weighted random
NDefines.NMilitary.ARMY_GENERAL_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.15   -- extra weight multiplier for the army general preferred tactic when doing weighted random
NDefines.NMilitary.FIELD_MARSHAL_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.10 -- extra weight multiplier for the field marhsal preferred tactic when doing weighted random
NDefines.NMilitary.PREFERRED_TACTIC_COMMAND_POWER_COST = 20	   -- command point cost for changing preferred tactic
NDefines.NMilitary.INITIATIVE_PICK_COUNTER_ADVANTAGE_FACTOR  = 0.25 -- advantage per leader level for picking a counter
-- End of Block ////////////////////////


NDefines.NCharacter.DEFAULT_PP_COST_FOR_MILITARY_ADVISOR = 150	-- When an advisor does not have cost assigned this is the default used
NDefines.NCharacter.DEFAULT_PP_COST_FOR_POLITICAL_ADVISOR = 150
-- NDefines.NCharacter.DEFAULT_CP_COST_FOR_ADVISOR = 0	-- For Starting Advisors
-- NDefines.NCharacter.DEFAULT_CP_COST_FOR_DYNAMIC_ADVISORS = 0	-- For Advisors created during gameplay
NDefines.NCharacter.ADVISOR_PROMOTION_COST = 9999	-- Cost to promote someone to advisor


NDefines.NCharacter.SPECIALIST_ADVISOR_MIN_RANK = 10
NDefines.NCharacter.EXPERT_ADVISOR_MIN_RANK = 10
NDefines.NCharacter.GENIUS_ADVISOR_MIN_RANK = 10




-- Convoy Priorities START --- this is edited from vanilla to make lend lease be the last priority with convoys, so that you don't get your trade for resources stopped if you are getting too much LL
NDefines.NNavy.NAVAL_INVASION_PRIORITY = 1									-- Default convoy priority for naval invasions
NDefines.NNavy.NAVAL_TRANSFER_PRIORITY = 1									-- Default convoy priority for naval transports
NDefines.NNavy.SUPPLY_PRIORITY = 2											-- Default convoy priority for supplying units via sea
NDefines.NNavy.RESOURCE_LENDLEASE_PRIORITY = 5								-- Default convoy priority for export lend lease              - was 3 in vanilla
NDefines.NNavy.RESOURCE_EXPORT_PRIORITY = 3									-- Default convoy priority for export trade                   - was 4 in vanilla
NDefines.NNavy.RESOURCE_ORIGIN_PRIORITY = 4									-- Default convoy priority for resources shipped internally   - was 5 in vanilla

---------------------------------------------------------------
NDefines.NGame.LAG_DAYS_FOR_LOWER_SPEED = 300
NDefines.NGame.LAG_DAYS_FOR_PAUSE = 100    							-- 
NDefines.NGame.COMBAT_LOG_MAX_MONTHS = 12 							-- WAS 48 | drastically cuts down on save file sizes after WW2 starts and well into barbarossa
NDefines.NGame.MESSAGE_TIMEOUT_DAYS = 14					     	 -- WAS 60 	| less messages lying around at the top of your screen
NDefines.NGame.GAME_SPEED_SECONDS = { 0.25, 0.15, 0.08, 0.04, 0.0 } -- 0.375, 0.175, 0.1, 0.035, 0.0 game speeds for each level. Must be 5 entries with last one 0 for unbound
---------------------------------------------------------------
NDefines.NTrade.ANTI_MONOPOLY_TRADE_FACTOR = -1						-- WAS -100 | This is added to the factor value when anti-monopoly threshold is exceeded; cucks Soviets/Japan often if the value is vanilla
---------------------------------------------------------------
NDefines.NTechnology.MAX_SUBTECHS = 4                                 -- Added to stop weird things from happening with the amphibious tank variants 
NDefines.NTechnology.BASE_YEAR_AHEAD_PENALTY_FACTOR = 3.1 -- Vanilla is 2.0, means 300% increase in research time per year ahead
NDefines.NTechnology.BASE_RESEARCH_POINTS_SAVED = 50.0 -- Vanilla is 30.0, increased because ahead of time penalty also increased
---------------------------------------------------------------
NDefines.NCountry.ATTACHE_XP_SHARE = 0.00

NDefines.NCountry.GIE_DIVISION_ATTACK_BONUS_AGAINST_OCCUPIER = 0.05 -- Attack bonus factor against whoever occupies your core territory.
NDefines.NCountry.GIE_DIVISION_DEFENSE_BONUS_AGAINST_OCCUPIER = 0.05 -- Attack bonus factor against whoever occupies your core territory.
NDefines.NMilitary.UNIT_DIGIN_CAP = 2.0

NDefines.NCountry.BASE_MOBILIZATION_SPEED = 0.025 -- 0.01

NDefines.NMilitary.ENCIRCLED_PENALTY = -0.35
NDefines.NMilitary.MAX_OUT_OF_SUPPLY_DAYS = 22 -- (30)
NDefines.NMilitary.OUT_OF_SUPPLY_ATTRITION = 0.4                -- max attrition when out of supply
NDefines.NMilitary.ENCIRCLED_DISBAND_MANPOWER_FACTOR = 0            -- WAS 0.2 | Most rulesets ban deleting encircled troops, but at least this prevents some manpower from returning | Deleting encircled divisions is always banned anyways, so this reduces unfair play | percentage of manpower returned when an encircled unit is disbanded
NDefines.NMilitary.UNIT_LEADER_MODIFIER_COOLDOWN_ON_GROUP_CHANGE = 0 -- WAS 15 | This prevents reassignment memes | This is the number of days it takes to REASSIGN a general. 
NDefines.NMilitary.UNIT_LEADER_ASSIGN_TRAIT_COST = 0.00               -- WAS 15 | prevents getting memed by forgetting to assign traits
NDefines.NMilitary.BASE_DIVISION_BRIGADE_GROUP_COST = 0 -- 0xp, was 25
NDefines.NMilitary.BASE_DIVISION_BRIGADE_CHANGE_COST = 0 -- 0xp, was 5
NDefines.NMilitary.BASE_DIVISION_SUPPORT_SLOT_COST = 0 -- 0xp, was 10
NDefines.NMilitary.UNIT_EXPERIENCE_PER_TRAINING_DAY = 0
NDefines.NMilitary.MAX_NAVY_EXPERIENCE = 9999             -- WAS 500
NDefines.NMilitary.MAX_AIR_EXPERIENCE = 9999
NDefines.NMilitary.MAX_ARMY_EXPERIENCE = 9999
NDefines.NMilitary.PROMOTE_LEADER_CP_COST = 999.0 --0.0, 999 for balancing
NDefines.NMilitary.BASE_CAPTURE_EQUIPMENT_RATIO = 0.000 -- 0.0 is vanilla, reduces savegame bloat

NDefines.NMilitary.UNIT_EXPERIENCE_PER_COMBAT_HOUR = 0.000175 -- (0.0001)
NDefines.NMilitary.EXPERIENCE_LOSS_FACTOR = 0.000001 -- (1.00)
NDefines.NMilitary.BATALION_CHANGED_EXPERIENCE_DROP = 0 --Division experience drop if unit has different battalion when switching templates(vanilla 0.5 but can be circumvented with template editing)

NDefines.NBuildings.OWNER_CHANGE_EXTRA_SHARED_SLOTS_FACTOR = 1.0 -- You get all the factories in a territory when you annex it
NDefines.NMilitary.ARMOR_VS_AVERAGE = 0.17 -- how to weight in highest armor & pen vs the division average
NDefines.NMilitary.PEN_VS_AVERAGE = 1.0
NDefines.NMilitary.LAND_COMBAT_ORG_ARMOR_DEFLECTION_FACTOR = 0.50 -- damage reduction if armor outclassing enemy, will look at increasing if AT is too deadly to org. 
NDefines.NMilitary.LAND_COMBAT_STR_ARMOR_DEFLECTION_FACTOR = 0.70 -- damage reduction if armor outclassing enemy

NDefines.NMilitary.LAND_COMBAT_ORG_DICE_SIZE = 4                 -- nr of damage dice
NDefines.NMilitary.LAND_COMBAT_STR_DICE_SIZE = 2                 -- nr of damage dice
NDefines.NMilitary.LAND_COMBAT_STR_ARMOR_ON_SOFT_DICE_SIZE = 2   -- extra damage dice if our armor outclasses enemy
NDefines.NMilitary.LAND_COMBAT_ORG_ARMOR_ON_SOFT_DICE_SIZE = 5   -- extra damage dice if our armor outclasses enemy

NDefines.NMilitary.CHANCE_TO_AVOID_HIT_AT_NO_DEF = 60
NDefines.NMilitary.LAND_COMBAT_STR_DAMAGE_MODIFIER = 0.075 -- (0.05)
NDefines.NMilitary.LAND_COMBAT_ORG_DAMAGE_MODIFIER =	0.03 	-- (0.0333) (0.05) global damage modifier

NDefines.NMilitary.EQUIPMENT_COMBAT_LOSS_FACTOR = 0.50 -- (0.7)
NDefines.NMilitary.TRAINING_ATTRITION = 0.00 -- (0.06) Because losing tons of equipment to training is not fun
NDefines.NMilitary.STRATEGIC_SPEED_BASE = 15.0 -- (10.0) Increased speed to make 3 speed changes more tolerable

NDefines.NMilitary.TACTIC_SWAP_FREQUENCEY = 20 -- (12) Makes having proper recon and leadership more important
NDefines.NMilitary.SLOWEST_SPEED = 4 -- Was 3 before 3 speed changes
NDefines.NNavy.AMPHIBIOUS_LANDING_PENALTY = -0.50 -- amphibious landing penalty

NDefines.NMilitary.LAND_AIR_COMBAT_STR_DAMAGE_MODIFIER 	= 0.03	--air global damage modifier
NDefines.NMilitary.LAND_AIR_COMBAT_ORG_DAMAGE_MODIFIER =	0.0125 	--global damage modifier 
NDefines.NMilitary.AIR_SUPPORT_BASE = 0.25 --(0.25)

NDefines.NMilitary.ENEMY_AIR_SUPERIORITY_IMPACT =	-0.35 	--effect on defense due to enemy air superiority
NDefines.NMilitary.ENEMY_AIR_SUPERIORITY_DEFENSE =	0.30	--more AA attack will approach this amount of help (diminishing returns)
NDefines.NMilitary.ENEMY_AIR_SUPERIORITY_DEFENSE_STEEPNESS = 400 	--how quickly defense approaches the max impact diminishing returns curve
NDefines.NMilitary.ENEMY_AIR_SUPERIORITY_SPEED_IMPACT =	-0.125	--effect on speed due to enemy air superiority
NDefines.NMilitary.ANTI_AIR_TARGETTING_TO_CHANCE =	0.01 	-- (0.07) Balancing value to determine the chance of ground AA hitting an attacking airplane, affecting both the effective average damage done by AA to airplanes, and the reduction of damage done by airplanes due to AA support
NDefines.NMilitary.ANTI_AIR_ATTACK_TO_AMOUNT =	0.0001 	-- WAS 0.005 | Lowered because vanilla CAS shootdown rates are too high | Balancing value to convert equipment stat anti_air_attack to the random % value of airplanes being hit.
NDefines.NAir.ANTI_AIR_ATTACK_TO_DAMAGE_REDUCTION_FACTOR = 0.80 -- (1.0) Balancing value to convert equipment stat anti_air_attack to the damage reduction modifier apply to incoming air attacks against units with AA. 
NDefines.NAir.ANTI_AIR_MAXIMUM_DAMAGE_REDUCTION_FACTOR = 0.77 -- (.75) Maximum damage reduction factor applied to incoming air attacks against units with AA.
NDefines.NBuildings.ANTI_AIR_SUPERIORITY_MULT = 20.0 -- How much air superiority reduction to the enemy does our AA guns? Normally each building level = -1 reduction. With this multiplier.
NDefines.NAir.NAVAL_KAMIKAZE_DAMAGE_MULT = 5.0 -- (20.0?)
NDefines.NAir.DISRUPTION_FACTOR = 4 -- (4 -> 7) with decent radar coverage equal amounts of fighters vs naval bombers will disrupt almost all naval bombers if not escorted, with low detection very few bombers are intercepted still
NDefines.NAir.ESCORT_FACTOR = 2 -- (2 -> 3) to make sure that escorted planes are still capable of bombing, with equal escorts/interceptors most of bombers get through Keep in mind that these values will also affect how cas/tac/strat bombers work, they make escorting planes much more important (which imo is 100% fine)

NDefines.NAir.DISRUPTION_DEFENCE_SPEED_FACTOR = 75
NDefines.NAir.AIR_WING_MAX_STATS_SPEED = 25000


-- Fuel Changes -- Reduced across the board -------------------------------------------------------------
NDefines.NMilitary.ARMY_FUEL_COST_MULT = 0.55 -- (0.50) fuel cost multiplier for all army related stuff
NDefines.NNavy.FUEL_COST_MULT = 0.07 -- (0.10) fuel multiplier for all naval missions
NDefines.NAir.FUEL_COST_MULT = 0.21 -- (0.35) fuel multiplier for all air missions 
---------------------------------------------------------------------------------------------------------

NDefines.NMilitary.INFRA_ORG_IMPACT = 0.25				-- scale factor of infra on org regain.
NDefines.NMilitary.LAND_SPEED_MODIFIER = 0.0375                    -- basic speed control
NDefines.NMilitary.INFRASTRUCTURE_MOVEMENT_SPEED_IMPACT = -0.005	-- speed penalty per infrastucture below maximum.
-- NDefines.NMilitary.HOURLY_ORG_MOVEMENT_IMPACT = -0.15 -- WAS 0.20, how much org is lost every hour while moving an army. 
-- NDefines.NMilitary.ORG_LOSS_FACTOR_ON_CONQUER = 0.35


--defines relating to how much org you lose while moving/advancing. This relates to snaking and how easy encirclements are and also to how quickly an offensive loses momentum and needs to stop and resupply/consolidate for further advance

NDefines.NMilitary.ORG_LOSS_FACTOR_ON_CONQUER = 0.3            -- vanilla is 0.2, for a long time GDU was 0.4. percentage of (max) org loss on takign enemy province
-- NDefines.NMilitary.LOW_ORG_FOR_ATTACK = 1.0                    -- vanilla is 0.5. at what org % we start affecting speed when doign hostile moves. scales down ZERO_ORG_MOVEMENT_MODIFIER
-- NDefines.NMilitary.ZERO_ORG_MOVEMENT_MODIFIER = -0.8		   -- vanilla is -0.8. speed impact at 0 org.
NDefines.NMilitary.HOURLY_ORG_MOVEMENT_IMPACT = -0.4		   -- vanilla is -0.2. how much org is lost every hour while moving an army.
NDefines.NMilitary.OUT_OF_FUEL_SPEED_MULT = 0.6				-- vanilla is 0.4. speed mult that armies get when out of fuel 

--HFU FRONTLINE AI DEFINES---------------------------------------------------------------------------------
NDefines.NMilitary.PLAN_NEIGHBORING_ENEMY_PROVINCE_FACTOR = 0.7	-- When calculating the importance of provinces, it takes number of enemy provinces into account, factored by this
NDefines.NMilitary.PLAN_PROVINCE_LOW_VP_IMPORTANCE_AREA = 1     -- Used when calculating the value of defense area in the battle plan system
NDefines.NMilitary.PLAN_PROVINCE_MEDIUM_VP_IMPORTANCE_AREA =1  -- Used when calculating the value of defense area in the battle plan system
NDefines.NMilitary.PLAN_PROVINCE_HIGH_VP_IMPORTANCE_AREA = 1   -- Used when calculating the value of defense area in the battle plan system
NDefines.NMilitary.PLAN_PROVINCE_CAPITAL_IMPORTANCE_AREA = 1	-- Used when calculating the balue of defense area in the battle plan system
NDefines.NMilitary.MIN_VP_NEEDED_FOR_DEFENSE_ORDER_ASSIGNMENTS = 1.0 -- If a province has more than this VP unit controller will try to assign units that prov
NDefines.NMilitary.PLAN_PROVINCE_LOW_VP_IMPORTANCE_FRONT = 1    -- Used when calculating the calue of fronts in the battle plan system
NDefines.NMilitary.PLAN_PROVINCE_MEDIUM_VP_IMPORTANCE_FRONT = 1 -- Used when calculating the calue of fronts in the battle plan system
NDefines.NMilitary.PLAN_PROVINCE_HIGH_VP_IMPORTANCE_FRONT = 1  -- Used when calculating the calue of fronts in the battle plan system
NDefines.NMilitary.PLAN_SHARED_FRONT_PROV_IMPORTANCE_FACTOR = 0.5	-- doesnt really change a lot-- If fornt orders share end provinces they should each have a somewhat reduced prio due to it being shared.
NDefines.NMilitary.PLAN_PORVINCE_PORT_BASE_IMPORTANCE = 1		-- Added importance for area defense province with a port
NDefines.NMilitary.PLAN_PORVINCE_PORT_LEVEL_FACTOR = 1			-- Bonus factor for port level
NDefines.NMilitary.PLAN_PORVINCE_AIRFIELD_BASE_IMPORTANCE = 1	-- Added importance for area defense province with air field
NDefines.NMilitary.PLAN_PORVINCE_AIRFIELD_POPULATED_FACTOR = 1	-- Bonus factor when an airfield has planes on it
NDefines.NMilitary.PLAN_PORVINCE_AIRFIELD_LEVEL_FACTOR = 1		-- Bonus factor for airfield level
NDefines.NMilitary.PLAN_PORVINCE_RESISTANCE_BASE_IMPORTANCE = 1 -- Used when calculating the calue of defense area provinces for the battle plan system (factored by resistance level)
--NDefines.NMilitary.PLAN_AREA_DEFENSE_FORT_IMPORTANCE = 1	--you need less divs on a city tile/fort and not more --Used when calculating the calue of defense area provinces for the battle plan system works as multipliers on the rest
--NDefines.NMilitary.PLAN_AREA_DEFENSE_COASTAL_FORT_IMPORTANCE = 1-- Used when calculating the calue of defense area provinces for the battle plan system
--NDefines.NMilitary.PLAN_AREA_DEFENSE_COAST_NO_FORT_IMPORTANCE = 1-- Used when calculating the calue of defense area provinces for the battle plan system
NDefines.NMilitary.PLAN_PROVINCE_PRIO_DISTRIBUTION_MIN = 1	--0.8	-- Lowest fraction of divisions that will be distributed based on province priority
NDefines.NMilitary.PLAN_PROVINCE_PRIO_DISTRIBUTION_MAX = 1.0		-- Highest fraction of divisions that will be distributed based on province priority
NDefines.NMilitary.PLAN_PROVINCE_PRIO_DISTRIBUTION_DPP_HIGH = 1 --4-- At what divisions per province should we use PLAN_PROVINCE_PRIO_DISTRIBUTION_MIN
NDefines.NMilitary.PLAN_PROVINCE_PRIO_DISTRIBUTION_DPP_LOW = 1	--2-- At what divisions per province should we use PLAN_PROVINCE_PRIO_DISTRIBUTION_MAX
NDefines.NAI.PLAN_FRONTUNIT_DISTANCE_FACTOR	= 30 --- closer units move first but domino is not possible
NDefines.NMilitary.FRONT_MIN_PATH_TO_REDEPLOY = 3				--should really help--	-- If a units path is at least this long to reach its front location it will strategically redeploy.
--END OF HFU FRONTLINE MECHANICS-----------------------------------------------------------------------------------------------

NDefines.NIntel.NAVAL_SUPREMACY_INTEL_LOW = 0.0 -- we need more intel than this to get any supremacy - should hopefully make naval invasions not be blocked by intel nonesense????

NDefines.NMilitary.RIVER_CROSSING_PENALTY = -0.20
NDefines.NMilitary.RIVER_CROSSING_PENALTY_LARGE = -0.30
NDefines.NMilitary.RIVER_CROSSING_SPEED_PENALTY = -0.175           -- small river crossing
NDefines.NMilitary.RIVER_CROSSING_SPEED_PENALTY_LARGE = -0.2     -- large river crossing


NDefines.NMilitary.CORPS_COMMANDER_DIVISIONS_CAP = 999 -- (72) Divisions per general
NDefines.NMilitary.FIELD_MARSHAL_DIVISIONS_CAP = 999 -- Divisions per field marshal directly leading troops
NDefines.NMilitary.ARMY_LEADER_XP_GAIN_PER_UNIT_IN_COMBAT = 0.00

-- Changes for more granular xp levels
NDefines.NMilitary.UNIT_EXP_LEVELS = {0.02,0.04,0.06,0.08,0.1,0.14,0.18,0.22,0.26,0.3,0.39,0.48,0.57,0.66,0.75,0.78,0.81,0.84,0.87,0.9}		-- Experience needed to progress to the next level
NDefines.NMilitary.EXPERIENCE_COMBAT_FACTOR = 0.015
NDefines.NMilitary.TRAINING_MAX_LEVEL = 10
NDefines.NMilitary.DEPLOY_TRAINING_MAX_LEVEL = 10 -- vanilla 1, you can train to trained in deployment queue 
NDefines.NMilitary.TRAINING_EXPERIENCE_SCALE = 156.0 -- vanilla 62.0  how fast you train in deployment queue
NDefines.NMilitary.ARMY_EXP_BASE_LEVEL = 5
-- End of changes for more granular xp levels

NDefines.NMilitary.MAX_RELATIVE_COMBAT_DAMAGE_TO_MODIFY_XP = 0.0			-- you gain more XP if you are doing more damage relative to enemy, this is the max relative amount to gain following RATe
NDefines.NMilitary.XP_DECAY_RATE_PER_HOUR_IN_COMBAT = 0.00				-- you get reduced XP as combat drags
NDefines.NMilitary.MIN_XP_RATE_TO_DECAY = 0.0
NDefines.NMilitary.XP_GAIN_FACTOR_FOR_MAX_RELATIVE_COMBAT_DAMAGE = 0.0	-- XP factor scaling for max relative combat damage
NDefines.NMilitary.BASE_LEADER_TRAIT_GAIN_XP = 0.00
NDefines.NMilitary.FIELD_MARSHAL_XP_RATIO = 0.0
NDefines.NMilitary.XP_GAIN_PER_OVERRUN_UNIT = 0.00
NDefines.NMilitary.XP_GAIN_FOR_SHATTERING = 0.00
NDefines.NMilitary.CONSTANT_XP_RATIO_FOR_MULTIPLE_LEADERS_IN_SAME_COMBAT = 0.0 -- if there are multiple leaders in same combat, each one gets thisratio + (1-thisratio)/num leaders. amount of xp each general gets scales 1 0.75 0.66 etc for 1 2 3 generals

NDefines.NMilitary.MULTIPLE_COMBATS_PENALTY = -0.35               -- defender penalty if attacked from multiple directions
NDefines.NMilitary.COMBAT_MINIMUM_TIME = 2 -- (4) Changed to make micro more responsive
NDefines.NMilitary.PLAYER_ORDER_PLANNING_DECAY = 0.01
NDefines.NMilitary.PLANNING_DECAY = 0.01
NDefines.NMilitary.PLANNING_MAX = 0.15                          	-- can get more from techs
NDefines.NMilitary.REINFORCE_CHANCE = 0.08 -- To make larger divisions more attractive
NDefines.NMilitary.MAX_DIVISION_SUPPORT_HEIGHT = 8 -- Number of support companies allowed per division
NDefines.NProduction.BASE_FACTORY_SPEED_MIL = 4.5 -- (4.5)
NDefines.NProduction.BASE_FACTORY_SPEED_NAV = 3.5

NDefines.NMilitary.LAND_COMBAT_COLLATERAL_FACTOR = 0.0013 -- (0.005)
NDefines.NMilitary.LAND_COMBAT_FORT_DAMAGE_CHANCE = 15		-- (5) chance to get a hit to damage on forts. (out of 100)

NDefines.NAir.COMBAT_DAMAGE_SCALE = 0.1-- (0.1)
NDefines.NAir.COMBAT_DAMAGE_SCALE_CARRIER = 0.05

NDefines.NAir.NAVAL_KAMIKAZE_DAMAGE_MULT = 5.0  -- vanilla is like 20
NDefines.NAir.AA_INDUSTRY_AIR_DAMAGE_FACTOR = -0.12 -- -0.12 vanilla, per level AA state 
--NDefines.NAir.ANTI_AIR_MAXIMUM_DAMAGE_REDUCTION_FACTOR = 0.68 -- .75 Maximum damage reduction factor applied to incoming air attacks against units with AA.

NDefines.NAir.AIR_WING_XP_LOSS_WHEN_KILLED = 0.4
--NDefines.NAir.DETECT_CHANCE_FROM_AIRCRAFTS_EFFECTIVE_COUNT = 1
NDefines.NAir.COMBAT_MULTIPLANE_CAP = 1 -- (3.0) How many of our planes can engage per enemy plane, reduced to encourage trading
NDefines.NAir.AIR_COMBAT_FINAL_DAMAGE_SCALE = 0.015  -- 0.015	 % how many max disrupted only planes are allowed to die in a single combat

NDefines.NAir.DISRUPTION_DETECTION_FACTOR = 1

NDefines.NCountry.BASE_MAX_COMMAND_POWER = 250.0
NDefines.NCountry.BASE_COMMAND_POWER_GAIN = 0.5				-- base value for daily command power gain
NDefines.NCountry.STARTING_COMMAND_POWER = 50.0
---------------------------------------------------------------
--HORST/SR AIR REWORK - VANILLA INTERACTIONS; HALVED PLANE COUNT--
---------------------------------------------------------------
NDefines.NAir.CAPACITY_PENALTY=  0.869
NDefines.NMilitary.LAND_AIR_COMBAT_MAX_PLANES_PER_ENEMY_WIDTH = 0.50   -- WAS 3, halved because plane counts halved. CAS has received a 100% increase in ground attack so the overall damage should still be vanilla.
---------------------------------------------------------------
NDefines.NBuildings.AIRBASE_CAPACITY_MULT = 100						 -- WAS 200, decreased because plane IC doubled | Each level of airbase building multiplied by this, gives capacity (max operational value). Value is int. 1 for each airplane.
---------------------------------------------------------------
NDefines.NCountry.AIR_SUPPLY_CONVERSION_SCALE = 0.045 -- original 0.05 air supply?
NDefines.NAir.AIR_WING_COUNTRY_XP_FROM_TRAINING_FACTOR = 0.01


NDefines.NAir.AIR_WING_MAX_SIZE = 200                               -- this can be halved 6 times into 100 stacks (very convenient)
NDefines.NAir.DETECT_CHANCE_FROM_AIRCRAFTS_EFFECTIVE_COUNT = 1500  -- WAS 1500, halved because plane counts halved | Max amount of aircrafts in region to give full detection bonus.
NDefines.NAir.CLOSE_AIR_SUPPORT_EXPERIENCE_SCALE = 0.001			-- WAS 0.0005 | How much the experinence gained by CAS is scaled
NDefines.NAir.PARADROP_EXPERIENCE_SCALE = 0.06						-- WAS 0.03 | How much the experinence gained by paradropping is scaled
NDefines.NAir.BOMBING_DAMAGE_EXPERIENCE_SCALE = 0.0004        	   -- WAS 0.0002 | How much the experinence gained by bombing is scaled
NDefines.NAir.FIELD_EXPERIENCE_SCALE = 0.0025						-- WAS 0.001 | This affects how much XP you get from various missions (AFAIK this will affect XP gained from bombing and CAS missions as well)
NDefines.NAir.COMBAT_MAX_WINGS_AT_ONCE = 10000                         -- WAS 10000 | Max amount of air wings in one combat simulation. The higher value, the quicker countries may loose their wings. It's a gameplay balance value.
NDefines.NAir.COMBAT_MAX_WINGS_AT_GROUND_ATTACK = 10000                -- WAS 10000 | we can really pounce a land strike and escalate
NDefines.NAir.COMBAT_MAX_WINGS_AT_ONCE_PORT_STRIKE = 10000       	 -- WAS 10000 | we can really pounce a naval strike and escalate
NDefines.NAir.MISSION_COMMAND_POWER_COSTS = { 						 -- command power cost per plane to create a mission
		0.0, -- AIR_SUPERIORITY
		0.0, -- CAS		
		0.0, -- INTERCEPTION	
		0.0, -- STRATEGIC_BOMBER
		0.0, -- NAVAL_BOMBER	
		0.0, -- DROP_NUKE		
		0.0, -- PARADROP		
		0.0, -- NAVAL_KAMIKAZE	
        0.0, -- PORT_STRIKE		
		0.0, -- AIR_SUPPLY		
		0.0, -- TRAINING
		0.0, -- NAVAL_MINES_PLANTING
		0.0, -- NAVAL_MINES_SWEEPING
		0.0, -- MISSION_RECON
	}
NDefines.NAir.NAVAL_STRIKE_BASE_STR_TO_PLANES_RATIO  = 0.03       -- WAS 0.015 | Changed due to plane count changes

NDefines.NAir.AIR_MORE_GROUND_CREWS_COST = 999.0 -- Can no longer use ground crews, to help strat region balance
---------------------------------------------------------------
----END OF DEFINE CHANGES FOR SUPPORTING HALVED PLANE COUNT----
---------------------------------------------------------------
NDefines.NAir.EFFICIENCY_REGION_CHANGE_DAILY_GAIN_TACTICAL_BOMBER = 0.132	-- vanilla 0.192 | changed so flicker bombing isnt as effective and ACs are more able to respond to changes in bombing | How much efficiency to regain per day. Gain applied hourly.
NDefines.NAir.AIR_WING_FLIGHT_SPEED_MULT = 0.2 --makes redeployement of fighters faster vanilla is 0.02
NDefines.NAir.AIR_DEPLOYMENT_DAYS = 0                              -- Down from 3 | Makes AC player much more responsive
NDefines.NAir.ACCIDENT_CHANCE_BASE = 0							-- Base chance % (0 - 100) for accident to happen. Reduced with higher reliability stat.
NDefines.NAir.ACCIDENT_CHANCE_CARRIER_MULT = 0					-- The total accident chance is scaled up when it happens on the carrier ship.
NDefines.NAir.ACCIDENT_CHANCE_BALANCE_MULT = 0					-- Multiplier for balancing how often the air accident really happens. The higher mult, the more often.
NDefines.NAir.ACCIDENT_EFFECT_MULT = 0					-- Multiplier for balancing the effect of accidents
NDefines.NAir.AIR_WING_XP_TRAINING_MISSION_ACCIDENT_FACTOR = 0
NDefines.NAir.AIR_WING_XP_LOSS_REDUCTION_OVER_FRIENDLY_TERRITORY_FACTOR = 0 	--Reduction on XP loss over friendly territory
NDefines.NAir.AIR_WING_XP_TRAINING_MISSION_GAIN_DAILY = 0					--Daily gain when running training exercise mission
NDefines.NAir.AIR_WING_XP_AIR_VS_AIR_COMBAT_GAIN = 0 							--Wings in combat gain extra XP	
NDefines.NAir.AIR_WING_XP_GROUND_MISSION_COMPLETED_GAIN = 0					--Bombers bombing, CAS cassing, NBs nbing, kamikazees kamikazeeing, etc.	
NDefines.NAir.AIR_WING_XP_RECON_MISSION_COMPLETED_GAIN = 0					--recon mission
NDefines.NAir.AIR_WING_XP_LOSS_WHEN_KILLED = 0									--if a plane dies, the game assumes that a pilot with this amount of xp died and recalcs average. 
NDefines.NAir.AIR_WING_XP_TRAINING_MAX = 0							--Max average XP achieved with training.
NDefines.NAir.AIR_WING_XP_MAX = 0 											--Per plane XP.
NDefines.NAir.AIR_WING_XP_LEVELS = { 0 } 						--Experience needed to progress to the next level
NDefines.NAir.ACE_DEATH_CHANCE_BASE = 0				-- Base chance % for ace pilot die when an airplane is shot down in the Ace wing.
NDefines.NAir.ACE_DEATH_BY_OTHER_ACE_CHANCE = 0				-- chance to an ace dying by another ace if it was hit by ace in combat
NDefines.NAir.ACE_DEATH_CHANCE_PLANES_MULT = 0		-- The more airplanes was lost in a single airplanes (more bloody it was) the higher chance of Ace to die.
NDefines.NAir.ACE_EARN_CHANCE_BASE = 0				-- Base chance % for ace pilot to be created. Happens only when successfully kill airplane/ship or damage the buildings.
NDefines.NAir.ACE_EARN_CHANCE_PLANES_MULT = 0				-- The more airplanes the wing shots the higher chance of earning Ace.     -- Changed so people don't feel bad for overtraining and can set up air training and go AFK/ignore the planes without being punished for it -Thrasymachus
NDefines.NAir.AIR_DEPLOYMENT_DAYS = 0                              -- Down from 3 | Makes AC player much more responsive
NDefines.NAir.ACE_WING_SIZE_MAX_BONUS = 1                        -- WAS 10, lowered to prevent some exploits with aces | biggest bonus we can get from having a small wing with an ace on
---------------------------------------------------------------
--Supply modifications--
---------------------------------------------------------------
NDefines.NCountry.VP_TO_SUPPLY_BASE = 1.5
-- NDefines.NCountry.SUPPLY_PATH_MAX_DISTANCE = 15
-- NDefines.NCountry.SUPPLY_FROM_DAMAGED_INFRA = 0.1                -- damaged infrastructure counts as this in supply calcs
-- NDefines.NCountry.SUPPLY_BONUS_FROM_INPUT = 0.6					-- % of supply bonus from input area. Look at this as a possible balancing tool. 
NDefines.NCountry.EQUIPMENT_UPGRADE_CHUNK_MAX_SIZE = 1000			-- Maximum chunk size of equipment upgrade distribution per update.
NDefines.NCountry.REINFORCEMENT_EQUIPMENT_DELIVERY_SPEED = 0.8 
NDefines.NCountry.REINFORCEMENT_MANPOWER_DELIVERY_SPEED = 45.0
NDefines.NCountry.REINFORCEMENT_MANPOWER_CHUNK = 0.125
NDefines.NProduction.EQUIPMENT_BASE_LEND_LEASE_WEIGHT = 2.25
NDefines.NProduction.MINIMUM_NUMBER_OF_FACTORIES_TAKEN_BY_CONSUMER_GOODS_PERCENT = 0
-- NDefines.NBuildings.INFRA_TO_SUPPLY = 2.4
-- NDefines.NBuildings.INFRA_TO_SUPPLY_COEFF = 1 -- Testing, 1 in vanilla -- TW/WTT 
---------------------------------------------------------------
NDefines.NFocus.MAX_SAVED_FOCUS_PROGRESS = 20                       --up from 10, should allow for more flexibility with picking focuses while doing something else, like tank templates
---------------------------------------------------------------
-- NDefines.NDiplomacy.NUM_DAYS_TO_ENABLE_KICKING_NEW_MEMBERS_OF_FACTION = 14	-- down from 90 | Number of days before being able to kick a new member of faction 
-- NDefines.NDiplomacy.NUM_DAYS_TO_ENABLE_REINVITE_KICKED_NATIONS = 14		-- down from 90 | Number of days before being able to re invite a kicked 
-- NDefines.NDiplomacy.GUARANTEE_COST = 1000
-- NDefines.NDiplomacy.PEACE_SCORE_PER_PASS = 100.0						-- When you pass once you should get enough points to finish the peace deal
-- NDefines.NDiplomacy.VOLUNTEERS_RETURN_EQUIPMENT = 1		-- Returning volunteers keep this much equipment
-- NDefines.NDiplomacy.VOLUNTEERS_TRANSFER_SPEED = 0			-- days to transfer a unit to another nation
-- NDefines.NDiplomacy.BASE_TRUCE_PERIOD = 1							-- WAS 30 | Base truce period in days.
-- NDefines.NDiplomacy.TRUCE_PERIOD_AFTER_KICKING_FROM_FACTION = 1		-- WAS 30 | Truce period after kicking someone from faction in days.
-- NDefines.NDiplomacy.FRONT_IS_DANGEROUS = 0							 -- AI doesn't care if a front is dangerous 
-- NDefines.NDiplomacy.MIN_TRUST_VALUE = -500 							-- WAS -100 | Min opinion value cap.
-- NDefines.NDiplomacy.MAX_TRUST_VALUE = 500 							-- WAS 100 | MAX opinion value cap.
NDefines.NDiplomacy.NUM_DAYS_TO_ENABLE_KICKING_NEW_MEMBERS_OF_FACTION = 1	-- down from 90 | Number of days before being able to kick a new member of faction 
NDefines.NDiplomacy.NUM_DAYS_TO_ENABLE_REINVITE_KICKED_NATIONS = 1		-- down from 90 | Number of days before being able to re invite a kicked 
NDefines.NDiplomacy.GUARANTEE_COST = 1000
NDefines.NDiplomacy.BASE_SEND_ATTACHE_COST = 0.0 -- Attaches are free but do not give exp, to allow people to actually watch the game
NDefines.NDiplomacy.BASE_SEND_ATTACHE_CP_COST = 0				-- Command Power sent attache usage cost
NDefines.NDiplomacy.PEACE_SCORE_PER_PASS = 100.0						-- When you pass once you should get enough points to finish the peace deal		     	-- WAS 0.05 | Each army unit owned by the source country contributes this amount of volunteers to the limit.
NDefines.NDiplomacy.VOLUNTEERS_DIVISIONS_REQUIRED = 0				-- WAS 30 | This many divisions are required for the country to be able to send volunteers.
NDefines.NDiplomacy.VOLUNTEERS_RETURN_EQUIPMENT = 1		-- Returning volunteers keep this much equipment
NDefines.NDiplomacy.VOLUNTEERS_TRANSFER_SPEED = 0			-- days to transfer a unit to another nation
NDefines.NDiplomacy.BASE_TRUCE_PERIOD = 1							-- WAS 30 | Base truce period in days.
NDefines.NDiplomacy.TRUCE_PERIOD_AFTER_KICKING_FROM_FACTION = 1		-- WAS 30 | Truce period after kicking someone from faction in days.
NDefines.NDiplomacy.FRONT_IS_DANGEROUS = 0							 -- AI doesn't care if a front is dangerous 
NDefines.NDiplomacy.MIN_TRUST_VALUE = -500 							-- WAS -100 | Min opinion value cap.
NDefines.NDiplomacy.MAX_TRUST_VALUE = 500 							-- WAS 100 | MAX opinion value cap.
NDefines.NDiplomacy.DIPLOMACY_HOURS_BETWEEN_REQUESTS = 12           -- Cuts annoying spam from players like WestWood ~Thrasymachus
NDefines.NDiplomacy.LICENSE_ACCEPTANCE_OPINION_FACTOR = 0		-- Opinion modifier for acceptance of license production requests.
NDefines.NDiplomacy.LICENSE_ACCEPTANCE_PUPPET_BASE = 0			-- Acceptance modifier for puppets requesting production licenses.
NDefines.NDiplomacy.LICENSE_ACCEPTANCE_TECH_DIFFERENCE = 0		-- Acceptance modifier for each year of technology difference.
NDefines.NDiplomacy.LICENSE_ACCEPTANCE_TECH_DIFFERENCE_BASE = 0 -- Acceptance base for tech difference
NDefines.NDiplomacy.LICENSE_ACCEPTANCE_SAME_FACTION = 0			-- Acceptance modifier for being in the same faction
NDefines.NDiplomacy.MIN_WARGOAL_JUSTIFY_COST = 5000				-- It always takes atleast 10 days to justify a wargoal
---------------------------------------------------------------
NDefines.NPolitics.LEADER_TRAITS_XP_SHOW = 0.01                    -- WAS 0.05 
NDefines.NPolitics.ARMY_LEADER_COST = 1 -- vanilla 5
---------------------------------------------------------------
NDefines.NBuildings.MAX_SHARED_SLOTS = 99 -- WAS 25 | Increased to accommodate Germany/Japan building slot changes in order to support more of their eco being in their cores.
---------------------------------------------------------------

NDefines.NProduction.MIN_LICENSE_ACTIVE_DAYS = 0                 -- License can be cancelled at any time now, down from 30 | 
NDefines.NProduction.BASE_LICENSE_IC_COST = 0 -- Was 1, reduced to counter early game boosting, particularly cancerous Germany builds that force Bulgarias to build a battleship in the black sea for "shore bombardment" via license and imported steel from Germany
NDefines.NProduction.LICENSE_IC_COST_YEAR_INCREASE = 0
NDefines.NProduction.MIN_POSSIBLE_TRAINING_MANPOWER = 99999999    -- Increased so most nations don't need to queue up multiple lines of infantry or spam 2w infantry and convert 
NDefines.NProduction.SHIP_REFIT_MAX_PROGRESS_TO_CANCEL = 1.00			-- | Changed to prevent using the scuttle mechanic to tank US warsupport | "Maximum refitting progress % that we still allow to cancel wihtout having to scuttle the ship.
NDefines.NProduction.CAPITAL_SHIP_MAX_NAV_FACTORIES_PER_LINE = 300 -- WAS 5 | changed to reduce the number of production lines on navy
NDefines.NProduction.EQUIPMENT_MODULE_ADD_XP_COST = 0.0            -- XP cost for adding a new equipment module in an empty slot when creating an equipment variant.
NDefines.NProduction.EQUIPMENT_MODULE_REPLACE_XP_COST = 0.0        -- XP cost for replacing one equipment module with an unrelated module when creating an equipment variant.
NDefines.NProduction.EQUIPMENT_MODULE_CONVERT_XP_COST = 0.0        -- XP cost for converting one equipment module to a related module when creating an equipment variant.
NDefines.NProduction.EQUIPMENT_MODULE_REMOVE_XP_COST = 0.0  		-- XP cost for removing an equipment module and leaving the slot empty when creating an equipment variant.
NDefines.NProduction.LICENSE_EQUIPMENT_SPEED_NOT_FACTION = 0        -- WAS 0.1, removed because there are really only 2 factions in game | MIC speed modifier for licensed equipment for not being in faction
NDefines.NProduction.MAX_MIL_FACTORIES_PER_LINE = 300               -- WAS 150, changed so you can have 1 fewer line of tanks if you want 
NDefines.NProduction.CONVOY_MAX_NAV_FACTORIES_PER_LINE = 300         -- WAS 15, Changed so you can have less lines of naval production
NDefines.NProduction.DEFAULT_MAX_NAV_FACTORIES_PER_LINE = 300		-- WAS 10, Changed so you can have less lines of naval production
NDefines.NProduction.ANNEX_FIELD_EQUIPMENT_RATIO = 1	-- WAS 0.25 | Annex decisions should give all troops, but incase I screwed up here is this -Thrasymachus | How much equipment from deployed divisions will be transferred on annexation
---------------------------------------------------------------
NDefines.NCountry.SPECIAL_FORCES_CAP_MIN = 9999						-- up from 24 | You can have a minimum of this many special forces battalions, regardless of the number of non-special forces battalions you have, this can also be modified by a country modifier
NDefines.NCountry.SPECIAL_FORCES_CAP_BASE = 0.00
NDefines.NCountry.DAYS_OF_WAR_BEFORE_SURRENDER = 1	           	  -- down from 7 | why not allow Luxembourg to cap faster
NDefines.NCountry.NUM_DAYS_TO_FULLY_DELETE_STOCKPILED_EQUIPMENT = 999 
NDefines.NCountry.EVENT_PROCESS_OFFSET = 60 -- WAS 20. The higher the number, the less responsive mean_time_to_happen events are, but the better the performance is. Most important mean_time_to_happen events have been converted or deleted already or have decisions to circumvent them.
NDefines.NCountry.GIE_ESCAPING_DIVISIONS_TRANSFER_DAYS = 1 			--  WAS 30 | days to transfer escaping divisions to host nation
NDefines.NCountry.GIE_CONVOY_ON_CREATION = 50                      -- WAS 10 | Changed so capped players dont instantly lose supply/ability to do invasions
NDefines.NCountry.MIN_FOCUSES_FOR_CONTINUOUS = 0                    -- WAS 10 | Why should you need 10 focuses to unlock continuous focuses???
NDefines.NCountry.COUNTRY_SCORE_MULTIPLIER = 0				-- Weight of the country score.
NDefines.NCountry.ARMY_SCORE_MULTIPLIER = 0					-- Based on number of armies.
NDefines.NCountry.NAVY_SCORE_MULTIPLIER = 0					-- Based on number of navies.
NDefines.NCountry.AIR_SCORE_MULTIPLIER = 0					-- Based on number of planes (which is typically a lot).
NDefines.NCountry.INDUSTRY_SCORE_MULTIPLIER = 0				-- Based on number of factories.
NDefines.NCountry.PROVINCE_SCORE_MULTIPLIER = 0				-- Based on number of controlled provinces.
NDefines.NCountry.BASE_FUEL_CAPACITY = 150000                -- WAS 50k, increased to make the fuel system more smooth with minor AC
NDefines.NCountry.SURRENDER_LIMIT_REDUCTION_PER_COLLABORATION = 0 -- WAS 0.3 | each percent of collaboration will lower surrender limit by this percentage 
NDefines.NCountry.GIE_CAPITULATION_WARSCORE_LEGITIMACY_FACTOR = 2    --Multiplies accumulated warscore with this factor for part of starting legitimacy.
NDefines.NCountry.GIE_WARSCORE_GAIN_LEGITIMACY_FACTOR = 2                --Factor on how much legitimacy is gained from warscore earned by GiE units.
NDefines.NCountry.POPULATION_YEARLY_GROWTH_BASE = 0.0000               --Removed for game stability/reducing chance of desync
NDefines.NCountry.GIE_HOST_CIC_FROM_LEGITIMACY_MAX = 0 					--Host will receive from 0 to this value in CIC.
NDefines.NCountry.GIE_HOST_MIC_FROM_LEGITIMACY_MAX = 0					--Host will receive from 0 to this value in MIC.
---------------------------------------------------------------
NDefines.NResistance.GARRISON_LOG_MAX_MONTHS = 3            -- WAS 12
NDefines.NResistance.COMPLIANCE_DECAY_AT_MAX_COMPLIANCE = -0.08 -- as compliance increases, it gets a decay rate depending on its value. compliance should stabilize at some value until its growth changes
NDefines.NResistance.COMPLIANCE_GROWTH_BASE = 0.08 -- base compliance grow
NDefines.NResistance.RESISTANCE_TARGET_MODIFIER_OCCUPIED_IS_EXILE_MIN = 0   -- WAS 2, REMOVED TO SUPPORT MORE INTERSTING UK DECISIONS | min & max resistance target modifier resistance target modifier for exile countries. interpolated using legitimacy
NDefines.NResistance.RESISTANCE_TARGET_MODIFIER_OCCUPIED_IS_EXILE_MAX = 0	-- WAS 20, REMOVED TO SUPPORT MORE INTERSTING UK DECISIONS |
NDefines.NResistance.RESISTANCE_TARGET_BASE = 40							-- WAS 35, INCREASED AS RESISTANCE FROM GiE WAS REMOVED | base resistance target percentage
---------------------------------------------------------------

NDefines.NProduction.FLOATING_HARBOR_MAX_NAV_FACTORIES_PER_LINE = 10
NDefines.NProduction.MIN_NAVAL_EQUIPMENT_CONVERSION_IC_COST_FACTOR = 0.05		-- Minimum fraction of an equipment type's base industry capacity cost to use when converting a naval equipment, such as through ship refitting.
NDefines.NProduction.MIN_NAVAL_EQUIPMENT_CONVERSION_RESOURCE_COST_FACTOR = 0.2	-- Minimum fraction of an equipment type's base strategic resource cost to use when converting a naval equipment, such as through ship refitting.
NDefines.NProduction.EQUIPMENT_MODULE_ADD_XP_COST = 0.0			-- XP cost for adding a new equipment module in an empty slot when creating an equipment variant.
NDefines.NProduction.EQUIPMENT_MODULE_REPLACE_XP_COST = 0.0		-- XP cost for replacing one equipment module with an unrelated module when creating an equipment variant.
NDefines.NProduction.EQUIPMENT_MODULE_CONVERT_XP_COST = 0.0		-- XP cost for converting one equipment module to a related module when creating an equipment variant.
NDefines.NProduction.EQUIPMENT_MODULE_REMOVE_XP_COST = 0.0		-- XP cost for removing an equipment module and leaving the slot empty when creating an equipment variant.
--NDefines.NNavy.NAVAL_TRANSFER_BASE_SPEED = 6
--NDefines.NMilitary.AMPHIBIOUS_INVADE_MOVEMENT_COST = 25
--- Navy
NDefines.NProduction.FLOATING_HARBOR_MAX_NAV_FACTORIES_PER_LINE = 10
NDefines.NProduction.MIN_NAVAL_EQUIPMENT_CONVERSION_IC_COST_FACTOR = 0.05		-- Minimum fraction of an equipment type's base industry capacity cost to use when converting a naval equipment, such as through ship refitting.
NDefines.NProduction.MIN_NAVAL_EQUIPMENT_CONVERSION_RESOURCE_COST_FACTOR = 0.2	-- Minimum fraction of an equipment type's base strategic resource cost to use when converting a naval equipment, such as through ship refitting.
NDefines.NProduction.EQUIPMENT_MODULE_ADD_XP_COST = 0.0			-- XP cost for adding a new equipment module in an empty slot when creating an equipment variant.
NDefines.NProduction.EQUIPMENT_MODULE_REPLACE_XP_COST = 0.0		-- XP cost for replacing one equipment module with an unrelated module when creating an equipment variant.
NDefines.NProduction.EQUIPMENT_MODULE_CONVERT_XP_COST = 0.0		-- XP cost for converting one equipment module to a related module when creating an equipment variant.
NDefines.NProduction.EQUIPMENT_MODULE_REMOVE_XP_COST = 0.0		-- XP cost for removing an equipment module and leaving the slot empty when creating an equipment variant.
--NDefines.NNavy.NAVAL_TRANSFER_BASE_SPEED = 6
--NDefines.NMilitary.AMPHIBIOUS_INVADE_MOVEMENT_COST = 25
--- Navy
NDefines.NNavy.LEADER_EXPERIENCE_SCALE = 0.0
NDefines.NNavy.SCREEN_RATIO_FOR_FULL_SCREENING_FOR_CAPITALS = 2
NDefines.NNavy.CAPITAL_RATIO_FOR_FULL_SCREENING_FOR_CARRIERS = 6
NDefines.NNavy.COMBAT_INITIAL_DURATION = 12	
NDefines.NNavy.ANTI_AIR_POW_ON_INCOMING_AIR_DAMAGE = 0.8 --- (0.2 -> 0.8)
NDefines.NNavy.SHIP_TO_FLEET_ANTI_AIR_RATIO = 0.05 --- (0.2 -> 0.05)
NDefines.NNavy.ANTI_AIR_MULT_ON_INCOMING_AIR_DAMAGE = 0.05 --- (0.15 -> 0.05)
NDefines.NNavy.MAX_ANTI_AIR_REDUCTION_EFFECT_ON_INCOMING_AIR_DAMAGE = 0.6 --- (0.5 -> 0.75)
NDefines.NNavy.ANTI_AIR_TARGETTING_TO_CHANCE = 0.08				--Vanilla 0,2
NDefines.NNavy.HIGHER_SHIP_RATIO_POSITIONING_PENALTY_FACTOR	= 0.5 -- if one side has more ships than the other, that side will get this penalty for each +100% ship ratio it has
NDefines.NNavy.MAX_POSITIONING_PENALTY_FROM_HIGHER_SHIP_RATIO = 0.66  -- maximum penalty to get from larger fleets
NDefines.NNavy.MAX_POSITIONING_PENALTY_FOR_NEWLY_JOINED_SHIPS = 0.0  -- the accumulated penalty from new ships will be clamped to this value
NDefines.NNavy.DAMAGE_PENALTY_ON_MINIMUM_POSITIONING = 0.9	-- damage penalty at 0% positioning
NDefines.NNavy.SCREENING_EFFICIENCY_PENALTY_ON_MINIMUM_POSITIONING = 0.0   -- screening efficiency (screen to capital ratio) at 0% positioning
NDefines.NNavy.AA_EFFICIENCY_PENALTY_ON_MINIMUM_POSITIONING	= 0.5  -- AA penalty at 0% positioning

NDefines.NNavy.COMBAT_TORPEDO_CRITICAL_CHANCE = 0.15 -- chance for critical hit from torpedo.
NDefines.NNavy.PRIDE_OF_THE_FLEET_UNASSIGN_COST = 0 -- cost to unassign/replace pride of the fleet
NDefines.NNavy.COMBAT_BASE_CRITICAL_CHANCE = 0.1 -- Base chance for receiving a critical chance. It get's scaled down with ship reliability.
NDefines.NNavy.COMBAT_CRITICAL_DAMAGE_MULT = 5.0 -- Multiplier for the critical damage. Scaled down with the ship reliability.
NDefines.NNavy.COMBAT_ARMOR_PIERCING_CRITICAL_BONUS = 0.05 -- Bonus to critical chance when shooter armor piercing is higher then target armor.
NDefines.NNavy.TRAINING_ACCIDENT_CHANCES = 0
NDefines.NNavy.NAVAL_COMBAT_AIR_SUB_TARGET_BASE = 10                             -- base scoring for target picking for planes inside naval combat based on screening efficency, one define per ship typ
NDefines.NNavy.NAVAL_COMBAT_AIR_SCREEN_TARGET_BASE = 5
NDefines.NNavy.NAVAL_COMBAT_AIR_CAPITAL_TARGET_BASE = 50
NDefines.NNavy.NAVAL_COMBAT_AIR_CARRIER_TARGET_BASE = 250
NDefines.NNavy.NAVAL_COMBAT_AIR_CONVOY_TARGET_BASE = 1.0
NDefines.NNavy.NAVAL_COMBAT_AIR_SUB_TARGET_SCALE = 10                             -- scaled scoring for target picking for planes inside naval combat, max value when zero screening efficency, one define per ship typ
NDefines.NNavy.NAVAL_COMBAT_AIR_SCREEN_TARGET_SCALE = 10
NDefines.NNavy.NAVAL_COMBAT_AIR_CAPITAL_TARGET_SCALE = 10
NDefines.NNavy.NAVAL_COMBAT_AIR_CARRIER_TARGET_SCALE = 10
NDefines.NNavy.NAVAL_COMBAT_AIR_CONVOY_TARGET_SCALE = 1.0
NDefines.NNavy.NAVAL_COMBAT_AIR_STRENGTH_TARGET_SCORE = 10                         -- how much score factor from low health (scales between 0->this number)
NDefines.NNavy.NAVAL_COMBAT_AIR_LOW_AA_TARGET_SCORE = 2.5                           -- how much score factor from low AA guns (scales between 0->this number)
NDefines.NNavy.COMBAT_BASE_HIT_CHANCE = 0.1	
NDefines.NNavy.NAVAL_COMBAT_RESULT_TIMEOUT_YEARS = 2							-- WAS 2 | after that many years, we clear the naval combat results, so they don't get stuck forever in the memory.
NDefines.NNavy.CONVOY_LOSS_HISTORY_TIMEOUT_MONTHS = 24						-- WAS 24 | after this many months remove the history of lost convoys to not bloat savegames and memory since there is no way to see them anyway
NDefines.NNavy.SUPREMACY_PER_SHIP_BASE = 1                        -- WAS 100 | reduced to relatively nerf subs in terms of naval supremacy, as most of their supremacy comes from a base value of 100
NDefines.NNavy.NAVAL_TRANSFER_BASE_SPEED = 10                       -- WAS 6 | Increased so moving troops around the world is faster and theaters dont seem so disconnected (particularly aimed at improving Allied gameplay experience)
NDefines.NNavy.ADMIRAL_TASKFORCE_CAP = 40 								-- base chance for hit
NDefines.NNavy.COMBAT_MIN_HIT_CHANCE = 0.03									-- never less hit chance then this?
NDefines.NNavy.HIT_PROFILE_SPEED_FACTOR	= 1		-- factors speed value when determining it profile (Vis * HIT_PROFILE_MULT * Ship Hit Profile Mult) prev: vis/speed now: vis/(speed*HIT_PROFILE_SPEED_FACTOR+HIT_PROFILE_SPEED_BASE). wird immer noch gesquared
NDefines.NNavy.GUN_HIT_PROFILES = { -- hit profiles for guns, if target ih profile is lower the gun will have lower accuracy
		75.0,	-- big guns
		110.0,	-- torpedos
		45.0,	-- small guns
	}
NDefines.NNavy.CONVOY_HIT_PROFILE = 207 -- vanilla 120
NDefines.NNavy.BASE_GUN_COOLDOWNS = { -- number of hours for a gun to be ready after shooting
		1.0,	-- big guns
		3.0,	-- torpedos
		1.0,	-- small guns
	}
NDefines.NNavy.CARRIER_ONLY_COMBAT_ACTIVATE_TIME = 0
NDefines.NNavy.CAPITAL_ONLY_COMBAT_ACTIVATE_TIME = 6
NDefines.NAir.CARRIER_HOURS_DELAY_AFTER_EACH_COMBAT = 2         	-- how often carrier planes do battle inside naval combat
NDefines.NNavy.CARRIER_STACK_PENALTY = 6  							-- The most efficient is 4 carriers in combat. 5+ brings the penalty to the amount of wings in battle.
NDefines.NNavy.CARRIER_STACK_PENALTY_EFFECT = 0.09 					-- Each carrier above the optimal amount decreases the amount of airplanes being able to takeoff by such %.
NDefines.NNavy.NAVAL_STRIKE_CARRIER_MULTIPLIER = 18.0   
NDefines.NNavy.ALL_SHIPS_ACTIVATE_TIME = 12
NDefines.NNavy.COMBAT_ARMOR_PIERCING_DAMAGE_REDUCTION = -0.75 --vanilla -0.9

NDefines.NNavy.COMBAT_MIN_DURATION = 12

NDefines.NNavy.INITIAL_ALLOWED_DOCKYARD_RATIO_FOR_REPAIRS = 1
NDefines.NNavy.NAVY_VISIBILITY_BONUS_ON_RETURN_FOR_REPAIR = 0.2
NDefines.NNavy.SUBMARINE_ESCAPE_RATIOS = { -- subs will escape battle in convoy raid if there are enemies that can attack
		1000,     -- do not engage
		15,   -- low
		3.0,   -- medium
		3.0,   -- high
		3.0,   -- I am death incarnate!
	}

NDefines.NNavy.ANTI_AIR_ATTACK_TO_AMOUNT = 0.005	-- Balancing value to convert equipment stat anti_air_attack to the random % value of airplanes being hit.
NDefines.NNavy.DEPTH_CHARGES_HIT_PROFILE = 70.0
NDefines.NNavy.SUBMARINE_REVEAL_POW = 1.8		-- A scaling factor that is applied to the reveal chance in order to make large differences in detection vs visibility more pronounced
NDefines.NNavy.NAVAL_COMBAT_SUB_DETECTION_FACTOR = 5.0      -- balance value for sub detection in combat by ships
NDefines.NNavy.SUBMARINE_HIDE_TIMEOUT = 12		-- Amount of in-game-hours that takes the submarine (with position unrevealed), to hide.
NDefines.NNavy.SUBMARINE_REVEALED_TIMEOUT = 16		-- Amount of in-game-hours that makes the submarine visible if it is on the defender side.
NDefines.NNavy.SUBMARINE_REVEAL_BASE_CHANCE = 30		-- Base factor for submarine detection. It's modified by the difference of a spotter's submarines detection vs submarine visibility. Use this variable for game balancing. setting this too low will cause bad spotting issues.
NDefines.NNavy.ESCAPE_SPEED_HIDDEN_SUB = 0.5									-- hidden subs get faster escape speed
NDefines.NNavy.ESCAPE_SPEED_SUB_BASE = -0.20
NDefines.NNavy.NAVAL_COMBAT_AIR_SUB_DETECTION_FACTOR = 0.1
NDefines.NNavy.DETECTION_CHANCE_MULT_AIR_SUPERIORITY_BONUS = 0.2
NDefines.NNavy.COMBAT_DAMAGE_TO_STR_FACTOR = 0.3 -- casting damage value to ship strength multiplier. Use it ot balance the game difficulty.
NDefines.NNavy.COMBAT_DAMAGE_TO_ORG_FACTOR = 0.5	--- casting damage value to ship organisation multiplier. Use it to balance the game difficulty.
NDefines.NNavy.MAX_ORG_ON_MANUAL_MOVE = 1.0	-- org will clamped to this ratio on manual move
NDefines.NNavy.TRAINING_EXPERIENCE_FACTOR = 0.6
NDefines.NNavy.UNIT_TRANSFER_DETECTION_CHANCE_BASE = 1.0  -- unit transfer and naval invasion base chance detection percentage (if this fails, no detection is done on that tick)
NDefines.NNavy.UNIT_TRANSFER_SPOTTING_SPEED_MULT = 1.0
NDefines.NNavy.NAVAL_INVASION_SPOTTING_SPEED_MULT = 10.0	-- spotting speed mult against naval invasion armies
NDefines.NNavy.BASE_SPOTTING_EFFECT_FOR_INITIAL_UNIT_TRANSFER_SPOTTING = 2		-- same as BASE_SPOTTING_EFFECT_FOR_INITIAL_CONVOY_SPOTTING, but for naval transfer convoys
NDefines.NNavy.BASE_SPOTTING_EFFECT_FOR_INITIAL_NAVAL_INVASION_SPOTTING = 2	-- same as BASE_SPOTTING_EFFECT_FOR_INITIAL_CONVOY_SPOTTING, but for naval invasion convoys
NDefines.NNavy.NAVAL_INVASION_PREPARE_HOURS = 48								-- base days needed to prepare a naval invasion
NDefines.NNavy.NAVAL_INVASION_PLAN_CAP = 100									-- base cap of naval invasions can be planned at the same time
NDefines.NNavy.BASE_NAVAL_INVASION_DIVISION_CAP = 100							-- base cap of divisions that can be assigned in a naval invasion
NDefines.NNavy.DOMINANCE_CONTROLLED_THRESHOLD_RATIO = 0.55 -- Percentage of needed dominance control over enemies for you and friendlies to control a strategic sea region
NDefines.NNavy.NAVAL_HEADQUARTERS_FIRST_ADJACENT_FACTOR = 0.0						-- naval dominance from naval headquarters is multiplied by this value for the first adjacent region
NDefines.NNavy.NAVAL_HEADQUARTERS_SECOND_ADJACENT_FACTOR = 0.0					-- naval dominance from naval headquarters is multiplied by this value for the second adjacent region

NDefines.NNavy.MISSION_DOMINANCE_RATIOS = { -- dominance multipliers for different mission types
		0.0, -- HOLD
		1.0, -- PATROL
		1.0, -- STRIKE FORCE
		0.5, -- CONVOY RAIDING
		1.0, -- CONVOY ESCORT
		0.0, -- MINES PLANTING
		0.0, -- MINES SWEEPING
		0.0, -- TRAIN
		0.0, -- RESERVE_FLEET
		1.0, -- NAVAL_INVASION_SUPPORT
	}

NDefines.NNavy.ORG_COST_WHILE_MOVING = { -- org cost while the ships are moving
		0.4, -- HOLD
		0.4, -- PATROL		
		0.4, -- STRIKE FORCE 
		0.4, -- CONVOY RAIDING
		0.4, -- CONVOY ESCORT
		0.4, -- MINES PLANTING	
		0.4, -- MINES SWEEPING	
		0.4, -- TRAIN
		0.4, -- RESERVE_FLEET
		0.4, -- NAVAL_INVASION_SUPPORT
	}
NDefines.NNavy.NAVY_PIERCING_THRESHOLDS = {					-- Our piercing / their armor must be this value to deal damage fraction equal to the index in the array below [higher number = higher penetration]. If armor is 0, 1.00 will be returned.
		1.00,
		0.80,
		0.50,
		0.30,
		0.15,
		0.00 --there isn't much point setting this higher than 0
}

NDefines.NNavy.NAVY_PIERCING_THRESHOLD_CRITICAL_VALUES = {	-- 0 armor will always receive maximum damage (so add overmatching at your own peril). the system expects at least 2 values, with no upper limit.
		3.00,
		1.25,
		0.75,
		0.50,
		0.25,
		0.00 -- For criticals, you could reduce crit chance unlike damage in army combat, but we do not for now.
}

NDefines.NNavy.NAVY_PIERCING_THRESHOLD_DAMAGE_VALUES = {	-- 0 armor will always receive maximum damage (so add overmatching at your own peril). the system expects at least 2 values, with no upper limit.
		1.00,
		0.85,
		0.55,
		0.35,
		0.20,
		0.1 --
}

NDefines.NNavy.CONVOY_DEFENSE_MAX_CONVOY_TO_SHIP_RATIO = 20.0		-- each ship in convoy defense mission can at most cover this many convoys without losing efficiency
NDefines.NNavy.CONVOY_ROUTE_SIZE_CONVOY_SCALE = 0.4     -- scales impact of convoy route size (0 to turn off)
NDefines.NNavy.SUPREMACY_PER_SHIP_PER_MANPOWER = 0.07						-- supremacy of a ship is calculated using its IC, manpower and a base define
NDefines.NNavy.SUPREMACY_PER_SHIP_BASE = 15.0
NDefines.NNavy.SUPPLY_NEED_FACTOR = 0.01
NDefines.NMilitary.SHIP_MORALE_TO_ORG_REGAIN_BASE = 0.5 --vanilla 0.2
---Air
NDefines.NAir.NAVAL_COMBAT_EXTERNAL_PLANES_JOIN_RATIO = 0.015 -- vanilla 0.05
NDefines.NAir.COMBAT_DAMAGE_SCALE_CARRIER = 5.0    -- same as above but used inside naval combat for carrier battles
NDefines.NAir.CARRIER_HOURS_DELAY_AFTER_EACH_COMBAT = 2          -- how often carrier planes do battle inside naval combat
NDefines.NAir.NAVAL_STRIKE_DAMAGE_TO_STR = 0.55
NDefines.NAir.NAVAL_KAMIKAZE_DAMAGE_MULT = 5.0  -- vanilla is like 20
NDefines.NAir.NAVAL_STRIKE_DAMAGE_TO_ORG = 0.2
NDefines.NAir.NAVAL_STRIKE_DETECTION_BALANCE_FACTOR = 0.6		-- Value used to scale the surface_visibility stats to balance the gameplay, so 100% detection chance still won't spam the strikes.
NDefines.NAir.NAVAL_STRIKE_CARRIER_MULTIPLIER = 5 --was 2.5 but i increased overall naval damage        -- damage bonus when planes are in naval combat where their carrier is present (and can thus sortie faster and more effectively)	
NDefines.NAir.DISRUPTION_FACTOR_CARRIER = 1.0
NDefines.NAir.CARRIER_COMBAT_DAMAGE_STATS_MULTIPLIER = 0.5
NDefines.NAir.NAVAL_STRIKE_TARGETTING_TO_AMOUNT = 0.4

	---------------------------------------------------------------
NDefines.NTechnology.LICENSE_PRODUCTION_TECH_BONUS = 0.10	-- WAS 0.2 | LICENSES ARE FREE SO TECH BONUS IS TOO MUCH | License production tech bonus
NDefines.NAI.RESEARCH_BONUS_FACTOR = 200.0
NDefines.NAI.RESEARCH_AHEAD_BONUS_FACTOR = 200.0
NDefines.NAI.MAX_AHEAD_RESEARCH_PENALTY = 12
NDefines.NAI.DEPLOY_MIN_TRAINING_SURRENDER_FACTOR = 0.01
NDefines.NAI.DEPLOY_MIN_EQUIPMENT_SURRENDER_FACTOR = 0.2
---------------------------------------------------------------  
---------------------------------------------------------------
------HORST RESISTANCE, COMPLIANCE, AND SPY AGENCY CHANGES-------
---------------------------------------------------------------
NDefines.NCountry.MAX_PROPAGANDA_STABILITY_IMPACT = 0 --  	Max total penalty from operative performing the propaganda mission in a country 
NDefines.NCountry.MAX_PROPAGANDA_WAR_SUPPORT_IMPACT = 0		-- Max total penalty from operative performing the propaganda mission in a country
--NDefines.NCountry.PROPAGANDA_STABILITY_DAILY_DECAY = 0.002		-- Amount of stability recovered daily from propaganda effort
NDefines.NCountry.INTEL_FROM_ALLIANCE_FACTOR = 0.6
NDefines.NOperatives.OPERATIVE_BASE_BOOST_IDEOLOGY = 0				-- Base amount of daily ideology drift provoked by an operative
-- NDefines.NOperatives.PROPAGANDA_COUNTRY_STACKING_FACTOR = 0.2
-- NDefines.NOperatives.PROPAGANDA_OPERATIVE_STACKING_FACTOR = 0.2
-- NDefines.NOperatives.AGENCY_CREATION_DAYS = 0						-- Number of days needed to create an intelligence agency
-- NDefines.NOperatives.AGENCY_CREATION_FACTORIES = 0
NDefines.NOperatives.AGENCY_UPGRADE_DAYS = 100						-- Number of days needed to upgrade an intelligence agency
NDefines.NOperatives.BASE_COUNTER_INTELLIGENCE_RATING = 0.5						-- Number of days needed to upgrade an intelligence agency
NDefines.NOperatives.BECOME_SPYMASTER_PP_COST = 0					-- Number of political power used to become Spy Master
NDefines.NOperatives.BECOME_SPYMASTER_MIN_UPGRADES = 0			-- Number of agency upgrades you need before becoming Spy Master						-- Number of days needed to upgrade an intelligence agency
NDefines.NOperatives.AGENCY_UPGRADE_PER_OPERATIVE_SLOT = 1
NDefines.NOperatives.BUILD_INTEL_NETWORK_DAILY_XP_GAIN = 3
NDefines.NOperatives.QUIET_INTEL_NETWORK_DAILY_XP_GAIN = 1
NDefines.NOperatives.COUNTER_INTELLIGENCE_DAILY_XP_GAIN = 1.5
NDefines.NOperatives.ROOT_OUT_RESISTANCE_DAILY_XP_GAIN = 1.5
NDefines.NOperatives.AGENCY_OPERATIVE_RECRUITMENT_TIME = 5
NDefines.NOperatives.OPERATION_COMPLETION_XP = 100
NDefines.NOperatives.OPERATIVE_BASE_BOOST_IDEOLOGY = 0
NDefines.NOperatives.OPERATIVE_BASE_PROPAGANDA_POWER = 0
NDefines.NOperatives.ON_CAPTURE_COUNTERINTELLIGENCE_OPERATIVE_XP_GAIN = 300
NDefines.NOperatives.INTEL_NETWORK_MIN_VP_TO_TARGET = 1
NDefines.NOperatives.INTEL_NETWORK_MIN_STRENGTH_TO_TARGET = 1
NDefines.NOperatives.OPERATIVE_BASE_CONTROL_TRADE_DRIFT = 1				-- The base daily drift in trade influence caused by an operative
NDefines.NOperatives.CONTROL_TRADE_MAX_INFLUENCE = 200.0					-- The maximum amount of trade influence that can be gained through the control trade mission
--DISABLED FROM HFU NDefines.NIntel.ARMY_INTEL_COMBAT_BONUS_FACTOR_ATTACK = 0.5 -- multiplier for attack value of intel combat bonus
NDefines.NIntel.DYNAMIC_INTEL_SOURCE_EVENT_MAXIMUMS = { 200, 200, 200, 200 } --Intel from events was 40
NDefines.NIntel.DYNAMIC_INTEL_SOURCE_EVENT_ABSOLUTE_MAXIMUMS = { 200, 200, 200, 200 } --Intel from events was 50
NDefines.NOperatives.OPERATIVE_SLOTS_FROM_FACTION_MEMBERS_FOR_SPY_MASTER = {   --Not from HFU, Thrasy added this 
        0,     0, -- 0 operative for [0, 10)
        0,      0, -- 0.25 operative for [10, 50)
        0,     0, -- 0.5 operative for >= 50
	}
NDefines.NIntel.ARMY_INTEL_COMBAT_BONUS_MAX_BONUS = 0.0 -- Removing meme modifiers
---------------------------------------------------------------
----------END OF HORST SPY/AGENCY/INTELLIGENCE CHANGES-----------
---------------------------------------------------------------
NDefines.NAI.GIVE_STATE_CONTROL_MIN_CONTROLLED = 0       -- WAS 1
NDefines.NAI.GIVE_STATE_CONTROL_MIN_CONTROLLED = 0       -- WAS 1
NDefines.NAI.GIVE_STATE_CONTROL_MIN_CONTROL_DIFF = 0     -- WAS 2
NDefines.NAI.GIVE_STATE_CONTROL_BASE_SCORE = 1         -- WAS 50
NDefines.NAI.MINIMUM_EQUIPMENT_TO_ASK_LEND_LEASE = -1999998	-- WAS 100, changed to prevent exploiting AI for ~150k guns at the start of WW2 | AI will accept to lend lease this equipment only if our stockpile is less than that.
NDefines.NAI.DIPLOMACY_REJECTED_WAIT_MONTHS_BASE = 24                --up from 4 | should cut down on AI spam
NDefines.NAI.DIPLOMACY_ACCEPT_ATTACHE_OPINION_PENALTY = 0
NDefines.NAI.DIPLOMACY_SEND_EXPEDITIONARY_BASE = 0
NDefines.NAI.JOIN_ALLY_BASE_DESIRE = -500					-- exactly what it says
NDefines.NAI.JOIN_ALLY_DEMOCRATIC_DESIRE = -500			-- Desire to call ally added for democratic AI
NDefines.NAI.JOIN_ALLY_NEUTRAL_DESIRE = -500			-- Desire to call ally added for neutral AI
NDefines.NAI.JOIN_ALLY_FASCIST_DESIRE = -500				-- Desire to call ally added for fascist AI
NDefines.NAI.JOIN_ALLY_COMMUNIST_DESIRE = -500			-- Desire to call ally added for communist AI
NDefines.NAI.CALL_ALLY_BASE_DESIRE = -500					-- exactly what it says
NDefines.NAI.CALL_ALLY_DEMOCRATIC_DESIRE = -500			-- Desire to call ally added for democratic AI
NDefines.NAI.CALL_ALLY_NEUTRAL_DESIRE = -500			-- Desire to call ally added for neutral AI
NDefines.NAI.CALL_ALLY_FASCIST_DESIRE = -500				-- Desire to call ally added for fascist AI
NDefines.NAI.CALL_ALLY_COMMUNIST_DESIRE = -500			-- Desire to call ally added for communist AI
NDefines.NAI.DIPLOMATIC_ACTION_PROPOSE_SCORE = 500		-- AI must score a diplomatic action at least this highly to propose it themselves
NDefines.NAI.NUM_SILOS_PER_CIVILIAN_FACTORIES = 0					-- ai will try to build a silo per this ratio of civ factories
NDefines.NAI.NUM_SILOS_PER_MILITARY_FACTORIES = 0					-- ai will try to build a silo per this ratio of mil factories
NDefines.NAI.NUM_SILOS_PER_DOCKYARDS = 0							-- ai will try to build a silo per this ratio of dockyards
---------------------------------------------------------------
NDefines.NAI.BASE_RELUCTANCE = 9
NDefines.NDiplomacy.VOLUNTEERS_PER_TARGET_PROVINCE = 0
NDefines.NDiplomacy.VOLUNTEERS_PER_COUNTRY_ARMY = 0
NDefines.NDiplomacy.DIPLOMACY_SEND_MAX_FACTION = 0