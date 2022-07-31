ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('json:dataStructure')
AddEventHandler('json:dataStructure', function(data)
    print(json.encode(data))
end)

RegisterServerEvent('fc-radialmenu:trunk:server:Door')
AddEventHandler('fc-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('fc-radialmenu:trunk:client:Door', -1, plate, door, open)
end)

ESX.RegisterServerCallback('fc-radialmenu:GetConfig', function(source, cb, i)
    cb(Config.MenuItems[i])
end)

ESX.RegisterServerCallback('fc-radialmenu:GetItems', function(source, cb, name)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(name).count

    cb(item)
end)