ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(9)
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(job)
    ESX.PlayerData = job
end)

local phone = false
local handcuff = false

RegisterNetEvent('fc-radialmenu:radiocar', function()
    ExecuteCommand('radiocar')
end)

RegisterCommand('nuifix', function()
    SendNUIMessage({
        action = 'forceClose'
    })
end)

local inRadialMenu = false

function openRadial(bool, items)

    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        radial = bool,
        items = items.items
    })
    inRadialMenu = bool
end

function closeRadial(bool)    
    SetNuiFocus(false, false)
    inRadialMenu = bool
end

CreateThread(function()
    for i=1, #Config.MenuItems, 1 do

        RegisterCommand(Config.MenuItems[i].id, function()
            if Config.MenuItems[i].enableMenu() then
                ESX.TriggerServerCallback('fc-radialmenu:GetConfig', function(cb)
                    local inventory = ESX.GetPlayerData().inventory
                    for x=1, #Config.MenuAdd, 1 do
                        if Config.MenuAdd[x].id == cb.id then
                            if (Config.MenuAdd[x].item) then
                                if exports['fc-itemplayerhas']:IsPlayerHasItem(Config.MenuAdd[x].item) then
                                    if Config.MenuAdd[x].addElement() then
                                        for t=1, #Config.MenuAdd[x].items, 1 do
                                            cb.items[#cb.items+1] = Config.MenuAdd[x].items[t];
                                        end
                                    end
                                end
                            elseif not Config.MenuAdd[x].item then
                                if Config.MenuAdd[x].addElement() then
                                    for t=1, #Config.MenuAdd[x].items, 1 do
                                        cb.items[#cb.items+1] = Config.MenuAdd[x].items[t];
                                    end
                                end
                            end
                        end
                    end
                    openRadial(true, cb)
                    SetCursorLocation(0.5, 0.5)
                end, i)
            end
        end)
        RegisterKeyMapping(Config.MenuItems[i].id, Config.MenuItems[i].tip, 'keyboard', Config.MenuItems[i].key)
        Wait(1000)
        TriggerEvent('chat:removeSuggestion', '/'..Config.MenuItems[i].id)
    end
end)

CreateThread(function()
    for i = 1, #Config.MenuEvents, 1 do
        RegisterNetEvent(Config.MenuEvents[i].event)
        AddEventHandler(Config.MenuEvents[i].event, function()
            if Config.MenuEvents[i].item then
                if isHasItem(Config.MenuEvents[i].item) then
                    openRadial(true, Config.MenuEvents[i])
                    SetCursorLocation(0.5, 0.5)
                end
            else
                if Config.MenuEvents[i].enableMenu() then
                    openRadial(true, Config.MenuEvents[i])
                    SetCursorLocation(0.5, 0.5)
                end 
            end
        end)
    end
end)

RegisterNUICallback('closeRadial', function()
    closeRadial(false)
end)

RegisterNUICallback('selectItem', function(data)
    local itemData = data.itemData

    if itemData.type == 'client' then
        TriggerEvent(itemData.event, itemData)
    elseif itemData.type == 'server' then
        TriggerServerEvent(itemData.event, itemData)
    end
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

AddEventHandler('fc-radialmenu:LP', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 0) > 0.0 then
			SetVehicleDoorShut(vehicle, 0, false)
		else
			SetVehicleDoorOpen(vehicle, 0, false)
		end
	end
end)

AddEventHandler('fc-radialmenu:PP', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 1) > 0.0 then
			SetVehicleDoorShut(vehicle, 1, false)
		else
			SetVehicleDoorOpen(vehicle, 1, false)
		end
	end
end)

AddEventHandler('fc-radialmenu:LT', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 2) > 0.0 then
			SetVehicleDoorShut(vehicle, 2, false)
		else
			SetVehicleDoorOpen(vehicle, 2, false)
		end
	end
end)

AddEventHandler('fc-radialmenu:PT', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 3) > 0.0 then
			SetVehicleDoorShut(vehicle, 3, false)
		else
			SetVehicleDoorOpen(vehicle, 3, false)
		end
	end
end)

AddEventHandler('fc-radialmenu:B', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 5) > 0.0 then
			SetVehicleDoorShut(vehicle, 5, false)
		else
			SetVehicleDoorOpen(vehicle, 5, false)
		end
	end
end)

AddEventHandler('fc-radialmenu:M', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 4) > 0.0 then
			SetVehicleDoorShut(vehicle, 4, false)
		else
			SetVehicleDoorOpen(vehicle, 4, false)
		end
	end
end)

function isHasItem(item)
    ESX.TriggerServerCallback('fc-radialmenu:GetItems', function(cb)
        --print(cb, '2')
        if cb > 0 then
            return true
        else
            return false
        end
    end, item)
end