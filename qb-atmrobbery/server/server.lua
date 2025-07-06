local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
    local src = source
    TriggerClientEvent("qb-atmrobbery:client:UseTowingRope", src)
end)

QBCore.Functions.CreateUseableItem(Config.ATMItemName, function(source, item)
    local src = source
    TriggerClientEvent("qb-atmrobbery:client:UseATMObject", src)
end)

RegisterNetEvent('qb-atmrobbery:createRopeForAll', function(VehCoord, ATMCoord)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BSN = Player.PlayerData.citizenid
	TriggerClientEvent("qb-atmrobbery:client:Sync", -1, src, VehCoord, ATMCoord, BSN)
end)

RegisterNetEvent('qb-atmrobbery:DeleteRopeDelete', function(coord)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BSN = Player.PlayerData.citizenid
	TriggerClientEvent("qb-atmrobbery:client:DeleteRopeDelete", -1, coord, BSN)
end)

RegisterNetEvent('qb-atmrobbery:AddSearchATMReward', function(Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney('blackmoney', tonumber(Amount), "ATM Robbery - Cash Found")
end)

RegisterNetEvent('inventory:server:SaveInventory', function()
    local src = source
    TriggerClientEvent("qb-atmrobbery:client:UpdateEmote", src)
end)

RegisterNetEvent('qb-atmrobbery:server:DeleteObj', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BSN = Player.PlayerData.citizenid
    TriggerClientEvent("qb-atmrobbery:client:DeleteObject", -1, BSN)
end)

RegisterNetEvent('qb-atmrobbery:server:AddRewardForATMObj', function(Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney('blackmoney', tonumber(Amount), "ATM Robbery - Sold ATM")
end)
