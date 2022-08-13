if Config.UseOldESX then
    local ESX = nil

    TriggerEvent("esx:getSharedObject", function(obj) 
        ESX = obj 
    end)
end

RegisterNetEvent('Sukra_AtmRobbery:LoudReward')
AddEventHandler('Sukra_AtmRobbery:LoudReward', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.addAccountMoney(Config.Account, Config.LoudMoney)
end)

RegisterNetEvent('Sukra_AtmRobbery:SilentReward')
AddEventHandler('Sukra_AtmRobbery:SilentReward', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.addAccountMoney(Config.Account, Config.SilentMoney)
end)

ESX.RegisterServerCallback('Sukra_AtmRobbery:GetPlayerJob', function(source, cb)

    
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.getJob().name
    
    if xPlayer == nil then
        print('Error xPlayer = nil something is really broken. This is most likley not related to this script')
    end
    
    identifier = xPlayer.getIdentifier()
        cb(job)
        if Config.Debug then
            print(job)
        end
    end)