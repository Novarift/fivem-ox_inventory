fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'
name 'ox_inventory'
author 'Overextended'
version '2.39.1'
repository 'https://github.com/overextended/ox_inventory'
description 'Slot-based inventory with item metadata support'

dependencies {
    '/server:6116',
    '/onesync',
    'oxmysql',
    'ox_lib',
	'ox_target',
}

shared_script '@ox_lib/init.lua'

ox_libs {
    'locale',
    'table',
    'math',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'init.lua'
}

client_script 'init.lua'

ui_page 'web/build/index.html'

files {
    'client.lua',
    'server.lua',
    'locales/*.json',
    'web/build/index.html',
    'web/build/assets/*.js',
    'web/build/assets/*.css',
    'web/images/*.png',
    'modules/**/shared.lua',
    'modules/**/client.lua',
    'modules/bridge/**/client.lua',
    'data/*.lua',
}

convar_category 'OxInventory' {
	"OxInventory Configuration Options",
	{
		{ "Activate specific event handlers and functions (supported: ox, esx, qb, nd)",                            "$inventory:framework",         "CV_STRING",    "novarift" },
		{ "Number of slots for player inventories",                                                                 "$inventory:slots",             "CV_INT",       "25" },
		{ "Maximum carry capacity for players, in grams (frameworks may override this)",                            "$inventory:weight",            "CV_INT",       "30000" },
		{ "Integrated support for qtarget/ox_target stashes, shops, etc",                                           "$inventory:target",            "CV_BOOL",      "true" },
		{ "Jobs with access to police armoury, evidence lockers, etc",                                              "$inventory:police",            "CV_MULTI",     {"police", "sheriff"} },
		{ "The URL to load item images from",                                                                       "$inventory:imagepath",         "CV_STRING",    "nui://ox_inventory/web/images" },
		{ "Weapons will reload after reaching 0 ammo",                                                              "$inventory:autoreload",        "CV_BOOL",      "false" },
		{ "Blur the screen while accessing the inventory",                                                          "$inventory:screenblur",        "CV_BOOL",      "true" },
		{ "Default hotkeys to access primary and secondary inventories, and hotbar",                                "$inventory:keys",              "CV_MULTI",     { "F2", "K", "TAB" } },
		{ "Enable control action when inventory is open",                                                           "$inventory:enablekeys",        "CV_MULTI",     { "249" } },
		{ "Weapons must be aimed before shooting",                                                                  "$inventory:aimedfiring",       "CV_BOOL",      "true" },
		{ "Show a list of all nearby players when giving items",                                                    "$inventory:giveplayerlist",    "CV_BOOL",      "false" },
		{ "Toggle weapon draw/holster animations",                                                                  "$inventory:weaponanims",       "CV_BOOL",      "true" },
		{ "Toggle item notifications (add/remove)",                                                                 "$inventory:itemnotify",        "CV_BOOL",      "true" },
		{ "Disable drop markers and spawn a prop instead",                                                          "$inventory:dropprops",         "CV_BOOL",      "true" },
		{ "Set the default model used for drop props",                                                              "$inventory:dropmodel",         "CV_STRING",    "prop_med_bag_01b" },
		{ "Disarm the player if an unexpected weapon is in use (i.e. did not use the weapon item)",                 "$inventory:weaponmismatch",    "CV_BOOL",      "true" },
		{ "Ignore weapon mismatch checks for the given weapon type (e.g. ['WEAPON_SHOVEL', 'WEAPON_HANDCUFFS'])",   "$inventory:ignoreweapons",     "CV_MULTI",     {} },
		{ "Suppress weapon and ammo pickups",                                                                       "$inventory:suppresspickups",   "CV_INT",       "1" },
		{ "Compare current version to latest release on GitHub",                                                    "inventory:versioncheck",       "CV_BOOL",      "true" },
		{ "Stashes will be wiped after remaining unchanged for the given time",                                     "inventory:clearstashes",       "CV_STRING",    "6 MONTH" },
		{ "Discord webhook url, used for imageurl metadata content moderation (image embeds)",                      "inventory:webhook",            "CV_STRING",    "" },
		{ "Logging via ox_lib (0: Disable, 1: Standard, 2: Include AddItem/RemoveItem, and all shop purchases)",    "inventory:loglevel",           "CV_INT",       "1" },
		{ "Item prices fluctuate in shops",                                                                         "inventory:randomprices",       "CV_BOOL",      "false" },
		{ "Loot will randomly generate inside unowned vehicles and dumpsters",                                      "inventory:randomloot",         "CV_BOOL",      "true" },
		{ "Minimum job grade to remove items from evidence lockers",                                                "inventory:evidencegrade",      "CV_INT",       "2" },
		{ "Trim whitespace from vehicle plates when checking owned vehicles",                                       "inventory:trimplate",          "CV_BOOL",      "true" },}
}
