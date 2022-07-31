ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count, showNotification)
	for i,v in pairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.PlayerData.inventory[i].count = count
		end
	end
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, count, silent)
	for i,v in pairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.PlayerData.inventory[i].count = count
		end
	end
end)


function IsPlayerHasItem(name, count)
	if not count then count = 1 end
	for i,v in pairs(ESX.PlayerData.inventory) do
		if v.name == name then
			return v.count >= count
		end
	end
end
exports('IsPlayerHasItem', IsPlayerHasItem)
