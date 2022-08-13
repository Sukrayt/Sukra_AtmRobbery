if Config.UseOldESX then
    Citizen.CreateThread(function()
        ESX = nil
       
        while ESX == nil do
           TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
          Citizen.Wait(0)
        end
    end)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

local canRob = true
local policeChance = math.random(0, 1)
local atmBlip = nil

_menuPool = NativeUI.CreatePool()
local mainMenu

function openMenu()
    mainMenu = NativeUI.CreateMenu(Translation[Config.Locale]['Robbery_menu_header'], Translation[Config.Locale]['Robbery_menu_desc'])
    _menuPool:Add(mainMenu)

    
    local robbery_loud = NativeUI.CreateItem(Translation[Config.Locale]['Robbery_menu_loud'], Translation[Config.Locale]['Robbery_menu_loud_desc'])
    mainMenu:AddItem(robbery_loud)

    local robbery_silent = NativeUI.CreateItem(Translation[Config.Locale]['Robbery_menu_silent'], Translation[Config.Locale]['Robbery_menu_silent_desc'])
    mainMenu:AddItem(robbery_silent)
        

    mainMenu.OnItemSelect = function(sender, item, index)		
        if item == robbery_loud then
            startLoudRobbery()
            mainMenu:Visible(false)
        elseif item == robbery_silent then
            startSilentRobbery()
            mainMenu:Visible(false)
        end
    end	

    mainMenu:Visible(true)
    _menuPool:RefreshIndex()
    _menuPool:MouseControlsEnabled (false)
    _menuPool:MouseEdgeEnabled (false)
    _menuPool:ControlDisablingEnabled(false)		

end

function nextToATM()
	local player = PlayerPedId()
	local playerloc = GetEntityCoords(player, 0)
    
	for k, v in pairs(Config.ATMModels) do
		local pos = GetEntityCoords(PlayerPedId())
		local ATM = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, v.propHash, false, false, false)
		local ATMPos = GetEntityCoords(ATM)
		local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, ATMPos.x, ATMPos.y, ATMPos.z, true)
		if distance < 2.0 then
			return true
		end
	end
end

Citizen.CreateThread(function()
    while true do 
        _menuPool:ProcessMenus()
        if nextToATM() then
            ESX.ShowHelpNotification(Translation[Config.Locale]['Rob_ATM'])

			if IsControlJustReleased(0, 47) then
                openMenu()
			end
		end

        Citizen.Wait(0)

    end
end)


function startLoudRobbery()
    if( canRob == true) then
        local pos = GetEntityCoords(PlayerPedId())
        FreezeEntityPosition(PlayerPedId(), true)
        exports["memorygame"]:thermiteminigame(Config.ThermiteDifficulty, Config.ThermiteIncorrectBlocks, Config.ThermiteBlockShow, Config.ThermiteFailTime,
        function()
            exports['progressBars']:startUI(Config.ThermiteTime, Translation[Config.Locale]['thermite_ticking'])
            policeNotify()
            Citizen.Wait(Config.ThermiteTime)
            AddExplosion(pos.x, pos.y, pos.z, 2, 0, true, false, 1)
            TriggerServerEvent('Sukra_AtmRobbery:LoudReward', source)
            FreezeEntityPosition(PlayerPedId(), false)
            ESX.ShowNotification(Translation[Config.Locale]['robbery_succesfull'], "success", 3000)
            canRob = false
            robberyTimer()
        end,
        function()
            FreezeEntityPosition(PlayerPedId(), false)
            policeNotify()
            ESX.ShowNotification(Translation[Config.Locale]['robbery_loud_failure'], "error", 3000)
        end)
    else
        ESX.ShowNotification(Translation[Config.Locale]['recently_robbed'], "error", 3000)
    end
end

function startSilentRobbery()
    if( canRob == true) then
        exports["datacrack"]:Start(Config.HackingDifficulty)
        if (policeChance == 1) then
            policeNotify()
        end
        AddEventHandler("datacrack", function(output)
            if output then
                TriggerServerEvent('Sukra_AtmRobbery:SilentReward', source)
                ESX.ShowNotification(Translation[Config.Locale]['robbery_succesfull'], "success", 3000)
                canRob = false
                robberyTimer()
            else
                ESX.ShowNotification(Translation[Config.Locale]['robbery_silent_failure'], "error", 3000)
                Citizen.Wait(30000)
            end
        end)
    else
        ESX.ShowNotification(Translation[Config.Locale]['recently_robbed'], "error", 3000)
    end
end

function robberyTimer()
    while true do
        if( canRob == true) then
            Citizen.Wait(1000)
        else
            Citizen.Wait(Config.RobberyTimer)
            canRob = true
            print(canRob)
        end
    end

    Citizen.Wait(1000)

end

function policeNotify()
    ESX.TriggerServerCallback('Sukra_AtmRobbery:GetPlayerJob', function(job)
        if job == 'police' then
            local pos = GetEntityCoords(PlayerPedId())
	        atmBlip = AddBlipForCoord(pos)
	        SetBlipSprite(atmBlip, 161)
	        SetBlipScale(atmBlip, 2.0)
	        SetBlipColour(atmBlip, 3)
	        PulseBlip(atmBlip)

            ESX.ShowNotification(Translation[Config.Locale]['police_notify'], "error", 3000)
            Citizen.Wait(30000)
            RemoveBlip(atmBlip)
        end
    end)
end