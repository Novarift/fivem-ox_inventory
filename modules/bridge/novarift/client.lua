local Weapon = require 'modules.weapon.client'

local function normalizeOrganizations(organizations)
    local groups = {}

    for org, data in pairs(organizations or {}) do
        groups[org] = data.grade
    end

    return groups
end

RegisterNetEvent('novarift-core:client:player:organizations:updated', function (organizations)
    local groups = normalizeOrganizations(organizations or {})
    PlayerData.groups = groups

    OnPlayerData('groups', groups)
end)

AddStateBagChangeHandler('logged_in', ('player:%s'):format(cache.serverId), function (_, __, logged)
    if (LocalPlayer.state.logged_in == logged) then return end

    if (not logged) then
        return client.onLogout()
    end

    local character = exports['novarift-core']:GetCharacter()
    if (not character) then return end

    local groups = normalizeOrganizations(character.organizations or {})
    PlayerData.groups = groups

    OnPlayerData('groups', groups)
end)

AddStateBagChangeHandler('condition', ('player:%s'):format(cache.serverId), function (_, __, value)
    local playerState = LocalPlayer.state

    if (playerState.condition == value) then return end
    if (not playerState.logged_in) then return end

    PlayerData.dead = value ~= 'alive'
    OnPlayerData('dead', value ~= 'alive')
end)

local attributes = {
    'handcuffed',
    -- 'escorting', -- I wish this would work, but ox_inventory disables vehicle entry
    'escorted'
}

for _, attribute in pairs(attributes) do
    AddStateBagChangeHandler(attribute, ('player:%s'):format(cache.serverId), function (_, __, value)
        local state = not not value

        PlayerData[attribute] = state

        local any = false

        for _, attr in pairs(attributes) do
            if (PlayerData[attr]) then
                any = true
                break
            end
        end

        LocalPlayer.state:set('invBusy', any, false)

        if (not state) then return end

        Weapon.Disarm()
    end)
end

---@diagnostic disable-next-line: duplicate-set-field
function client.setPlayerStatus(values)
    local event

    for name, value in pairs(values) do
		-- compatibility for ESX style values
		if value > 100 or value < -100 then
			value = value * 0.0001
		end

        event = value > 0 and 'add' or 'remove'

        lib.callback.await(('novarift-core:server:player:needs:%s'):format(event), false, name, math.abs(value))
    end
end