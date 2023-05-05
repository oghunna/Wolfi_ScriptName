ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local OficjalnaNazwaSkryptu = 'hubercik_scriptname'

AddEventHandler('onResourceStart', function()
	if GetCurrentResourceName() ~= OficjalnaNazwaSkryptu then
        local nazwaserwera = GetConvar("sv_hostname")
        discordlog(nazwaserwera) 
		CreateThread(function()
			while true do
				Citizen.Wait(5)
				print("Zmieniłeś nazwę skryptu z "..OficjalnaNazwaSkryptu.." na "..GetCurrentResourceName()..". Zmieniaj to albo serwer Ci wybuchnie!")
			end
		end)
	end
end)

function discordlog(nazwaserweras)
    local webhook = 'WEBHUG'
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = OficjalnaNazwaSkryptu, embeds = {{["color"] = 1,["title"] = "Zmieniono nazwę skryptu!",["description"] = "Nazwa skryptu z **".. OficjalnaNazwaSkryptu .."** na **"..GetCurrentResourceName().."**",["footer"] = {["text"] = nazwaserweras},}},}), { ['Content-Type'] = 'application/json' })
end
