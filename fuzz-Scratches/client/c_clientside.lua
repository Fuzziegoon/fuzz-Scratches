if Config.Settings.Framework == "qb" then
    QBCore = exports[Config.Settings.Core]:GetCoreObject()
elseif Config.Settings.Framework == "esx" then
    ESX = exports['es_extended']:getSharedObject()
end

local peds = Config.Peds
local canOpen = true

---------------------------------------- #### THREADS #### ----------------------------------------

-- Thread to spawn peds
CreateThread(function() for _, item in pairs(peds) do if item.enable then RequestModel(item.hash) while not HasModelLoaded(item.hash) do Wait(1) end peds =  CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true) SetBlockingOfNonTemporaryEvents(peds, true) SetPedDiesWhenInjured(peds, false) SetEntityHeading(peds, item.h) SetPedCanPlayAmbientAnims(peds, true) SetPedCanRagdollFromPlayerImpact(peds, false) SetEntityInvincible(peds, true) FreezeEntityPosition(peds, true) end end end)

-- Thread to blips
CreateThread(function() for _, info in pairs(Config.Blips) do if info.enable then info.blip = AddBlipForCoord(info.x, info.y, info.z) SetBlipSprite(info.blip, info.sprite) SetBlipDisplay(info.blip, info.display) SetBlipScale(info.blip, info.scale) SetBlipColour(info.blip, info.colour) SetBlipAsShortRange(info.blip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName(info.name) EndTextCommandSetBlipName(info.blip) end end  end)

function OpenScratchesShop()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", Language[LanguageType].scratchShop, {
        label = Language[LanguageType].scratchShop,
        items = Config.ScratchShop,
        slots = #Config.ScratchShop,
    })
end

function Cooldown()
    canOpen = false
    Citizen.Wait(Config.Settings.Timer * 60000)
    canOpen = true
end



RegisterNetEvent('fuzz-Scratches:Client:OpenCard')
AddEventHandler("fuzz-Scratches:Client:OpenCard", function(v)
                    local CustomSettings = {
                        settings = {
                            handleEnd = true;  --Send a result message if true and callback when message closed or callback immediately without showing the message
                            speed = 10; --pixels / second
                            scoreWin = 400; --Score to win
                            scoreLose = -150; --Lose if this score is reached
                            maxTime = 60000; --sec
                            maxMistake = 3; --How many missed keys can there be before losing
                            speedIncrement = 1; --How much should the speed increase when a key hit was successful
                        },
                        keys = {"a", "w", "d", "s"}; --You can hash this out if you want to use default keys in the java side.
                    }
                    if Config.Settings.Cooldown then if not canOpen then return Notify(Language[LanguageType].cooldownTimer, "error", 5000) end end
                    if Config.Settings.Framework == "qb" then
                        local coinscratch = Config.scratchcoin
                        local hasItem = QBCore.Functions.HasItem(coinscratch)
                        if Config.NeedsCoin then 
                        if hasItem then
                        local success = exports['cd_keymaster']:StartKeyMaster(CustomSettings)
                        if success then
                        QBCore.Functions.Progressbar('OpenCard', Language[LanguageType].openingPack..v, 5000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mp_arresting",anim = "a_uncuff",flags = 49
                        }, {}, {}, function()
                            if v == "scratchcard01" then
                                TriggerServerEvent("fuzz-Scratches:Server:RewardCard", "Card01")
                                if Config.Settings.Cooldown then Cooldown() end
                            elseif v == "scratchcard02" then
                                TriggerServerEvent("fuzz-Scratches:Server:RewardCard", "Card02")
                                if Config.Settings.Cooldown then Cooldown() end
                            elseif v == "scratchcard03" then
                                TriggerServerEvent("fuzz-Scratches:Server:RewardCard", "Card03")
                                if Config.Settings.Cooldown then Cooldown() end
                            elseif v == "scratchcard04" then
                                TriggerServerEvent("fuzz-Scratches:Server:RewardCard", "Card04")
                                if Config.Settings.Cooldown then Cooldown() end
                            elseif v == "scratchcard05" then
                                TriggerServerEvent("fuzz-Scratches:Server:RewardCard", "Card05")
                                if Config.Settings.Cooldown then Cooldown() end
                            end
                        end, function()
                            Notify(Language[LanguageType].failedOpening, 'error', 5000)
                        end)
                    else
                    QBCore.Functions.Notify("You got absolutely nothing from this ticket!", "error", 4500)
                    if v == "scratchcard01" then
                        TriggerServerEvent("fuzz-Scratches:Server:NoReward", "Card01")
                        if Config.Settings.Cooldown then Cooldown() end
                    elseif v == "scratchcard02" then
                        TriggerServerEvent("fuzz-Scratches:Server:NoReward", "Card02")
                        if Config.Settings.Cooldown then Cooldown() end
                    elseif v == "scratchcard03" then
                        TriggerServerEvent("fuzz-Scratches:Server:NoReward", "Card03")
                        if Config.Settings.Cooldown then Cooldown() end
                    elseif v == "scratchcard04" then
                        TriggerServerEvent("fuzz-Scratches:Server:NoReward", "Card04")
                        if Config.Settings.Cooldown then Cooldown() end
                    elseif v == "scratchcard05" then
                        TriggerServerEvent("fuzz-Scratches:Server:NoReward", "Card05")
                        if Config.Settings.Cooldown then Cooldown() end
                    end
                end
            else
            QBCore.Functions.Notify("You dont have the right coin!, The scratch off was ruined", "error", 4500)  
            end   
        else
            local success = exports['cd_keymaster']:StartKeyMaster(CustomSettings)
            if success then
            QBCore.Functions.Progressbar('OpenCard', Language[LanguageType].openingPack..v, 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_arresting",anim = "a_uncuff",flags = 49
            }, {}, {}, function()
                if v == "scratchcard01" then
                    TriggerServerEvent("fuzz-Scratches:Server:RewardCard", "Card01")
                    if Config.Settings.Cooldown then Cooldown() end
                elseif v == "scratchcard02" then
                    TriggerServerEvent("fuzz-Scratches:Server:RewardCard", "Card02")
                    if Config.Settings.Cooldown then Cooldown() end
                elseif v == "scratchcard03" then
                    TriggerServerEvent("fuzz-Scratches:Server:RewardCard", "Card03")
                    if Config.Settings.Cooldown then Cooldown() end
                elseif v == "scratchcard04" then
                    TriggerServerEvent("fuzz-Scratches:Server:RewardCard", "Card04")
                    if Config.Settings.Cooldown then Cooldown() end
                elseif v == "scratchcard05" then
                    TriggerServerEvent("fuzz-Scratches:Server:RewardCard", "Card05")
                    if Config.Settings.Cooldown then Cooldown() end
                end
            end, function()
                Notify(Language[LanguageType].failedOpening, 'error', 5000)
            end)
            else
                QBCore.Functions.Notify("You got absolutely nothing from this ticket!", "error", 4500)
                if v == "scratchcard01" then
                    TriggerServerEvent("fuzz-Scratches:Server:NoReward", "Card01")
                    if Config.Settings.Cooldown then Cooldown() end
                elseif v == "scratchcard02" then
                    TriggerServerEvent("fuzz-Scratches:Server:NoReward", "Card02")
                    if Config.Settings.Cooldown then Cooldown() end
                elseif v == "scratchcard03" then
                    TriggerServerEvent("fuzz-Scratches:Server:NoReward", "Card03")
                    if Config.Settings.Cooldown then Cooldown() end
                elseif v == "scratchcard04" then
                    TriggerServerEvent("fuzz-Scratches:Server:NoReward", "Card04")
                    if Config.Settings.Cooldown then Cooldown() end
                elseif v == "scratchcard05" then
                    TriggerServerEvent("fuzz-Scratches:Server:NoReward", "Card05")
                    if Config.Settings.Cooldown then Cooldown() end
                end
            end
        end
    end
end)

