local ox_lib = exports.ox_lib
ESX = exports['es_extended']:getSharedObject()
local lastLocation = nil
local timeout = false


RegisterNetEvent('noname:openSpawnMenu', function()

    SetEntityCoords(PlayerPedId(), Config.SpawnCords)
    FreezeEntityPosition(PlayerPedId(), true)

    local options = {}
    for _, locationData in ipairs(Config.SpawnLocations) do
        table.insert(options, {
            title = locationData.label,
            description = Config.Translate['description'] .. locationData.label,
            event = 'noname:spawnPlayer',
            args = locationData.location
        })
    end

   
    if Config.LastLocation then
        table.insert(options, {
            title = Config.Translate['lastlocation_title'],
            description = Config.Translate['lastlocation_description'],
            event = 'noname:spawnPlayerLast',
            args = lastLocation
        })
    end

    ox_lib:registerContext({
        id = 'player_spawn_selector_menu',
        title = Config.Translate['title'],
        options = options
    })

    ox_lib:showContext('player_spawn_selector_menu')

end)

RegisterNetEvent('noname:spawnPlayer', function(location, oocNick, icNick, characterLicense, discord, steam, position)
    local playerPed = PlayerPedId()


    local x, y, z, heading = table.unpack(location)


    SetEntityCoords(playerPed, x, y, z)
    SetEntityHeading(playerPed, heading)
    FreezeEntityPosition(PlayerPedId(), false)

    Config.Notification(Config.Translate['spawn'], 5000, 'info')
    TriggerServerEvent('noname:Discord')
end)


RegisterNetEvent('noname:spawnPlayerLast', function(location)

    ESX.TriggerServerCallback('noname:LastPosition', function(location)
        if location then
            SetEntityCoords(PlayerPedId(), location.x, location.y, location.z)
            SetEntityHeading(PlayerPedId(), location.w)
            FreezeEntityPosition(PlayerPedId(), false)
            Citizen.Wait(150)
        end
    end)
    TriggerServerEvent('noname:DiscordWebhook')
    Config.Notification(Config.Translate['spawn'], 5000, 'info')
end)

if Config.SpawnSelectorCommand then
RegisterCommand('spawnselector', function()
    if not timeout then
        timeout = true
TriggerEvent('noname:openSpawnMenu')

ESX.SetTimeout(Config.timeout * 1000, function()
    timeout = false
    Config.Notification(Config.Translate['cooldown_end'] ..tostring(Config.timeout), 5000, 'error')
end)
else
Config.Notification(Config.Translate['cooldown'], 5000, 'info')
Wait(0)
end
end)
end

