--[[
    FiveM Scripts New Garage TNTG
    Copyright C 2018  By Bravoow TECNOLOGIA
]]--


vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_garages")

function deleteVehiclePedIsIn()
  local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
  SetVehicleHasBeenOwnedByPlayer(v,false)
  Citizen.InvokeNative(0xAD738C3085FE7E11, v, false, true) -- set not as mission entity
  SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
  Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(v))
end

local vehshop = {
	opened = false,
	title = "TNTGamers Shops",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.1,
		y = 0.08,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "TNTGamers Shops",
			name = "main",
			buttons = {
				{name = "Carros", description = ""},
				{name = "Motos", description = ""},
			}
		},
		["Carros"] = {
			title = "Carros",
			name = "Carros",
			buttons = {
			    {name = "Edicoes Especiais", description = ''},
			}
		},
		["Edicoes Especiais"] = {
			title = "Edicoes Especiais",
			name = "Edicoes Especiais",
			buttons = {
                {name = "Chevette 1988",costs = 5999,description = {}, model = "chevette"},
                {name = "Peugeot 206",costs = 13599,description = {}, model = "206"},
                {name = "Peugeot 107",costs = 18000,description = {}, model = "p107"},
                {name = "Hyundai Veloster",costs = 49999,description = {}, model = "veloster"},
                {name = "Ford Fiesta",costs = 67990,description = {}, model = "fiestarbcamber"},
                {name = "Volkswagen Golf Sportline",costs = 69999,description = {}, model = "vwgolf"},
                {name = "Volkswagen Scirocco R",costs = 80000,description = {}, model = "volksci11"},
                {name = "Subaru Impreza WRX STi",costs = 85000,description = {}, model = "sti05"},
                {name = "Honda Civic Hatchback",costs = 87900,description = {}, model = "honda"},
                {name = "Fiat Punto Evo",costs = 90000,description = {}, model = "punto"},
                {name = "Ford Focus RS",costs = 95000,description = {}, model = "focusublu"},
                {name = "JeeP",costs = 95999,description = {}, model = "srt8"},
                {name = "Fiat Toro",costs = 97299,description = {}, model = "ftoro"},
                {name = "Golf Mk6",costs = 99199,description = {}, model = "golf6"},
                {name = "Chevrolet Volt",costs = 99599,description = {}, model = "volt2"},
                {name = "Volkswagen Scirocco S",costs = 109999,description = {}, model = "sciroccos"},
                {name = "1995 Mitsubishi Lancer",costs = 110000,description = {}, model = "fnflan"},
                {name = "Citroen DS4",costs = 111999,description = {}, model = "ds4"},
                {name = "1995 Mitsubishi Eclipse",costs = 115000,description = {}, model = "fnfmits"},
                {name = "Golf GTI",costs = 118399,description = {}, model = "golfgti"},
                {name = "Hyundai Genesis",costs = 120000,description = {}, model = "genublu"},
                {name = "Kuruma",costs = 124000,description = {}, model = "Kuruma"},
                {name = "Mazda RX 7 2.6 Turbo",costs = 124990,description = {}, model = "2f2frx7"},
                {name = "Honda Civic Type",costs = 124999,description = {}, model = "hondacivictr"},
                {name = "FnF jetta",costs = 125000,description = {}, model = "fnfjetta"},
                {name = "Subaru Impreza 22B-STi",costs = 125000,description = {}, model = "22bbublu"},
                {name = "FnF RX 7 Dom",costs = 130000,description = {}, model = "fnfrx7dom"},
                {name = "Renault Megane RS",costs = 130000,description = {}, model = "renmeg"},
                {name = "2002 Mitsubishi Lancer",costs = 132990,description = {}, model = "2f2fmle7"},
                {name = "1997 Mazda RX-7",costs = 138995,description = {}, model = "fnfrx7"},
                {name = "Skyline R34",costs = 140000,description = {}, model = "skyline"},
                {name = "Volkswagen Passat B8",costs = 144500,description = {}, model = "passat"},
                {name = "Subaru Impreza",costs = 150000,description = {}, model = "ff4wrx"},
                {name = "Mini John Cooper Works",costs = 153999,description = {}, model = "miniub"},
                {name = "2002 Nissan Skyline",costs = 155000,description = {}, model = "fnf4r34"},
                {name = "Ford Everest",costs = 160000,description = {}, model = "everest"},
                {name = "Hyundai Santa Fé",costs = 164900,description = {}, model = "santafe"},
                {name = "1999 Nissan Skyline",costs = 165000,description = {}, model = "2f2fgtr34"},
                {name = "Evoque",costs = 243500,description = {}, model = "evoq"},
                {name = "Audi A4",costs = 244000,description = {}, model = "audia4"},
                {name = "Toyota Supra",costs = 250000,description = {}, model = "supra2"},
                {name = "BMW X6M",costs = 280000,description = {}, model = "x6m"},
                {name = "Chevrolet Mustang",costs = 299999,description = {}, model = "mst"},
                {name = "Ford Mustang GT",costs = 310000,description = {}, model = "musty5"},
                {name = "1994 Toyota Supra",costs = 330000,description = {}, model = "fnfmk4"},
                {name = "BMW M5 F10",costs = 332000,description = {}, model = "m516"},
                {name = "Chevrolet Camaro SS",costs = 338000,description = {}, model = "camaross"},
                {name = "Lexus RC350",costs = 350000,description = {}, model = "rc350s"},
                {name = "Mercedes-Benz A45",costs = 365000,description = {}, model = "a45"},
                {name = "Infiniti G37 Coupe Sport",costs = 435000,description = {}, model = "g37cs"},
                {name = "Audi TT rs",costs = 450000,description = {}, model = "ttrs"},
                {name = "Nissan GT-R SpecV",costs = 580000,description = {}, model = "gtrublu"},
                {name = "Audi RS6 C7",costs = 556000,description = {}, model = "rs6"},
                {name = "Audi R8",costs = 1500000,description = {}, model = "r8ppi"},
			}
		},
		["Motos"] = {
			title = "Motos",
			name = "Motos",
			buttons = {
                {name = "Mobilete", costs = 5999, description = {}, model = "mobi"},
                {name = "Honda Biz 125", costs = 9999, description = {}, model = "biz25"},
                {name = "Falcon 400", costs = 24999, description = {}, model = "bf400"},
                {name = "Yamaha XT 660", costs = 25000, description = {}, model = "sanchez2"},
                {name = "Yamaha XT660R Enduro", costs = 32000, description = {}, model = "xt66"},
                {name = "Hornet 2017", costs = 40000, description = {}, model = "vader"},
                {name = "XJ6", costs = 45000, description = {}, model = "bati"},
                {name = "R6", costs = 49999, description = {}, model = "r6"},
                {name = "Yamaha MT10", costs = 59000, description = {}, model = "mt10"},
                {name = "Srad 750", costs = 65000, description = {}, model = "gsxr"},
                {name = "Z1000", costs = 75000, description = {}, model = "z1000"},
                {name = "Cbrr", costs = 79999, description = {}, model = "hcbr17"},
                {name = "Cb1000", costs = 87999, description = {}, model = "cbrr"},
                {name = "R1", costs = 95000, description = {}, model = "r1"},
                {name = "Zx10", costs = 95999, description = {}, model = "zx10"},
                {name = "Zx10r", costs = 98999, description = {}, model = "zx10r"},
                {name = "Hayabusa", costs = 99999, description = {}, model = "hayabusa"},
                {name = "BMW S100RR", costs = 150000, description = {}, model = "bmws"},
                {name = "F4rr", costs = 500000, description = {}, model = "f4rr"},
			}
		},
	}
}
local fakecar = {model = '', car = nil}
local vehshop_locations = {
{entering = {-33.803,-1102.322,25.422}, inside = {-46.56327,-1097.382,25.99875, 120.1953}, outside = {-31.849,-1090.648,25.998,322.345}},
}

local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false

function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function vehSR_IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	--326 car blip 227 225
	vehSR_ShowVehshopBlips(true)
	firstspawn = 1
end
end)

function vehSR_ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,225)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("TNTGamers Shops")
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and vehshop.opened == false and IsPedInAnyVehicle(vehSR_LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(vehSR_LocalPed())) < 5 then
						DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
						vehSR_drawTxt("Aperte ~g~ENTER~s~ para comprar um ~b~Carro",0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

function vehSR_f(n)
	return n + 0.0001
end

function vehSR_LocalPed()
	return GetPlayerPed(-1)
end

function vehSR_try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end
function vehSR_firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
--local veh = nil
function vehSR_OpenCreator()
	boughtcar = false
	local ped = vehSR_LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end
local vehicle_price = 0
function vehSR_CloseCreator(vehicle,veh_type)
	Citizen.CreateThread(function()
		local ped = vehSR_LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			deleteVehiclePedIsIn()
			vRP.teleport({-44.21378326416,-1079.1402587891,26.67050743103})
			vRPg.spawnBoughtVehicle({veh_type, vehicle})
			SetEntityVisible(ped,true)
			FreezeEntityPosition(ped,false)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function vehSR_drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function vehSR_drawMenuTitle(txt,x,y)
local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
function vehSR_tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
function vehSR_Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function vehSR_drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.06, y - menu.height/2 + 0.0028)
end
local backlock = false
Citizen.CreateThread(function()
	local last_dir
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and vehSR_IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				vehSR_CloseCreator("","")
			else
				vehSR_OpenCreator()
			end
		end
		if vehshop.opened then
			local ped = vehSR_LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			vehSR_drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			vehSR_drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			vehSR_drawTxt(vehshop.selectedbutton.."/"..vehSR_tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = vehSR_tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
						if vehshop.currentmenu == "Compactos" or vehshop.currentmenu == "Exemplares" or vehshop.currentmenu == "Sedans" or vehshop.currentmenu == "Esportes" or vehshop.currentmenu == "Esportes Clássicos" or vehshop.currentmenu == "Supers" or vehshop.currentmenu == "Grandes" or vehshop.currentmenu == "Estrada" or vehshop.currentmenu == "SUVS" or vehshop.currentmenu == "Vans" or vehshop.currentmenu == "Edicoes Especiais" or vehshop.currentmenu == "Industrials" or vehshop.currentmenu == "Moto" or vehshop.currentmenu == "Motos" then
							vehSR_drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)
						else
							vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if vehshop.currentmenu == "Compactos" or vehshop.currentmenu == "Exemplares" or vehshop.currentmenu == "Sedans" or vehshop.currentmenu == "Esportes" or vehshop.currentmenu == "Esportes Clássicos" or vehshop.currentmenu == "Supers" or vehshop.currentmenu == "Grandes" or vehshop.currentmenu == "Estrada" or vehshop.currentmenu == "SUVS" or vehshop.currentmenu == "Vans" or vehshop.currentmenu == "Edicoes Especiais" or vehshop.currentmenu == "Industrials" or vehshop.currentmenu == "Moto" or vehshop.currentmenu == "Motos" then
						if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								local timer = 0
								while not HasModelLoaded(hash) and timer < 255 do
									Citizen.Wait(1)
									vehSR_drawTxt("Carregando...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									RequestModel(hash)
									timer = timer + 1
								end
								if timer < 255 then
									local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
									while not DoesEntityExist(veh) do
										Citizen.Wait(1)
										vehSR_drawTxt("Carregando...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									end
									FreezeEntityPosition(veh,true)
									SetEntityInvincible(veh,true)
									SetVehicleDoorsLocked(veh,4)
									--SetEntityCollision(veh,false,false)
									TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
									for i = 0,24 do
										SetVehicleModKit(veh,0)
										RemoveVehicleMod(veh,i)
									end
									fakecar = { model = button.model, car = veh}
								else
									timer = 0
									while timer < 50 do
										Citizen.Wait(1)
										vehSR_drawTxt("Falhou!",0,1,0.5,0.5,1.5,255,0,0,255)
										timer = timer + 1
									end
									if last_dir then
										if vehshop.selectedbutton < buttoncount then
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										else
											last_dir = false
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										end
									else
										if vehshop.selectedbutton > 1 then
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										else
											last_dir = true
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										end
									end
								end
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						vehSR_ButtonSelected(button)
					end
				end
			end
			if IsControlJustPressed(1,202) then
				vehSR_Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				last_dir = false
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				last_dir = true
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)


function vehSR_round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end
function vehSR_ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Carros" then
			vehSR_OpenMenu('Carros')
		elseif btn == "Motos" then
			vehSR_OpenMenu('Motos')
		end
	elseif this == "Carros" then
		if btn == "Esportes" then
			vehSR_OpenMenu('Esportes')
		elseif btn == "Sedans" then
			vehSR_OpenMenu('Sedans')
		elseif btn == "Compactos" then
			vehSR_OpenMenu('Compactos')
		elseif btn == "Exemplares" then
			vehSR_OpenMenu('Exemplares')
		elseif btn == "Esportes Clássicos" then
			vehSR_OpenMenu("Esportes Clássicos")
		elseif btn == "Supers" then
			vehSR_OpenMenu('Supers')
		elseif btn == "Grandes" then
			vehSR_OpenMenu('Grandes')
		elseif btn == "Estrada" then
			vehSR_OpenMenu('Estrada')
		elseif btn == "SUVS" then
			vehSR_OpenMenu('SUVS')
		elseif btn == "Vans" then
			vehSR_OpenMenu('Vans')
			elseif btn == "Edicoes Especiais" then
			vehSR_OpenMenu('Edicoes Especiais')
		end
	elseif this == "Compactos" or this == "Exemplares" or this == "Sedans" or this == "Esportes" or this == "Esportes Clássicos" or this == "Supers" or this == "Grandes" or this == "Estrada" or this == "SUVS" or this == "Vans" or this == "Edicoes Especiais" or this == "Industrial" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.costs, "car")
    elseif this == "Moto" or this == "Motos" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.costs, "bike")
	end
end

RegisterNetEvent('veh_SR:CloseMenu')
AddEventHandler('veh_SR:CloseMenu', function(vehicle, veh_type)
	boughtcar = true
	vehSR_CloseCreator(vehicle,veh_type)
end)

function vehSR_OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "Carros" then
		vehshop.lastmenu = "main"
	elseif menu == "bikes"  then
		vehshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end


function vehSR_Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		vehSR_CloseCreator("","")
	elseif vehshop.currentmenu == "Compactos" or vehshop.currentmenu == "Exemplares" or vehshop.currentmenu == "Sedans" or vehshop.currentmenu == "Esportes" or vehshop.currentmenu == "Esportes Clássicos" or vehshop.currentmenu == "Supers" or vehshop.currentmenu == "Grandes" or vehshop.currentmenu == "Estrada" or vehshop.currentmenu == "SUVS" or vehshop.currentmenu == "Vans" or vehshop.currentmenu == "Edicoes Especiais" or vehshop.currentmenu == "Industrial" or vehshop.currentmenu == "Moto" or vehshop.currentmenu == "Motos" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
		vehSR_OpenMenu(vehshop.lastmenu)
	else
		vehSR_OpenMenu(vehshop.lastmenu)
	end

end

function vehSR_stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end