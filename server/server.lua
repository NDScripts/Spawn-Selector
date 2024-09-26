
ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('noname:DeadStatus', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local result = MySQL.query.await('SELECT is_dead FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier})
    if result[1] then
        cb(result[1].is_dead)
    else
        cb(nil)
    end
end)

ESX.RegisterServerCallback('noname:LastPosition', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local result = MySQL.query.await('SELECT position FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier})
    if result[1] then
        cb(json.decode(result[1].position))
    else
        cb(nil)
    end
end)

function sendToDiscordLogs(oocNick, icNick, characterLicense, discord, steam, position)
    local webhookURL = Config.DiscordWebhookURL
    local color = Config.DiscordLogs.Colors.Blue
    local timestamp = os.date("%Y-%m-%d %H:%M:%S")
    local logEntry = {
        {
            ["color"] = color,
            ["title"] = "Spawn Selector Logs",
            ["fields"] = {
                {
                    ["name"] = "OOC Nick",
                    ["value"] = oocNick,
                    ["inline"] = true
                },
                {
                    ["name"] = "IC Nick",
                    ["value"] = icNick,
                    ["inline"] = true
                },
                { 
                    ["name"] = "Character License",
                    ["value"] = characterLicense,
                    ["inline"] = true
                },
                {
                    ["name"] = "Discord",
                    ["value"] = discord,
                    ["inline"] = true
                },
                {
                    ["name"] = "Steam",
                    ["value"] = steam,
                    ["inline"] = true
                },
                {
                    ["name"] = "Timestamp",
                    ["value"] = timestamp,
                    ["inline"] = true
                },
                {
                    ["name"] = "Position",
                    ["value"] = position,  -- Corrected from "poition"
                    ["inline"] = true
                }
            },
            ["footer"] = {
                ["text"] = "Logs by N&D Scripts | Noname :)!",
            }
        }
    }

    PerformHttpRequest(webhookURL, function(err, text, headers)
        if err ~= 0 then
            print(('Failed to send log to Discord: %s'):format(err))
        else
            print('Log sent to Discord successfully.')
        end
    end, 'POST', json.encode({username = "FiveM Logs", embeds = logEntry}), { ['Content-Type'] = 'application/json' })
end


RegisterNetEvent('noname:Discord', function(oocNick, icNick, characterLicense, discord, steam, position)
    -- Call the logging function with the provided data
    sendToDiscordLogs(oocNick, icNick, characterLicense, discord, steam, position)
end)


print('Player Spawn Selector server script is running.')
