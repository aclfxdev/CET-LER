-- -- -- -- -- -- -- -- -- -- -- --- -- -- -- -- --
-- Combined Engine Toggle & Leave Engine Running --
-- 				  Written by aclfx				 --
-- 					 Version 1.0				 --
-- -- -- -- -- -- -- -- -- -- -- --- -- -- -- -- --

local keyToggle = 15 -- Sets engine toggle button to SCROLLWHEEL UP, view list of controls here if you wish to change: https://docs.fivem.net/docs/game-references/controls/#controls

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(ped, false)
		local engineStatus
		
		if IsPedGettingIntoAVehicle(ped) then
			engineStatus = (GetIsVehicleEngineRunning(vehicle)) -- will either be true or false.
			if not (engineStatus) then 
				SetVehicleEngineOn(vehicle, false, true, true) -- ensures engine is off.
				DisableControlAction(2, 71, true) -- ensures that the player doesn't auto-start the car when entering.
			end
		end
		
		if IsPedInAnyVehicle(ped, false) and not IsEntityDead(ped) and (not GetIsVehicleEngineRunning(vehicle)) then
			DisableControlAction(2, 71, true) -- general script to disable player auto-starting the car when already in car.
		end
		
		if (IsControlJustReleased(0, keyToggle) or IsDisabledControlJustReleased(0, keyToggle)) and vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
			toggleEngine()
			if not (engineStatus) then
				engineStatus = true -- flips engineStatus since it was false.
				DisableControlAction(2, 71, false)
			else
				engineStatus = false -- flips engineStatus since it was true.
				DisableControlAction(2, 71, true)
			end
        end
		
		if IsPedInAnyVehicle(ped, false) and IsControlPressed(2, 75) and not IsEntityDead(ped) then
			if (GetIsVehicleEngineRunning(vehicle)) then
				Citizen.Wait(150) -- gives client time between car auto turning off and running following scripts.
				SetVehicleEngineOn(vehicle, true, true, false) -- restarts car engine
				TaskLeaveVehicle(ped, vehicle, 0)
			else
				TaskLeaveVehicle(ped, vehicle, 0)
			end
		end
    end
end)

function toggleEngine()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), true, true)
    end
end

