ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('LS_Umbrella:use')
AddEventHandler('LS_Umbrella:use', function() 
    ESX.Streaming.RequestAnimDict('amb@world_human_drinking@coffee@male@base', function()
        TaskPlayAnim(PlayerPedId(), 'amb@world_human_drinking@coffee@male@base', 'base', 1.0, -1.0, -1, 49, 1, false, false, false)
    end)
    umbrella = CreateObject(GetHashKey('p_amb_brolly_01'), 0, 0, 0, true, true, true) 
    AttachEntityToEntity(umbrella, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.125, 0.005, 0.0, 280.0, -20.0, 180.0, false, false, false, false, 5, true)
    SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'))
    if Config.useNotification then 
        ESX.ShowNotification(string.format(Translation[Config.Locale]['use_umbrella']))
    end
end)


Citizen.CreateThread(function()
    while Config.CancelKeyBind ~= nil do
        if IsControlPressed(0, Config.CancelKeyBind) then
            ClearPedTasks(PlayerPedId())
            Citizen.Wait(1000)
            DetachEntity(umbrella, 1, true)
			DeleteEntity(umbrella)
			DeleteObject(umbrella)
			SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'))
        end
    Citizen.Wait(0)
    end
end)