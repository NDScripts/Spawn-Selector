# N&D Script

This FiveM script allows players to select their spawn location an interactive menu using `ox_lib`.

## Features
- **Spawn Selector**: Allows players to choose a spawn location, including predefined locations or their last saved position.
- **Customization**: Easily configurable spawn locations in `config.lua`.

## Requirements
- FiveM Server
- ESX Framework
- [ox_lib](https://github.com/overextended/ox_lib) (for context menus)
- [oxmysql](https://github.com/overextended/oxmysql) (for database interactions)

## Installation

1. Dowlond on keymaster
https://keymaster.fivem.net/asset-grants

2. Unzip

3. Put in your resource file

4. Add this event to your multichar

```lua
TriggerEvent('noname:openSpawnMenu')
```
## Links

Youtube:
https://www.youtube.com/channel/UCbOJ-JPkXOTyebj8JfMj4AQ
Discord:
https://discord.gg/nfHb2HHK3a

## Configuration

In the config.lua file, you can customize:

Example:
```lua

Config = {}

Config.SpawnSelectorCommand = true

Config.SpawnCords = vector4(1127.14, -645.29, 55.79, 281.89)

Config.Spawns = {
    { name = "City Center", spawnCoords = vector4(215.8, -810.1, 30.7, 160.0) },
    { name = "Airport", spawnCoords = vector4(-1044.3, -2749.6, 21.4, 330.0) }
}

Config.timeout = 10

Config.LastLocation = true

Config.Notification = function(message, duration, type)
    ESX.ShowNotification(message)
end

-- Translations
Config.Translate = {
    ['spawn'] = 'You have been spawned at your chosen location.!',
    ['cooldown'] = 'You still have to wait before you can change your location. concretely: '..tostring(Config.timeout).. 'Sekund',
    ['cooldown_end'] = 'You can finally change your location',
    ['lastlocation_title'] = 'Last Location',
    ['lastlocation_description'] = 'Spawn at your last known location',
    ['title'] = 'Choose Spawn Location',
    ['description'] = 'Spawn at '
}

-- Not working

Config.DiscordWebhookURL = 'https://discord.com/api/webhooks/1284780260763893811/e8WKxyBXuyU8e0kt_L-0f_rV9k2JKYIWjH1xmvsxKI4rV0JYjyW1t8J7nQjBbiGEhLM7'


-- Discord log colors
Config.DiscordLogs = {
    Colors = {
        Blue = 3447003, -- Blue color in decimal
        -- Add other colors as needed
    }
}

-- text by ChatGPT

![showcase](https://github.com/user-attachments/assets/55537122-b464-41ad-89bc-25fadfda1da3)
