local Inventory = require 'modules.inventory.server'
local Items = require 'modules.items.server'

local function normalizeOrganizations(organizations)
    local groups = {}

    for org, data in pairs(organizations or {}) do
        groups[org] = data.grade
    end

    return groups
end

local function loadPlayerInventory(source)
    local character = exports['novarift-core']:GetPlayerCharacter(source)
    if (not character) then return end
    
    character.source = source
    character.sex = character.gender
    character.identifier = character.citizen_id
    character.dateofbirth = character.birth_date
    character.groups = normalizeOrganizations(character.organizations)

    server.setPlayerInventory(character)
end

SetTimeout(500, function ()
    server.GetPlayerFromId = function (source)
        return exports['novarift-core']:GetPlayerCharacter(source)
    end

    for _, player in pairs(exports['novarift-core']:GetNovariftPlayers()) do
        loadPlayerInventory(player.source)
    end
end)

---@diagnostic disable-next-line: duplicate-set-field
function server.setPlayerData(character)
    return {
        source = character.source,
        sex = character.gender,
        name = character.name,
        identifier = character.identifier,
        dateofbirth = character.birth_date,
        groups = normalizeOrganizations(character.organizations),
    }
end

---@diagnostic disable-next-line: duplicate-set-field
function server.hasLicense(inv, license)

    local character = server.GetPlayerFromId(inv.id)
    if (not character) then return end

    -- Check for license

    return false

end

---@diagnostic disable-next-line: duplicate-set-field
function server.buyLicense(inv, license)
    if (server.hasLicense(inv, license)) then return false, 'already_have' end
    -- if (Inventory.GetItem(inv, 'money', false, true) < license.price) then return false, 'can_not_afford' end

    -- Inventory.RemoveItem(inv, 'money', license.price)
    -- Create Licenses

    return true, 'have_purchased'
end

AddEventHandler('novarift-core:server:player:spawned', loadPlayerInventory)
AddEventHandler('novarift-core:server:player:unloaded', function (source)
    Wait(2000)
    server.playerDropped(source)
end)

AddEventHandler('novarift-core:server:player:organizations:updated', function (source, organizations)
    local inventory = Inventory(source)
    if (not inventory) then return end

---@diagnostic disable-next-line: undefined-field
    inventory.player.groups = normalizeOrganizations(organizations)
end)