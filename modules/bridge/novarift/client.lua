RegisterNetEvent('novarift-core:client:player:organizations:updated', function (organizations)
    PlayerData.groups = organizations or {}
    OnPlayerData('groups', PlayerData.groups)
end)

AddStateBagChangeHandler('logged_in', ('player:%s'):format(cache.serverId), function (_, __, logged)
    local playerState = LocalPlayer.state

    if (playerState.logged_in == logged) then return end

    if (logged) then
        local character = exports['novarift-core']:GetCharacter()
        if (not character) then return end

        PlayerData.groups = character.organizations
        OnPlayerData('groups', character.organizations)
    else
        client.onLogout()
    end
end)

AddStateBagChangeHandler('condition', ('player:%s'):format(cache.serverId), function (_, __, value)
    local playerState = LocalPlayer.state

    if (playerState.condition == value) then return end
    if (not playerState.logged_in) then return end

    PlayerData.dead = value ~= 'alive'
    OnPlayerData('dead', value ~= 'alive')
end)

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