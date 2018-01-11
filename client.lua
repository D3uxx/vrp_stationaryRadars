--===============================================--===============================================
--= stationary radars https://github.com/DreanorGTA5Mods/StationaryRadar				 	     =
--===============================================--===============================================

local radares = {
{x = 379.68807983398, y = -1048.3527832031, z = 29.250692367554},
{x = 379.68807983398, y = 1048.3527832031, z = 29.250692367554}
}

-- 379.68807983398,-1048.3527832031,29.250692367554

Citizen.CreateThread(function()
  while true do
    Wait(0)
	for k,v in pairs(radares) do
	pP = GetPlayerPed(-1)
	local coords = GetEntityCoords(pP, true)
	if Vdist2(v.x, v.y, v.z, coords["x"], coords["y"], coords["z"]) < 10 then
	Citizen.Trace("estas pasando por un radar")
		checkSpeed()
	end
  end
 end
end)

  function checkSpeed()
  local speed = GetEntitySpeed(pP)
  local vehicle = GetVehiclePedIsIn(pP, false)
  local driver = GetPedInVehicleSeat(vehicle, -1)
  local maxspeed = 80
	local kmhspeed = math.ceil(speed*3.6)
		if kmhspeed > maxspeed and driver == pP then
			Citizen.Wait(250)
			TriggerServerEvent('cobrarMulta')
			exports.pNotify:SetQueueMax("left", 1)
            exports.pNotify:SendNotification({
            text = "You've been fined for speeding.",
            type = "error",
            timeout = math.random(100, 3500),
            layout = "centerLeft",
            queue = "left"
          })
	end
end