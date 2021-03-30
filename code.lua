--------------------------------------------------------------------
--                  Code by: 我吃了你妈妈#5871                     --
--------------------------------------------------------------------

-- Getting ESX Shared Object
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--------------------------------------------------------------------
-- Teleport to player command
RegisterCommand('goto', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if args[1] then
        local pArgs = args[1]
        if tonumber(pArgs) then
            local xTarget = ESX.GetPlayerFromId(pArgs)
            if xPlayer then
                if xPlayer.getGroup() == 'admin' then
                    if xTarget then
                        if xPlayer.getIdentifier() == xTarget.getIdentifier() then
                            return xPlayer.showNotification('You can not go to yourself.')
                        end
                        xPlayer.setCoords(xTarget.getCoords())
                        xPlayer.showNotification('You have been teleported to player '..GetPlayerName(pArgs)..'.')
                    else
                        xPlayer.showNotification('We did not found anyone with that server id.')
                    end
                else
                    xPlayer.showNotification('In order to use this command you must be a server admin.')
                end
            end
        else
            xPlayer.showNotification('You should pass a number (Player Server ID) in order to use this command.')
        end
    else
        xPlayer.showNotification('You did not passed any argument so we do not know who you want to teleport to.')
    end
end)

-- Bring a player command
RegisterCommand('bring', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if args[1] then
        local pArgs = args[1]
        if tonumber(pArgs) then
            local xTarget = ESX.GetPlayerFromId(pArgs)
            if xPlayer then
                if xPlayer.getGroup() == 'admin' then
                    if xTarget then
                        if xPlayer.getIdentifier() == xTarget.getIdentifier() then
                            return xPlayer.showNotification('You can not bring yourself.')
                        end
                        xTarget.setCoords(xPlayer.getCoords())
                        xPlayer.showNotification('You have teleported player '..GetPlayerName(pArgs)..' to you.')
                    else
                        xPlayer.showNotification('We did not found anyone with that server id.')
                    end
                else
                    xPlayer.showNotification('In order to use this command you must be a server admin.')
                end
            end
        else
            xPlayer.showNotification('You should pass a number (Player Server ID) in order to use this command.')
        end
    else
        xPlayer.showNotification('You did not passed any argument so we do not know who you want to bring.')
    end
end) 

-- Kick player command
RegisterCommand('kick', function(source, args, rawCommand)
    local _source = source 
    local xPlayer = ESX.GetPlayerFromId(_source)
    if args[1] then
        local pArgs = args[1]
        if tonumber(pArgs) then
            local xTarget = ESX.GetPlayerFromId(pArgs)
            if xPlayer then
                if xPlayer.getGroup() == 'admin' then
                    if xTarget then
                        if xPlayer.getIdentifier() == xTarget.getIdentifier() then
                            return xPlayer.showNotification('You can not kick yourself.')
                        end
                        xPlayer.showNotification('You have kicked player '..GetPlayerName(pArgs)..' from the server.')
                        xTarget.kick('You have been kicked out from this server.')
                    else
                        xPlayer.showNotification('We did not found anyone with that server id.')
                    end
                else
                    xPlayer.showNotification('In order to use this command you must be a server admin.')
                end
            end
        else
            xPlayer.showNotification('You should pass a number (Player Server ID) in order to use this command.')
        end
    else
        xPlayer.showNotification('You did not passed any argument so we do not know who you want to bring.')
    end
end)
