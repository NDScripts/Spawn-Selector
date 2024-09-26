Config = {}

Config.SpawnSelectorCommand = true

Config.SpawnCords = vector4(1127.14, -645.29, 55.79, 281.89)
-- General spawn locations (e.g., different apartments or public locations)
Config.SpawnLocations = {
    { label = 'Downtown Apartment', location = vector4(325.0, -230.0, 54.0, 160.0) },
    { label = 'Vinewood Apartment', location = vector4(497.0, 197.0, 104.0, 347.0) },
    { label = 'Police Department', location = vector4(426.0, -980.0, 30.0, 274.0) },
    { label = 'Sheriff Department', location = vector4(1855.0, 3682.0, 34.0, 31.0) },
    { label = 'Paleto Bay Motel', location = vector4(-162.0, 6393.0, 31.0, 46.0) }
}


Config.timeout = 10 -- in seconds
-- Allow spawning at last known location
Config.LastLocation = true

Config.Notification = function(message, duration, type)
    ESX.ShowNotification(message)
end

-- Translations
Config.Translate = {
    ['spawn'] = 'You have been spawned at your chosen location.!',
    ['cooldown'] = 'Musíš ještě počkat než budeš moct si změnit lokaci. konkrétně: '..tostring(Config.timeout).. 'Sekund',
    ['cooldown_end'] = 'Už si konečně můžeš změnit lokaci',
    ['lastlocation_title'] = 'Last Location',
    ['lastlocation_description'] = 'Spawn at your last known location',
    ['title'] = 'Choose Spawn Location',
    ['description'] = 'Spawn at '
}

-- not working

Config.DiscordWebhookURL = 'https://discord.com/api/webhooks/1284780260763893811/e8WKxyBXuyU8e0kt_L-0f_rV9k2JKYIWjH1xmvsxKI4rV0JYjyW1t8J7nQjBbiGEhLM7'

-- Discord log colors
Config.DiscordLogs = {
    Colors = {
        Blue = 3447003, -- Blue color in decimal
        -- Add other colors as needed
    }
}