
local cfg = {}
-- define garage types with their associated vehicles
-- (vehicle list: https://wiki.fivem.net/wiki/Vehicles)
-- Alterada da versão 1.0 garages.lua (Dia 19/03/2018)

-- each garage type is an associated list of veh_name/veh_definition 
-- they need a _config property to define the blip and the vehicle type for the garage (each vtype allow one vehicle to be spawned at a time, the default vtype is "default")
-- this is used to let the player spawn a boat AND a car at the same time for example, and only despawn it in the correct garage
-- _config: vtype, blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.rent_factor = 0.1 -- 10% of the original price if a rent
cfg.sell_factor = 0.45 -- sell for 75% of the original price

cfg.garage_types = {
  ["Fisher's Boat"] = {
    _config = {vtype="boat",blipid=427,blipcolor=28,permissions={"fisher.vehicle"}},
    ["suntrap"] = {"Fisher's boat",0, "Your favorite boat!"}
  },

  ["Exotic Cars"] = {
    _config = {vtype="car",blipid=50,blipcolor=5},
    --["aventador"] = {"Lambo Aventador",1500000,""},
    --["lamboreventon"] = {"Lambo Reventon",2000000,""}, -- FALTA INFO
    --["focusrs"] = {"",,""}, -- FALTA INFO
    --["cliors"] = {"Clio RS",,""}, -- FALTA INFO
    ["718caymans"] = {"Porsche Cayman",2000000,""},
    ["slsamg"] = {"Mercedez SLS",1500000,""},
    ["x6m"] = {"BMW X6",250000,""},
    ["m2"] = {"BMW M2",2000000,""},
    ["mgt"] = {"Mustang 2016",500000,""},
    ["bison2"] = {"Hilux",70000,""},
    ["hakuchou"] = {"BMW S1000RR",800000,""},
    ["tmax"] = {"Scooter TMAX",65000,""},
    ["fusca"] = {"Fusca",12000,""},
    ["felon"] = {"Punto",100000,""},
    ["ingot"] = {"Celta",50000,""},
    ["z1000"] = {"Kawasaki z1000",520000,""},
    ["passat"] = {"Volks Passat",800000,""},
    ["asea"] = {"Volks Parati",99999,""},
    ["r1"] = {"Yamaha R1",650000,""},
    ["zion"] = {"Fiat Strada",124999,""},
    ["rs6"] = {"Audi RS6",850000, ""},
    ["gtr"] = {"R-35 2016",550000, ""},
    ["sentinel"] = {"Audi S5", 250000, ""},
    ["dominator"] = {"Mustang KEN BLOCK",115000, ""},
    ["r8ppi"] = {"Audi R8",1000000, ""},
    ["kuruma"] = {"Lancer Evo",450000, ""},
    ["schafter3"] = {"Monza FIXA",100000, ""},
    ["ySbrImpS11"] = {"Subaru Impreza",390000, ""},
    ["FK8"] = {"Honda Civic",430000, ""},
    ["f620"] = {"Lexus RC350", 350000, ""},
  },

  ["inicio"] = {
    _config = {vtype="car",blipid=50,blipcolor=5},
    ["blista"] = {"Uno", 5000, ""},
    ["fusca"] = {"Fusca",12000,""},
    ["150"] = {"CG 150", 25000, ""},
    ["faggio2"] = {"Faggio",2000, ""}
  },

  ["vans"] = {
    _config = {vtype="car",blipid=50,blipcolor=4}
  },

  ["sedans"] = {
    _config = {vtype="car",blipid=50,blipcolor=4}
  },

  ["Motorcycles"] = {
    _config = {vtype="bike",blipid=226,blipcolor=4},
	  ["f4rr"] = {"Agusta F4 RR",750000, ""},
    ["r1"] = {"Yamaha R1",650000,""},
    ["hakuchou"] = {"BMW S1000RR",800000,""},
    ["tmax"] = {"Scooter TMAX",65000,""},
    ["z1000"] = {"Kawasaki z1000",520000,""},
    ["AKUMA"] = {"Akuma",97000, ""},
    ["bagger"] = {"Bagger",47000, ""},
    ["bati"] = {"XJ-6",105000, ""},
    ["bati2"] = {"Bati 801RR",99999, ""},
    ["bf400"] = {"BF400",65000, ""},
	  ["lectro"] = {"BMW R75 Bobber",68000, ""},
    ["carbonrs"] = {"Carbon RS",122000, ""},
    ["cliffhanger"] = {"Cliffhanger",65000, ""},
	  ["f131"] = {"Confederate F131 Hellcat",145000, ""},
    ["double"] = {"Double T",99000, ""},
    ["enduro"] = {"Enduro",55000, ""},
    ["faggio2"] = {"Faggio",2000, ""},
    ["gargoyle"] = {"Gargoyle",65000, ""},
    ["hakuchou"] = {"BMW S1000RR",500000, ""},
	  ["daemon"] = {"Harley Knucklehead",50000, ""},
    ["hexer"] = {"Hexer",45000, ""},
    ["innovation"] = {"Innovation",45000, ""},
    ["nemesis"] = {"Nemesis",220000, ""},
    ["pcj"] = {"PCJ-600",130000, ""},
    ["ruffian"] = {"Ruffian",110000, ""},
    ["sanchez"] = {"Sanchez",70000, ""},
    ["sovereign"] = {"Sovereign",50000, ""}, -- looking for replacement
    ["thrust"] = {"Thrust",100000, ""},
    ["vader"] = {"Vader",14999, ""},
	  ["150"] = {"CG 150", 25000, ""}, -- new adittion
    ["vindicator"] = {"Vindicator",260000,""}
  },
  ["police"] = {
    _config = {vtype="car",blipid=56,blipcolor=38,permissions={"police.vehicle"}},
    ["fbi"] = {"Camaro Oficial",0, "police"},
    ["police4"] = {"Hilux PM",0, "police"},
	  ["police3"] = {"A6 Oficial",0, "police"},
    ["police2"] = {"Voyage PM",0, "police"},
    ["police"] = {"S10 PM",0, "police"},
    ["riot"] = {"Caverão",0, "police"}
  },
  ["Cadet"] = {
    _config = {vtype="car",blipid=56,blipcolor=38,permissions={"Cadet.vehicle"}},
    ["police2"] = {"police",0, "police"}
  },
  ["Bounty"] = {
    _config = {vtype="car",blipid=56,blipcolor=38,permissions={"Bounty.vehicle"}},
    ["ingot"] = {"Celta",0, ""}
  },
  ["emergency"] = {
    _config = {vtype="car",blipid=50,blipcolor=3,permissions={"emergency.vehicle"}},
    ["Ambulance"] = {"Ambulancia",0, "emergency"},
	  --["sheriff2"] = {"SW4 SAMU",0, "emergency"}
  },
  ["Police Helicopters"] = {
    _config = {vtype="car",blipid=43,blipcolor=38,radius=5.1,permissions={"police.vehicle"}},
    ["polmav"] = {"Aguia GAM",0, "emergency"}
  },
   ["EMS Helicopters"] = {
    _config = {vtype="car",blipid=43,blipcolor=1,radius=5.1,permissions={"emergency.vehicle"}},
    ["uh1mash"] = {"Aguia SAMU",0, "emergency"}
  },
  ["Pilotla"] = {
    _config = {vtype="plane",blipid=16,blipcolor=30,permissions={"pilot.vehicle"}},
    ["jet"] = {"Boeing 747",0, "jet"}
  },
  ["Pilotsa"] = {
    _config = {vtype="plane",blipid=16,blipcolor=30,permissions={"pilot.vehicle"}},
     ["mammatus"] = {"Small Cargo",0, "mammatus"}
  },
  ["airP"] = {
    _config = {vtype="plane",blipid=16,blipcolor=30,permissions={"air.vehicle"}},
    ["vestra"] = {"Plane",0, "vestra"}
  },
  ["airH"] = {
    _config = {vtype="plane",blipid=43,blipcolor=30,permissions={"air.vehicle"}},
     ["volatus"] = {"Helicopter",0, "volatus"}
  }, 
  ["uber"] = {
    _config = {vtype="car",blipid=50,blipcolor=81,permissions={"uber.vehicle"}},
    ["surge"] = {"Surge",0, "surge"}
  },
  ["Lawyer"] = {
    _config = {vtype="car",blipid=50,blipcolor=7,permissions={"Lawyer.vehicle"}},
    ["panto"] = {"Panto", 0, "panto"}
  },
  ["delivery"] = {
    _config = {vtype="bike",blipid=85,blipcolor=31,permissions={"delivery.vehicle"}},
    ["faggio3"] = {"faggio3",0, "faggio3"}
  },
  -- ["santa"] = {
    -- _config = {vtype="bike",blipid=85,blipcolor=31,permissions={"santa.vehicle"}},
    -- ["hydra"] = {"Santa's Sled",0, "hydra"}
  -- },  
  ["repair"] = {
    _config = {vtype="car",blipid=50,blipcolor=31,permissions={"repair.vehicle"}},
    ["towtruck2"] = {"towtruck2",0, "towtruck2"},
	["utillitruck3"] = {"Utility Truck",0, "utillitruck3"}
  },
  ["bankdriver"] = {
    _config = {vtype="car",blipid=67,blipcolor=4,permissions={"bankdriver.vehicle"}},
    ["stockade"] = {"stockade",0, "stockade"}
  },
  ["Trash Collector"] = {
    _config = {vtype="car",blipid=67,blipcolor=4,permissions={"trash.vehicle"}},
    ["trash"] = {"Truck",0, "trash"}
  },
  ["Medical Driver"] = {
    _config = {vtype="car",blipid=67,blipcolor=4,permissions={"medical.vehicle"}},
    ["pony2"] = {"Medical Weed Van",0, "pony2"}
  }
  
  
}

-- {garage_type,x,y,z}
cfg.garages = {
  {"inicio",-1035.7381591797,-2510.7585449219,20.088914871216},
  {"Exotic Cars",-42.400775909424,-1098.3619384766,26.422369003296},
  {"Motorcycles",-205.789, -1308.02, 31.2916},
  {"Motorcycles",-49.971244812012,-1112.7960205078,25.909332275391}, --new1603
  {"police",451.2121887207,-1018.2822875977,28.495378494263},	-- jobs garage
  {"Cadet",451.2121887207,-1018.2822875977,28.495378494263}, --- cadet garage
  {"police",477.99038696289,-1020.9154663086,28.011201858521},
  {"Bounty",512.07818603516,-3052.1579589844,6.0687308311462},  
  {"police",1868.5435791016,3696.0295410156,33.5693359375},  -- sandy shores
  {"police",-476.92425537109,6026.9951171875,31.340547561646},  -- paleto
  {"emergency",358.91650390625, -607.78515625, 28.6820983886719}, -- main
  {"emergency",1833.3223876953,3661.3088378906,33.875843048096}, -- sandy shores
  {"emergency",-295.45016479492,-1007.6578979492,30.379808425903}, -- Estacionamento lado prefeitura
  {"emergency",-255.98040771484,6346.1127929688,32.426189422607}, -- paleto
  {"uber",907.38049316406,-175.86546325684,74.130157470703}, -- jobs garage
  {"Lawyer",-1900.7344970703,-560.89245605469,11.802397727966},-- jobs garage
  {"delivery",964.514770507813,-1020.13879394531,40.8475074768066},   -- jobs garage
  {"repair",401.42602539063,-1631.7053222656,29.291942596436},   -- jobs garage
  {"bankdriver",222.68756103516,222.95631408691,105.41331481934},   -- jobs garage
  {"House Garage",-638.08142089844,56.500617980957,43.794803619385},  -- house garage
  {"Police Helicopters",449.275390625,-981.53137207031,45.531791687012}, -- Main PD --old449.30340576172,-981.24963378906,43.69165802002
  {"Police Helicopters",1770.2171630859,3239.5561523438,42.13171005249}, -- Sandy Shores
  {"Police Helicopters",-475.24264526367,5988.7353515625,31.336685180664}, -- Paleto Bay
  {"EMS Helicopters",449.30340576172,-981.24963378906,43.69165802002}, -- Main PD
  {"EMS Helicopters",-315.58026123047,-1005.395690918,30.385089874268}, --Estacionamento lado prefeitura
  {"EMS Helicopters",1770.2171630859,3239.5561523438,42.13171005249}, -- Sandy Shores
  {"EMS Helicopters",-475.24264526367,5988.7353515625,31.336685180664}, -- Paleto Bay  
  {"Fisher's Boat",1508.8854980469,3908.5732421875,30.031631469727},
  {"Medical Driver",-319.82263183594,-942.8408203125,31.080617904663},
  {"Pilotsa",-901.70129394531,-3293.984375,13.944430351257},
  {"Pilotsa",2128.9069824219,4806.134765625,41.168750762939},
  {"Pilotsa",1734.9053955078,3297.9689941406,41.223503112793},
  {"airP",2128.9069824219,4806.134765625,41.168750762939},
  {"airH",-745.14343261719,-1468.5361328125,5.0005240440369},
  {"airP",1734.9053955078,3297.9689941406,41.223503112793},
  {"Trash Collector",768.86297607422,-1410.4896240234,26.502605438232}

}

return cfg
