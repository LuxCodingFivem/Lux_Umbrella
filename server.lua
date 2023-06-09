ESX = exports['es_extended']:getSharedObject()

ESX.RegisterUsableItem('umbrella', function(source)
    TriggerClientEvent('LS_Umbrella:use', source)
end)