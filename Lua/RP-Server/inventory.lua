
local cfg = {}

-- Inventário de carros Antigo SERVIDOR, Edit by Bravoow Tecnologia

cfg.inventory_weight_per_strength = 10 -- weight for an user inventory per strength level (no unit, but thinking in "kg" is a good norm)

-- default chest weight for vehicle trunks
cfg.default_vehicle_chest_weight = 50

-- define vehicle chest weight by model in lower case
cfg.vehicle_chest_weights = {
  ["blista"] = 70,
  ["surge"] = 80,
  ["rocoto"] = 100,
  ["tampa"] = 70,
  ["vwpolo"] = 80,
  ["pajero4"] = 115,
  ["santafe"] = 120,
  ["srt8"] = 125,
  ["oracle"] = 55,
  ["mk7"] = 65,
  ["cavalcade"] = 150,
  ["vacca"] = 90,
  ["a45"] = 65,
  ["baller"] = 120,
  ["bison"] = 200,
  ["kuruma"] = 80,
  ["fq2"] = 120,
  ["mule"] = 250,
  ["benson"] = 350,
  ["pounder"] = 500,
  ["huntley"] = 100,
  ["landstalker"] = 120,
  ["radi"] = 80,
  ["xls"] = 130

}

return cfg
