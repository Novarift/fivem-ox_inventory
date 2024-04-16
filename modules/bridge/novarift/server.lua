local Inventory = require 'modules.inventory.server'
local Items = require 'modules.items.server'

local function loadPlayerInventory(source)
    local character = exports['novarift-core']:GetPlayerCharacter(source)
    if (not character) then return end

    character.source = source
    character.sex = character.gender
    character.dateofbirth = character.birth_date
    character.identifier = character.citizen_id

    server.setPlayerInventory(character, character.inventory)
end

SetTimeout(500, function ()
    server.GetPlayerFromId = function (source)
        return exports['novarift-core']:GetPlayerCharacter(source)
    end

    for _, player in pairs(exports['novarift-core']:GetPlayers()) do
        loadPlayerInventory(player.source)
    end
end)

function server.setPlayerData(character)
    return {
        source = character.source,
        name = character.name,
        sex = character.gender,
        organizations = character.organizations,
        dateofbirth = character.birth_date,
    }
end

function server.hasLicense(inv, license)

    local character = server.GetPlayerFromId(inv.id)
    if (not character) then return end

    -- Check for license

    return false

end

function server.buyLicense(inv, license)
    if (server.hasLicense(inv, license)) then return false, 'already_have' end
    -- if (Inventory.GetItem(inv, 'money', false, true) < license.price) then return false, 'can_not_afford' end

    -- Inventory.RemoveItem(inv, 'money', license.price)
    -- Create Licenses

    return true, 'have_purchased'
end

AddEventHandler('novarift-core:server:player:spawned', loadPlayerInventory)
AddEventHandler('novarift-core:server:player:unloaded', server.playerDropped)

AddEventHandler('novarift-core:server:player:organizations:updated', function (source, organizations)
    local inventory = Inventory(source)
    if (not inventory) then return end

    inventory.player.groups = organizations
end)