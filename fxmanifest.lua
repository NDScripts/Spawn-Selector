fx_version 'cerulean'
game 'gta5'
lua54 'yes'


author 'N&D Scripts | Noname'
description '[FREE] Spawn Selector. Thanks fo using N&D Scripts'
version '1.0.0'

-- Shared script (config file)
shared_script 'config.lua'

-- Client script
client_script 'client/client.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua',
}

escrow_ignore {
    'config.lua'
}