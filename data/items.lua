return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	['handcuffs'] = {
		label = 'Handcuffs',
		stack = false,
		consume = 0.05,
		weight = 50,
		allowArmed = false,
		client = {
			export = 'novarift-tie.handcuffs',
		}
	},

	['ziptie'] = {
		label = 'Ziptie',
		weight = 0.01,
		stack = true,
		consume = 1,
		allowArmed = false,
		client = {
			export = 'novarift-tie.ziptie',
		}
	},


	['card_enforcement'] = {
		label = 'Enforcement Card',
		stack = false,
		weight = 20,
	},

	['armor'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		allowArmed = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			disable = { move = true, car = true, combat = true },
			usetime = 3500,
			cancel = true,
		},
		server = {
			export = 'novarift-organizations.armor',
		},
		data = {
			armor = 50,
		},
	},

	['armor_heavy'] = {
		label = 'Heavy Bulletproof Vest',
		weight = 6000,
		stack = false,
		allowArmed = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			disable = { move = true, car = true, combat = true },
			usetime = 7000,
			cancel = true,
		},
		server = {
			export = 'novarift-organizations.armor',
		},
		data = {
			armor = 100,
		}
	},

	['placeables_spike'] = {
		label = 'Spikes',
		weight = 5000,
		stack = true,
		allowArmed = false,
		client = {
			export = 'novarift-organization-police.placeables',
			disable = { move = true, car = true, combat = true },
			usetime = 5000,
			cancel = true,
		},
	},

	['placeables_cone'] = {
		label = 'Cone',
		weight = 500,
		stack = true,
		allowArmed = false,
		client = {
			export = 'novarift-organization-police.placeables',
			disable = { move = true, car = true, combat = true },
			usetime = 500,
			cancel = true,
		},
	},

	['placeables_barricade'] = {
		label = 'Barricade',
		weight = 1000,
		stack = true,
		allowArmed = false,
		client = {
			export = 'novarift-organization-police.placeables',
			disable = { move = true, car = true, combat = true },
			usetime = 1000,
			cancel = true,
		},
	},
	
	['placeables_chair'] = {
		label = 'Chair',
		weight = 800,
		stack = true,
		allowArmed = false,
		client = {
			export = 'novarift-organization-police.placeables',
			disable = { move = true, car = true, combat = true },
			usetime = 800,
			cancel = true,
		},
	},
	
	['placeables_table'] = {
		label = 'Table',
		weight = 1500,
		stack = true,
		allowArmed = false,
		client = {
			export = 'novarift-organization-police.placeables',
			disable = { move = true, car = true, combat = true },
			usetime = 1500,
			cancel = true,
		},
	},

	['placeables_tent'] = {
		label = 'Tent',
		weight = 10000,
		stack = true,
		allowArmed = false,
		client = {
			export = 'novarift-organization-police.placeables',
			disable = { move = true, car = true, combat = true },
			usetime = 10000,
			cancel = true,
		},
	},

	['painkillers'] = {
		label = 'Painkillers',
		weight = 10,
		stack = true,
		allowArmed = true,
		data = {
			stress = 10.0,
			injury = 2,
		},
		client = {
			export = 'novarift-medical.soothingItem',
			usetime = 1000,
			cancel = true,
		},
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		stack = true,
		allowArmed = false,
		data = {
			threshold = 0.6,
			bleeding = 2,
			health = 25,
		},
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 49.0, 0.0), bone = 28422, rotOrder = 2 },
			disable = { move = true, car = true, combat = true },
			export = 'novarift-medical.healingItem',
			usetime = 2500,
			cancel = true,
		}
	},

	['medkit'] = {
		label = 'Medical Kit',
		degrade = 60 * 12,
		weight = 350,
		stack = true,
		allowArmed = false,
		data = {
			threshold = 1.0,
			bleeding = 3,
			health = 50,
		},
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_stat_pack_01`, pos = vec3(0.0, 0.0, 0.0), rot = vec3(344.0, 91.0, 305.0), bone = 60309, rotOrder = 2 },
			disable = { move = true, car = true, combat = true },
			export = 'novarift-medical.healingItem',
			usetime = 5000,
			cancel = true,
		}
	},

	['ifak'] = {
		label = 'IFAK',
		degrade = 60 * 3,
		weight = 500,
		stack = true,
		allowArmed = false,
	},

	-- ['clothes'] = {
	-- 	label = 'Clothes',
	-- 	allowArmed = false,
	-- 	stack = false,
	-- 	consume = 1,
	-- 	client = {
	-- 		anim = { dict = 'clothingtie', clip = 'try_tie_negative_a' },
	-- 		disable = { move = true, car = true, combat = true },
	-- 		export = 'novarift-clothes.equip',
	-- 		usetime = 3500,
	-- 		cancel = true,
	-- 	},
	-- },
}
