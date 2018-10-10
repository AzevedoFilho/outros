
local cfg = {}

-- Garagem de exemplo para vrp_showroom, Edit by Bravoow Tecnologia
-- define garage types with their associated vehicles
-- (vehicle list: https://wiki.fivem.net/wiki/Vehicles)

-- each garage type is an associated list of veh_name/veh_definition 
-- they need a _config property to define the blip and the vehicle type for the garage (each vtype allow one vehicle to be spawned at a time, the default vtype is "default")
-- this is used to let the player spawn a boat AND a car at the same time for example, and only despawn it in the correct garage
-- _config: vtype, blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.rent_factor = 0.1 -- 10% of the original price if a rent
cfg.sell_factor = 0.50 -- sell for 75% of the original price

cfg.garage_types = {
  ["Bote de Pescador"] = {

    _config = {vtype="boat",blipid=427,blipcolor=28,permissions={"fisher.vehicle"}},
    ["suntrap"] = {"Bote de Pescador",0, ""}
  },
  ["Bote de tartaruga"] = {
    _config = {vtype="boat",blipid=427,blipcolor=28,permissions={"tartaruga.vehicle"}},
    ["suntrap"] = {"Bote de Pescador",0, ""}
  },
  ["Loja de Carros"] = {
    _config = {vtype="car",blipid=357,blipcolor=27,radius=5.1},
    ["sti05"] = {"Subaru Impreza WRX STi",85000, ""},
    ["musty5"] = {"Ford Mustang GT",310000, ""},
    ["g37cs"] = {"Infiniti G37 Coupe Sport",435000, ""},
    ["p107"] = {"Peugeot 107",20000, ""},
    ["renmeg"] = {"Renault Megane RS",130000, ""},
    ["miniub"] = {"Mini John Cooper Works",153953, ""},
    ["gtrublu"] = {"Nissan GT-R SpecV",580000, ""},
    ["genublu"] = {"Hyundai Genesis",120000, ""},
    ["volksci11"] = {"Volkswagen Scirocco R",50000, ""},
    ["22bbublu"] = {"Subaru Impreza 22B-STi",150000, ""},
    ["focusublu"] = {"Ford Focus RS",50000, ""},
    ["r8ppi"] = {"Audi R8",650000, ""},
    ["x6m"] = {"BMW X6M",280000, ""},
    ["skyline"] = {"Skyline R34",140000, ""},
    ["2f2frx7"] = {"Mazda RX 7 2.6 Turbo",120000, ""},
    ["fnfjetta"] = {"fnf jetta",125000, ""},
    ["fnfrx7dom"] = {"fnf rx7 dom",130000, ""},
    ["fnflan"] = {"1995 Mitsubishi Lancer",65000, ""},
    ["ff4wrx"] = {"Subaru Impreza",150000, ""}, 
    ["fnfmk4"] = {"1994 Toyota Supra",400000, ""},
    ["2f2fmle7"] = {"2002 Mitsubishi Lancer",80000, ""},
    ["fnf4r34"] = {"2002 Nissan Skyline",172000, ""},
    ["2f2fgtr34"] = {"1999 Nissan Skyline",150000, ""},
    ["fnfrx7"] = {"1997 Mazda RX-7",110000, ""},
    ["fnfmits"] = {"1995 Mitsubishi Eclipse",60000, ""},
    ["golf6"] = {"Golf Mk6",60000, ""},
    ["a45"] = {"Mercedes-Benz A45",400000, ""},
    ["srt8"] = {"JEEP",85000, ""},
    ["ttrs"] = {"Audi TT rs",200000, ""},
    ["golfgti"] = {"Golf GTI",130000, ""},
    ["everest"] = {"Ford Everest",160000, ""},
    ["supra2"] = {"Toyota Supra",250000, ""},
    ["rc350s"] = {"Lexus RC350",350000, ""},
	["206"] = {"Peugeot 206",13426, ""},
    ["rs6"] = {"Audi RS6 C7",556000, ""},
    ["audia4"] = {"Audi A4",244000, ""},
    ["m516"] = {"BMW M5 F10",332000, ""},
    ["mst"] = {"Chevrolet Mustang",299900, ""},
    ["camaross"] = {"Chevrolet Camaro SS",338000, ""},
    ["chevette"] = {"Chevette 1988",5830, ""},
    ["volt2"] = {"Chevrolet Volt",95500, ""},
    ["ds4"] = {"Citroen DS4",101686, ""},
    ["punto"] = {"Fiat Punto Evo",170000, ""},
    ["ftoro"] = {"Fiat Toro",97270, ""},
    ["fiestarbcamber"] = {"Ford Fiesta",67090, ""},
    ["evoq"] = {"Evoque",243500, ""},
    ["honda"] = {"Honda Civic Hatchback",87900, ""},
    ["hondacivictr"] = {"Honda Civic Type",124900, ""},
    ["santafe"] = {"Hyundai Santa Fé",164900, ""},
    ["veloster"] = {"Hyundai Veloster",50000, ""},
    ["srt8"] = {"Jeep",69990, ""},
    ["Kuruma"] = {"Kuruma",124000, ""},
    ["vwgolf"] = {"Volkswagen Golf Sportline",45000, ""},
    ["passat"] = {"Volkswagen Passat B8",144500, ""},
    ["sciroccos"] = {"Volkswagen Scirocco S",108500, ""},
  },
  ["Loja de Motos"] = {
    _config = {vtype="car",blipid=357,blipcolor=27,radius=5.1},
    ["bati"] = {"XJ6",45000, ""},
    ["bf400"] = {"Falcon 400",25000, ""},
    ["bmws"] = {"BMW S100RR",75000, ""},
    ["biz25"] = {"Honda Biz 125",6000, ""},
    ["gsxr"] = {"Srad 750",65000, ""},
    ["mt10"] = {"Yamaha MT10",59000, ""},
    ["sanchez2"] = {"Yamaha XT 660",16000, ""},
    ["xt66"] = {"Yamaha XT660R Enduro",32000, ""},
    ["vader"] = {"Hornet 2017",40000, ""},
    ["r1"] = {"R1",70000, ""},
    ["z1000"] = {"Z1000",75000, ""},
    ["f4rr"] = {"F4rr",90000, ""},
    ["cbrr"] = {"Cb1000",60000, ""},
    ["hcbr17"] = {"Cbrr",55000, ""},
    ["hayabusa"] = {"hayabusa",65000, ""},
    ["zx10"] = {"Zx10",85000, ""},
    ["r6"] = {"R6",35000, ""},
	["mobi"] = {"Mobilete",15000, ""},
    ["zx10r"] = {"Zx10r",75000, ""}
  },
  ["Garagem"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,radius=5.1},
    ["sti05"] = {"Subaru Impreza WRX STi",85000, ""},
    ["musty5"] = {"Ford Mustang GT",310000, ""},
    ["g37cs"] = {"Infiniti G37 Coupe Sport",435000, ""},
    ["p107"] = {"Peugeot 107",20000, ""},
    ["renmeg"] = {"Renault Megane RS",130000, ""},
    ["miniub"] = {"Mini John Cooper Works",153953, ""},
    ["gtrublu"] = {"Nissan GT-R SpecV",580000, ""},
    ["genublu"] = {"Hyundai Genesis",120000, ""},
    ["volksci11"] = {"Volkswagen Scirocco R",50000, ""},
    ["22bbublu"] = {"Subaru Impreza 22B-STi",150000, ""},
    ["r8ppi"] = {"Audi R8",650000, ""},
    ["x6m"] = {"BMW X6M",280000, ""},
    ["skyline"] = {"Skyline R34",140000, ""},
    ["2f2frx7"] = {"Mazda RX 7 2.6 Turbo",120000, ""},
    ["fnfjetta"] = {"fnf jetta",125000, ""},
    ["fnfrx7dom"] = {"fnf rx7 dom",130000, ""},
    ["fnflan"] = {"1995 Mitsubishi Lancer",65000, ""},
    ["ff4wrx"] = {"Subaru Impreza",150000, ""}, 
    ["fnfmk4"] = {"1994 Toyota Supra",400000, ""},
    ["2f2fmle7"] = {"2002 Mitsubishi Lancer",80000, ""},
    ["fnf4r34"] = {"2002 Nissan Skyline",172000, ""},
    ["2f2fgtr34"] = {"1999 Nissan Skyline",150000, ""},
    ["fnfrx7"] = {"1997 Mazda RX-7",110000, ""},
    ["fnfmits"] = {"1995 Mitsubishi Eclipse",60000, ""},
    ["golf6"] = {"Golf Mk6",60000, ""},
    ["a45"] = {"Mercedes-Benz A45",400000, ""},
    ["srt8"] = {"JEEP",85000, ""},
    ["ttrs"] = {"Audi TT rs",200000, ""},
    ["golfgti"] = {"Golf GTI",130000, ""},
    ["everest"] = {"Ford Everest",160000, ""},
    ["supra2"] = {"Toyota Supra",250000, ""},
    ["rc350s"] = {"Lexus RC350",350000, ""},
	["206"] = {"Peugeot 206",13426, ""},
    ["rs6"] = {"Audi RS6 C7",556000, ""},
    ["audia4"] = {"Audi A4",244000, ""},
    ["m516"] = {"BMW M5 F10",332000, ""},
    ["mst"] = {"Chevrolet Mustang",299900, ""},
    ["camaross"] = {"Chevrolet Camaro SS",338000, ""},
    ["chevette"] = {"Chevette 1988",5830, ""},
    ["volt2"] = {"Chevrolet Volt",95500, ""},
    ["ds4"] = {"Citroen DS4",101686, ""},
    ["punto"] = {"Fiat Punto Evo",170000, ""},
    ["ftoro"] = {"Fiat Toro",97270, ""},
    ["fiestarbcamber"] = {"Ford Fiesta",67090, ""},
    ["evoq"] = {"Evoque",243500, ""},
    ["honda"] = {"Honda Civic Hatchback",87900, ""},
    ["hondacivictr"] = {"Honda Civic Type",124900, ""},
    ["santafe"] = {"Hyundai Santa Fé",164900, ""},
    ["veloster"] = {"Hyundai Veloster",50000, ""},
    ["srt8"] = {"Jeep",69990, ""},
    ["Kuruma"] = {"Kuruma",124000, ""},
    ["supra2"] = {"Toyota Supra JZA80",350000, ""},
    ["vwgolf"] = {"Volkswagen Golf Sportline",45000, ""},
    ["passat"] = {"Volkswagen Passat B8",144500, ""},
    ["sciroccos"] = {"Volkswagen Scirocco S",108500, ""},
    ["bati"] = {"XJ6",45000, ""},
    ["bf400"] = {"Falcon 400",25000, ""},
    ["bmws"] = {"BMW S100RR",75000, ""},
    ["biz25"] = {"Honda Biz 125",6000, ""},
    ["gsxr"] = {"Srad 750",65000, ""},
    ["mt10"] = {"Yamaha MT10",59000, ""},
    ["sanchez2"] = {"Yamaha XT 660",16000, ""},
    ["xt66"] = {"Yamaha XT660R Enduro",32000, ""},
    ["vader"] = {"Hornet 2017",40000, ""},
    ["r1"] = {"R1",70000, ""},
    ["sanchez2"] = {"Xt660",32000, ""},
    ["z1000"] = {"Z1000",75000, ""},
    ["f4rr"] = {"F4rr",90000, ""},
    ["cbrr"] = {"Cb1000",60000, ""},
    ["hcbr17"] = {"Cbrr",55000, ""},
    ["hayabusa"] = {"hayabusa",65000, ""},
    ["r6"] = {"R6",35000, ""},
	["biz25"] = {"Hond Biz",7000, ""},
    ["r1"] = {"Yamaha R1",60000, ""},
  },
  ["Garagem Diamante"] = {
   _config = {vtype="car",blipid=357,blipcolor=74,permissions={"garagemp.vehicle"}},
     ["granlb"] = {"Maserati GranTurismo",0, ""},
     ["LP700R"] = {"Lamborghini lp700-4 Roadster",0, ""},
     ["918"] = {"Porsche 918",0, ""},
	 ["laferublu"] = {"Ferrari LaFerrar",0, ""},
     ["C7"] = {"Chevrolet Corvette C7 ",0, ""},
     ["gtrc"] = {"Nissan GTR Conversivel",0, ""},
	 ["furaiub"] = {"Mazda Furai",0, ""},
     ["italia458"] = {"Ferrari 458 Italia",0, ""},
	 ["cayenne"] = {"Porsche Cayenne Turbo",0, ""},
	 ["dubsta3"] = {"caminhonete 6x6",0, ""},
	 ["e89"] = {"BMW Z4 GT3",0, ""},
     ["slrublu"] = {"Mercedes-Benz SLS AMG C1977",0, ""},
	 ["370z"] = {"Nissan 370z",0, ""},
	 ["b164"] = {"Bugatti Veyron",0, ""},
	 ["rmodlp770"] = {"Lamborghini Centenario",0, ""},
  },
  ["Garagem Ouro"] = {
    _config = {vtype="car",blipid=357,blipcolor=71,permissions={"garagemg.vehicle"}},
	 ["zr1c3"] = {"Chevrolet Corvette",0, ""},
	 ["p944"] = {"Porsche 944 Turbo",0, ""},
	 ["mx5a"] = {"Mazda MX-5 Roadster Coupe",0, ""},
	 ["caymanub"] = {"Porsche Cayman R",0, ""},
	 ["f360"] = {"Ferrari 360 Challenge Stradale",0, ""},
	 ["rx8"] = {"Mazda RX-8",0, ""},
	 ["vc7"] = {"Chevrolet Corvette Stingray",0, ""},
	 ["miura"] = {"Lamborghini Miura",0, ""},
	 ["gtrc"] = {"Nissan GTR Conversivel",0, ""},
	 ["miura"] = {"Lamborghini Miura",0, ""},
	 ["zl12017"] = {"Camaro 2017",0, ""},
	 ["gtrc"] = {"Nissan GTR Conversivel",0, ""},
	 ["laferublu"] = {"Ferrari LaFerrar",0, ""},
	 ["caymanub"] = {"Porsche Cayman R",0, ""},
	 ["lamven"] = {"Lamborghini Veneno",0, ""},
	 ["gtbf"] = {"Ferrari 599 GTB",0, ""},
	 ["z4i"] = {"BMW z4i",0, ""},
	 ["mcublu"] = {"McLaren 12C",0, ""},
	 ["furaiub"] = {"Mazda Furai",0, ""},
	 ["italia458"] = {"Ferrari 458 Italia",0, ""},
  },
  ["Garagem Premium"] = {
    _config = {vtype="car",blipid=357,blipcolor=48,permissions={"garagempr.vehicle"}},
	 ["panamera"] = {"Porsche Panamera Turbo",0, ""},
	 ["cayenne"] = {"Porsche Cayenne Turbo",0, ""},
	 ["zr1c3"] = {"Chevrolet Corvette",0, ""},
	 ["mx5a"] = {"Mazda MX-5 Roadster Coupe",0, ""},
	 ["slrublu"] = {"Mercedes-Benz SLS AMG C1977",0, ""},
	 ["c63coupe"] = {"Mercedes AMG c63",0, ""},
	 ["caymanub"] = {"Porsche Cayman R",0, ""},
	 ["f360"] = {"Ferrari 360 Challenge Stradale",0, ""},
	 ["rx8"] = {"Mazda RX-8",0, ""},
	 ["vc7"] = {"Chevrolet Corvette Stingray",0, ""},
	 ["miura"] = {"Lamborghini Miura",0, ""},
	 ["zl12017"] = {"Camaro 2017",0, ""},
	 ["gtrc"] = {"Nissan GTR Conversivel",0, ""},
	 ["laferublu"] = {"Ferrari LaFerrar",0, ""},
	 ["caymanub"] = {"Porsche Cayman R",0, ""},
	 ["lamven"] = {"Lamborghini Veneno",0, ""},
	 ["gtbf"] = {"Ferrari 599 GTB",0, ""},
	 ["z4i"] = {"BMW z4i",0, ""},
	 ["mcublu"] = {"McLaren 12C",0, ""},
	 ["furaiub"] = {"Mazda Furai",0, ""},
	 ["italia458"] = {"Ferrari 458 Italia",0, ""},
  },  
  ["Garagem Onibus"] = {
    _config = {vtype="car",blipid=357,blipcolor=27,radius=5.1,permissions={"om.vehicle"}},
    ["bus"] = {"Onibus",0, ""}
  },
  ["Garagem Onibus de Viajem"] = {
    _config = {vtype="car",blipid=357,blipcolor=27,radius=5.1,permissions={"omj.vehicle"}},
    ["coach"] = {"Onibus de Viajem",0, ""}
  },
  ["Garagem Agiota"] = {
    _config = {vtype="car",blipid=357,blipcolor=54,permissions={"Agiota.vehicle"}},
    ["cayenne"] = {"Porsche Cayenne Turbo",0, ""},
  },
  ["Carros de Policia"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,permissions={"Cabo.vehicle"}},
	["policeold1"] = {"Viatura PM",0, ""},
	["police3"] = {"Viatura Renault",0, ""},
	["s10"] = {"s10 PM",0, ""},
	["pbus"] = {"Onibus",0, ""},
	["Palio"] = {"Palio Weekend",0, ""},
  },  
  ["Força Tatica"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,permissions={"FORÇA TATICA.vehicle"}},
    ["trailft"] = {"Trailbalzer",0, ""},
    ["pbus"] = {"Onibus",0, ""},
    ["ft"] = {"Picape",0, ""},
    ["blazerft"] = {"Blazer",0, ""},
	["hiluxpm"] = {"Sw4 FT",0, ""}
  },
  ["Policia Civil"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,permissions={"Civil.vehicle"}},
    ["Blazerr"] = {"BLAZER CIVIL",0, ""},
    ["pbus"] = {"Onibus",0, ""},
    ["Paliocv"] = {"Palio Weekend",0, ""},
    ["am"] = {"Amarok",0, ""}
  },
  ["Rota"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,permissions={"Rota.vehicle"}},
    ["sw4rota"] = {"Rota SW4",0, ""},
    ["hwaycar5"] = {"Rota Blazer",0, ""},
    ["riot"] = {"Blindado Rota",0, ""},
    ["pbus"] = {"Onibus",0, ""},
    ["TRAILBLAZERrota"] = {"Rota Trail",0, ""},
	["hiluxrota"] = {"VTR TESTE ROTA",0, ""}

  },
  ["Comandante"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,permissions={"comandante.vehicle"}},
    ["evoq"] = {"Comandante",0, ""},
    ["sw4rota"] = {"Rota SW4",0, ""},
    ["hwaycar5"] = {"Rota Blazer",0, ""},
    ["riot"] = {"Blindado Rota",0, ""},
    ["pbus"] = {"Onibus",0, ""},
    ["trailrota"] = {"Rota Trail",0, ""},
    ["Blazerr"] = {"BLAZER CIVIL",0, ""},
    ["pbus"] = {"Onibus",0, ""},
    ["Paliocv"] = {"Palio Weekend",0, ""},
    ["am"] = {"Amarok",0, ""},
    ["rocammoto"] = {"Rocam",0, ""},
	["polchiron"] = {"Bugatti",0, ""},
    ["trailft"] = {"Trailbalzer",0, ""},
    ["pbus"] = {"Onibus",0, ""},
    ["ft"] = {"Picape",0, ""},
    ["blazerft"] = {"Blazer",0, ""},
    ["policeb"] = {"Moto ROCAM",0, ""},
    ["police7"] = {"Gol PM",0, ""},
    ["sheriff"] = {"Gol Ronda Escolar",0, ""},
    ["Spin"] = {"Spin",0, ""},
    ["pbus"] = {"Onibus",0, ""},
    ["Palio"] = {"Palio Weekend",0, ""},
	["fbi"] = {"VTR Descaracterizada",0, ""}
  },
  ["Carros de Juiz"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,permissions={"juiz.vehicle"}},
    ["evoq"] = {"Ranger Rover Evoque",0, ""},
    ["cadicts"] = {"Cadillac CTS-V",380000, ""},
  },
  ["Loja de Carro do Jogo"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,radius=5.1},
    ["blista"] = {"Blista Compacto",350000, ""},
    ["blista2"] = {"Blista Quadrado.",350000, ""},
    ["prairie"] = {"Prairie",450000, ""},
    ["cogcabrio"] = {"CogCabrio",550000, ""},
    ["exemplar"] = {"Exemplar",500000, ""},
    ["f620"] = {"F620",850000, ""},
    ["felon2"] = {"Felon Cabrio",750000, ""},
    ["jackal"] = {"Jackal",570000, ""},
    ["oracle2"] = {"Oracle",500000, ""},
    ["sentinel2"] = {"Sentinel Cabrio",600000, ""},
    ["zion2"] = {"Zion 2",600000, ""},
    ["buccaneer"] = {"Buccaneer",450000, ""},
    ["dominator"] = {"Dominator",650000, ""},
    ["gauntlet"] = {"Gauntlet",600000, ""},
    ["phoenix"] = {"Phoenix",750000, ""},
    ["picador"] = {"Picador",500000, ""},
    ["chino"] = {"Chino",420000, ""},
    ["dukes"] = {"Dukes",450000, ""},
    ["faction"] = {"Faction",400000, ""},
    ["nightshade"] = {"Nightshade",700000, ""}, 
    ["ruiner"] = {"Ruiner",750000, ""},
    ["sabregt"] = {"Sabre GT",600000, ""},
    ["tampa"] = {"Tampa",450000, ""},
    ["virgo"] = {"virgo",450000, ""},
    ["guardian"] = {"Guardian",400000, ""},
    ["bison"] = {"Bison",400000, ""},
    ["sandking"] = {"Sandking",400000, ""},
    ["sandking2"] = {"Sandking SWB",400000, ""},
    ["baller2"] = {"Baller",500000, ""},
    ["patriot"] = {"Patriot",700000, ""},
    ["dubsta2*"] = {"Dubsta",600000, ""},
    ["huntley"] = {"Huntely",750000, ""},
    ["serrano"] = {"Serrano",600000, ""},
    ["cognoscenti"] = {"Cognoscenti",600000, ""},
    ["fugitive"] = {"Fugitive",700000, ""},
    ["tailgater"] = {"Tailgater",700000, ""},
    ["alpha"] = {"Alpha",830000, ""},
    ["cog55"] = {"Cognoscenti 55",700000, ""},
    ["banshee2"] = {"Banshee GT",600000, ""},
    ["bestiagts"] = {"Bestia GTS",700000, ""},
    ["buffalo2"] = {"Buffalo GT",600000, ""},
    ["comet3"] = {"Comet Retro",900000, ""},
    ["coquette"] = {"Coquette",1000000, ""},
    ["coquette2"] = {"Coquette Retro",780000, ""},
    ["coquette3"] = {"Coquette Old",900000, ""},
    ["elegy2"] = {"Elegy",850000, ""},
    ["elegy"] = {"Elegy Retro", 1200000, ""},
    ["feltzer3"] = {"Feltzer Retro",1400000, ""},
    ["feltzer2"] = {"Feltzer",1500000, ""},
    ["futo"] = {"Futo",800000, ""},
    ["fusilade"] = {"Fusilade",950000, ""},
    ["furoregt"] = {"Furore GT",1250000, ""},	
    ["infernus"] = {"Infernus",10000000, ""},
    ["jester"] = {"Jester",1900000, ""},
    ["khamelion"] = {"Khamelion",1500000, ""},
    ["lynx"] = {"Lynx",800000, ""},
    ["massacro"] = {"Massacro",1000000, ""},
    ["ninef"] = {"9F",5500000, ""},
    ["ninef2"] = {"9F Cabrio",6500000, ""},
    ["rapidgt"] = {"Rapid GT",3000000, ""},
    ["rapidgt2"] = {"Rapid GT Cabrio",3000000, ""},
    ["surano"] = {"Surano",850000, ""},
    ["ruston"] = {"Ruston",600000, ""},
    ["schwarzer"] = {"Schwarzer",700000, ""},
    ["seven70"] = {"Seven 70",740000, ""},
    ["specter"] = {"Specter",650000, ""},
    ["specter2"] = {"Specter GTS",800000, ""},
    ["sultan"] = {"Sultan",850000, ""},
    ["sultanrs"] = {"Sultan RS",700000, ""},
    ["verlierer2"] = {"Verlierer",800000, ""},
    ["cheetah"] = {"Cheetah",10000000, ""},
    ["reaper"] = {"Reaper",750000, ""},
    ["tyrus"] = {"Tyrus",750000, ""},
    ["turismor"] = {"Turismo R",5000000, ""},
    ["turismo2"] = {"Turismo R",900000, ""},
    ["zentorno"] = {"Zentorno",10000000, ""},
    ["bullet"] = {"Bullet",900000, ""},
    ["entityxf"] = {"EntityXF",10000000, ""},
    ["voltic"] = {"Voltic",800000, ""},
    ["vacca"] = {"Vacca",2000000, ""},
    ["osiris"] = {"Osiris",10000000, ""},
	["t20"] = {"T20",9000000, ""},
    ["tempesta"] = {"Tempesta",700000, ""},
    ["italigtb"] = {"Italy GTB",800000, ""},
    ["italigtb2"] = {"Italy GTB R",900000, ""},
    ["nero"] = {"Nero",2500000, ""},
    ["nero2"] = {"Nero GTR",5000000, ""},
    ["torero"] = {"Torero",1500000, ""},
    ["xa21"] = {"XA21",2000000, ""},
    ["vagner"] = {"Vagner",1750000, ""},
    ["cheetah2"] = {"cheetah2",500000, ""},
    ["slamvan3 "] = {"Slamvan Bennys",500000, ""},
    ["sabregt2"] = {"Sabre Bennys",500000, ""},
    ["chino2"] = {"Chino Bennys",500000, ""},
    ["buccaneer2"] = {"Buccaneer Bennys",500000, ""},
    ["faction2"] = {"Faction Bennys",500000, ""},
    ["faction3"] = {"Faction Bennys Aro24",500000, ""},
    ["moonbeam2"] = {"Moonbeam Bennys",500000, ""},
	["primo"] = {"Primo",400000, ""},
    ["primo2"] = {"Primo Bennys",500000, ""},
    ["slamvan2"] = {"Slamvan Lost",500000, ""},
    ["prototipo"] = {"X80 Proto",2500000, ""},
  },
   ["Loja de Motos do Jogo"] = {
    _config = {vtype="car",blipid=357,blipcolor=27,radius=5.1},
    ["akuma"] = {"Akuma",45000, ""},
    ["avarus"] = {"Avarus",55000, ""},
    ["carbonrs"] = {"Carbon RS",100000, ""},
    ["chimera"] = {"Triciclo Chimera",90000, ""},
    ["cliffhanger"] = {"Cliffhanger",65000, ""},
    ["diablous2"] = {"Diablous",160000, ""},
    ["defiler"] = {"Defiler",40000, ""},
    ["double"] = {"Double T",50000, ""},
    ["esskey"] = {"Esskey",60000, ""},
    ["hakuchou"] = {"Hakuchou",100000, ""},
    ["hakuchou2 "] = {"Hakuchou R ",125000, ""},
    ["Hexer"] = {"Hexer ",40000, ""},
    ["nemesis"] = {"Nemesis",30000, ""},
    ["nightblade"] = {"Nightblade",75000, ""},
    ["pcj"] = {"PCJ",55000, ""},
    ["ratbike"] = {"Ratbike",25000, ""},
    ["ruffian"] = {"Ruffian",40000, ""},
    ["sanchez"] = {"Sanchez",35000, ""},
    ["thrust"] = {"Thrust",70000, ""},
    ["vindicator"] = {"Vindicator",60000, ""},
    ["vortex"] = {"Vortex",45000, ""},
    ["thrust"] = {"Thrust",70000, ""},
    ["wolfsbane"] = {"Wolfsbane",80000, ""},
    ["zombiea"] = {"Zombie A",45000, ""},
    ["zombieb"] = {"Zombie B",45000, ""},
	["sanctus"] = {"Sanctus",150000, ""}
 },
    ["Garage de Barcos"] = {
    _config = {vtype="car",blipid=357,blipcolor=27,radius=5.1},
    ["seashark"] = {"seashark",15000, ""},
	["marquis"] = {"Barco",155000, ""}
 },
  ["Emergência SAMU"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,permissions={"emergency.vehicle"}},
    ["ur"] = {"Ambulancia",0, ""},
    ["Samu2"] = {"L200 Emergencia",0, ""},
    ["sw4samu"] = {"SW4 Emergencia",0, ""}
  },
  ["Hangar de Helicóptero"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,radius=5.1},
    ["frogger"] = {"Frogger sX",5000000, ""},
    ["supervolito"] = {"Super Volito",8000000, ""}
  },
  ["Águia PM"] = {
    _config = {vtype="car",blipid=43,blipcolor=49,radius=5.1,permissions={"aguiapm.vehicle"}},
    ["polmav"] = {"Aguia",0, ""},
	["maverick"] = {"Helicoptero da PF",0, ""}
  },
  ["Helicóptero SAMU"] = {
    _config = {vtype="car",blipid=43,blipcolor=49,radius=5.1,permissions={"emergency.vehicle"}},
    ["samumav"] = {"Helicoptero Samu",0, ""}
  },
  ["Garagem Taxi"] = {
    _config = {vtype="car",blipid=357,blipcolor=81,permissions={"taxi.vehicle"}},
    ["taxi"] = {"Taxi",0, ""}
  },
  ["Garagem Vendedor"] = {
    _config = {vtype="car",blipid=357,blipcolor=7,permissions={"vendedor.vehicle"}},
   ["p959"] = {"Porsche 959",0, ""}
  },
  ["Garagem Entregador"] = {

    _config = {vtype="bike",blipid=357,blipcolor=31,permissions={"delivery.vehicle"}},
    ["faggio2"] = {"Motinho",0, ""},
    ["enduro"] = {"Fan 150",0, ""}

  },
  ["Garagem Mecanico"] = {

    _config = {vtype="car",blipid=357,blipcolor=31,permissions={"repair.vehicle"}},
    ["towtruck"] = {"Caminhao Guincho",0, ""},
	["flatbed"] = {"Caminhao Prancha",0, ""}

  },
  ["Garagem do Jornalista"] = {

    _config = {vtype="car",blipid=357,blipcolor=4,permissions={"jornalista.vehicle"}},
    ["globocar"] = {"Carro do Jornalista",0, ""},
    ["burrito3"] = {"Carro do Jornalista NPC",0, ""},

  },
  ["Heliponto Jornalista"] = {

    _config = {vtype="car",blipid=357,blipcolor=4,permissions={"jornalista.vehicle"}},
    ["maverick"] = {"Helicoptero do Jornalista NPC",0, ""},
    ["globoheli"] = {"Helicoptero do Jornalista",0, ""}

  },
  ["Garagem Transporte de Valores"] = {
    _config = {vtype="car",blipid=357,blipcolor=4,permissions={"bankdriver.vehicle"}},
    ["stockade"] = {"Carro Forte Proseguir",0, ""}

  },
  ["Veiculos de Graca"] = {
    _config = {vtype="car",blipid=357,blipcolor=4,},
	["BMX"] = {"Bike BMX",0, ""},
    ["scorcher"] = {"Bicicleta",0, ""},
	["rhapsody"] = {"Carro",0, ""}
  },
  ["ROCAM"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,permissions={"ROCAM.vehicle"}},
    ["tigerpm"] = {"Moto Rocam",0, ""}

  },
  ["PF"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,permissions={"prf.vehicle"}},
    ["CHARGERPF"] = {"VTR PF",0, ""},
	["fbi"] = {"VTR Descaracterizada",0, ""}
	
  },
  ["GARAGEM CARRIJO"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,permissions={"CARRIJO.vehicle"}},
    ["towtruck"] = {"Caminhao Guincho",0, ""},
	["flatbed"] = {"Caminhao Prancha",0, ""}

  },
  ["Loja De Caminhao"] = {
    _config = {vtype="car",blipid=357,blipcolor=38,radius=5.1},
    ["benson"] = {"Caminhao Benson",750000, ""},
	["pounder"] = {"Caminhao Pounder",750000, ""},
	["mule3"] = {"Caminhao Mule",500000, ""},
	["tiptruck"] = {"Caminhao Cacamba",500000, ""},
	["scrap"] = {"Caminhao de Sucata",350000, ""},
	["camper"] = {"Caminhao Camper",250000, ""},
	["boxville4"] = {"Caminhao Boxville",200000, ""}

  },
  ["TMBR"] = {
    _config = {vtype="car",blipid=357,blipcolor=27,radius=5.1,permissions={"tmbr.vehicle"}},
    ["xls2"] = {"Blindado",750000, ""},
    ["schafter6"] = {"Blindado2",1000000, ""}
 },
  ["Garagem Farmaceutico"] = {
    _config = {vtype="car",blipid=357,blipcolor=4,permissions={"medical.vehicle"}},
    ["pony2"] = {"Van de Transporte",0, ""}
  },
  ["Hangar de Avioes"] = {
    _config = {vtype="plane",blipid=16,blipcolor=30,permissions={"pilot.vehicle"}},
     ["mammatus"] = {"Avião de Carga",0, "Avião de Carga"}
  },
  ["MC"] = {
    _config = {vtype="car",blipid=494,blipcolor=49,permissions={"MC.garagem"}},
    ["gburrito"] = {"MC Burrito",0, ""},
	["sanctus"] = {"Caverinha",0, ""},
	["daemon"] = {"Harley Davidson",0, ""}
  },
  ["DK Garagem"] = {
    _config = {vtype="car",blipid=355,blipcolor=83,permissions={"dk.garagem"}},
    ["dk350z"] = {"350z nissan",0, ""},
  },
}

cfg.garages = {
  {"MC",954.80975341797,-133.55918884277,74.448753356934},
  {"DK Garagem",-1145.4311523438,-1973.9484863281,13.160756111145},
  {"Garage de Barcos",-782.296875,-1500.3767089844,0.77515125274658},
  {"Loja de Carros",-57.326511383057,-1110.7546386719,26.435815811157},
  {"Loja de Carros",-580.55767822266,316.67123413086,84.783363342285}, -- M.C
  {"Loja De Caminhao",-50.079391479492,-1684.6715087891,29.486633300781},
  {"Loja De Caminhao",1245.7906494141,2713.1945800781,38.005790710449}, -- mineiros
  {"Loja De Caminhao",2413.6538085938,4989.47265625,46.22057723999}, -- FAZENDA
  {"Garagem",1404.8968505859,1118.7971191406,114.83769226074},
  {"Garagem",151.99737548828,-1309.5081787109,29.202308654785}, -- GARAGEM PABLETE
  {"Garagem",497.71151733398,-1335.3879394531,29.327247619629},
  {"Garagem",-628.97888183594,517.07104492188,109.62802886963},
  {"Garagem",-3179.3413085938,1290.2540283203,14.213930130005},  -- GARAGEM CARRIJO
  {"Garagem",1220.6368408203,2710.6381835938,38.005794525146},
  {"Garagem",-1285.8405761719,-1396.0804443359,4.5522351264954}, -- Garagem Academia
  {"Garagem",1930.3410644531,3745.3630371094,32.30867767334},
  {"Garagem",-138.35879516602,6353.3129882813,31.487783432007},
  {"Garagem",14.125163078308,548.78796386719,176.2001953125},
  {"Garagem",693.4140625,-724.98785400391,26.318157196045},
  {"Garagem",-297.95516967773,-991.01470947266,31.080604553223},
  {"Garagem",212.30700683594,-798.68682861328,30.877960205078},
  {"Garagem",1376.1893310547,-740.61248779297,67.232833862305},
  {"Garagem",705.12066650391,-292.31414794922,59.183948516846},
  {"Garagem",-742.150390625,-1503.5146484375,5.0005226135254},
  {"Garagem",894.30828857422,-51.476318359375,78.764373779297},
  {"Garagem",-797.47314453125,600.15716552734,127.32711791992},
  {"Garagem",-795.96862792969,304.84030151367,85.700485229492},
  {"Garagem",1728.5637207031,3313.8908691406,41.223480224609},
  {"Garagem",-2587.8881835938,1931.3624267578,167.30470275879}, -- MNC
  {"Garagem",-51.9446144104,-786.52667236328,44.074012756348}, -- TMBR
  {"Garagem",-836.31384277344,114.28999328613,55.355060577393}, -- Garagem P.C.C
  {"Garagem do Jornalista",-621.27142333984,-923.95275878906,23.096454620361}, -- Garage Jornalista
  {"Heliponto Jornalista",-583.52429199219,-930.64739990234,36.833553314209}, -- Heliponto
  {"Carros Exoticos",471.76739501953,-1095.3955078125,29.202119827271},
  {"Carros Exoticos",1735.1473388672,3315.8740234375,41.223480224609},
  {"Loja de Motos",-44.580539703369,-1112.2740478516,26.435792922974},
  {"Loja de Motos",-564.75500488281,300.49337768555,83.096389770508}, -- M.C
  {"Garagem Agiota",-45.200160980225,-1116.4178466797,26.433847427368},
  {"Carros de Juiz",448.804, -1020.32, 28.4669}, -- Juiz
  {"Carros de Juiz",210.62229919434,-791.44519042969,30.91099357605}, -- Juiz Tribunal
  {"Carros de Policia",448.804, -1020.32, 28.4669},  -- jobs garage
  {"Carros de Policia",476.78564453125,-1022.2557373047,28.052248001099},
  {"Carros de Policia",1859.0147705078,3675.3530273438,33.607105255127},
  {"Carros de Policia",378.612274169922,-1629.18676757813,28.5226573944092},  -- jobs garage
  {"Carros de Policia",-479.875,6028.1884765625,31.340543746948},  -- jobs garage
  {"Força Tatica",448.804, -1020.32, 28.4669},  -- jobs garage
  {"Força Tatica",476.78564453125,-1022.2557373047,28.052248001099},
  {"Força Tatica",1859.0147705078,3675.3530273438,33.607105255127},
  {"Força Tatica",378.612274169922,-1629.18676757813,28.5226573944092},  -- jobs garage
  {"Força Tatica",-479.875,6028.1884765625,31.340543746948},  -- jobs garage/
  {"Policia Civil",448.804, -1020.32, 28.4669},  -- jobs garage
  {"Policia Civil",476.78564453125,-1022.2557373047,28.052248001099},
  {"Policia Civil",1859.0147705078,3675.3530273438,33.607105255127},
  {"Policia Civil",378.612274169922,-1629.18676757813,28.5226573944092},  -- jobs garage
  {"Policia Civil",-479.875,6028.1884765625,31.340543746948},  -- jobs garage
  {"ROCAM",448.804, -1020.32, 28.4669},  -- jobs garage
  {"ROCAM",476.78564453125,-1022.2557373047,28.052248001099},
  {"ROCAM",1859.0147705078,3675.3530273438,33.607105255127},
  {"ROCAM",378.612274169922,-1629.18676757813,28.5226573944092},  -- jobs garage
  {"ROCAM",-479.875,6028.1884765625,31.340543746948},  -- jobs garage
  {"PF",448.804, -1020.32, 28.4669},
  {"PF",476.78564453125,-1022.2557373047,28.052248001099},
  {"PF",1859.0147705078,3675.3530273438,33.607105255127},
  {"PF",378.612274169922,-1629.18676757813,28.5226573944092},  -- jobs garage
  {"PF",-479.875,6028.1884765625,31.340543746948},
  {"Garagem Onibus",467.61862182617,-586.6650390625,28.499605178833}, -- Jobs Onibus
  {"Garagem Onibus de Viajem",467.61862182617,-586.6650390625,28.499605178833}, -- Jobs Onibus
  {"Comandante",448.804, -1020.32, 28.4669},  -- jobs garage
  {"Comandante",476.78564453125,-1022.2557373047,28.052248001099},
  {"Comandante",1859.0147705078,3675.3530273438,33.607105255127},
  {"Comandante",378.612274169922,-1629.18676757813,28.5226573944092},  -- jobs garage
  {"Comandante",-479.875,6028.1884765625,31.340543746948},  -- jobs garage
  {"Rota",448.804, -1020.32, 28.4669},  -- jobs garage
  {"Rota",476.78564453125,-1022.2557373047,28.052248001099},
  {"Rota",1859.0147705078,3675.3530273438,33.607105255127},
  {"Rota",378.612274169922,-1629.18676757813,28.5226573944092},  -- jobs garage
  {"Rota",-479.875,6028.1884765625,31.340543746948},  -- jobs garage
  {"Emergência SAMU",1833.3223876953,3661.3088378906,33.875843048096}, -- sandy shores
  {"Emergência SAMU",-255.98040771484,6346.1127929688,32.426189422607}, -- paleto
  {"Emergência SAMU",1157.6657714844,-1494.8474121094,34.692565917969},
  {"Emergência SAMU",-301.07235717773,-1011.3651123047,30.384376525879},
  {"Emergência SAMU",1158.1467285156,-1477.8056640625,34.692562103271},
  {"Emergência SAMU",358.91650390625, -607.78515625, 28.6820983886719},
  {"Garagem",-1900.7344970703,-560.89245605469,11.802397727966},-- jobs garage
  {"Garagem Entregador",144.21627807617,-1458.2448730469,29.134799957275},   -- jobs garage
  {"Garagem Mecanico",408.85733032227,-1639.1143798828,29.291933059692},   -- jobs garage
  {"Garagem Mecanico",1683.5802001953,3272.3071289063,40.804527282715},   -- Organizador
  {"Garagem Transporte de Valores",222.68756103516,222.95631408691,105.41331481934},   -- jobs garage
  {"Águia PM",449.30340576172,-981.24963378906,43.69165802002}, -- Main PD
  {"Águia PM",1770.2171630859,3239.5561523438,42.13171005249}, -- Sandy Shores
  {"Águia PM",-475.24264526367,5988.7353515625,31.336685180664}, -- Paleto Bay
  {"Helicóptero SAMU",449.30340576172,-981.24963378906,43.69165802002}, -- Main PD
  {"Helicóptero SAMU",1770.2171630859,3239.5561523438,42.13171005249}, -- Sandy Shores
  {"Helicóptero SAMU",-475.24264526367,5988.7353515625,31.336685180664}, -- Paleto Bay
  {"Helicóptero SAMU",-316.63583374023,-1005.2643432617,30.385076522827},
  {"Bote de Pescador",1508.8854980469,3908.5732421875,30.031631469727},
  {"Bote de tartaruga",3397.3959960938,2660.8488769531,0.76267087459564},
  {"Veiculos de Graca",-236.50102233887,-991.77520751953,29.199193954468},
  {"Veiculos de Graca",-1053.8284912109,-2541.7038574219,20.078929901123},
  {"Garagem Farmaceutico",-319.82263183594,-942.8408203125,31.080617904663},
  --{"Loja de Carro do Jogo",-228.97842407227,-1162.1657714844,22.984840393066},
  --{"Loja de Carro do Jogo",-570.96856689453,317.02575683594,84.481895446777}, -- M.C
  {"Loja de Motos do Jogo",-225.17660522461,-1162.2961425781,23.014472961426},
  {"Loja de Motos do Jogo",-563.75115966797,304.41653442383,83.206474304199}, -- M.C
  {"GARAGEM CARRIJO",488.19549560547,-1399.8034667969,29.276258468628},
  {"TMBR",-3171.6115722656,1303.9229736328,14.807263374329},
  {"Garagem Bronze",473.0041809082,-1109.2114257813,29.199594497681},
  {"Garagem Diamante",473.17498779297,-1105.8723144531,29.200244903564},
  {"Garagem Ouro",472.84448242188,-1089.1838378906,29.20366859436},
  {"Garagem Premium",473.34536743164,-1084.1982421875,29.20422744751},
  {"Hangar de Avioes",-901.70129394531,-3293.984375,13.944430351257},
  {"Hangar de Avioes",2128.9069824219,4806.134765625,41.168750762939},
  {"Hangar de Helicóptero",-724.57073974609,-1444.6761474609,5.0005235671997},
  {"Hangar de Helicóptero",1719.6343994141,3254.3781738281,41.143253326416},
  {"Hangar de Avioes",1734.9053955078,3297.9689941406,41.223503112793},
}

return cfg
