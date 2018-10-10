
local cfg = {}

-- define static item transformers
-- Edit by Bravoow Tecnologia

cfg.item_transformers = {
  -- example of harvest item transformer
  {  
    name="Entregador", -- menu name
    permissions = {"mission.delivery.food"},
    r=0,g=125,b=255, -- color
    max_units=200,
    units_per_minute=20,
    x=141.15475463867,y=-1461.4567871094,z=29.357034683228, -- pos
    radius=2.5, height=1.5, -- area
    recipes = {
      ["Coca Cola"] = { -- action name
        description="Coca Cola Geladinha.", -- action description
        in_money=10, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["coca_cola"] = 1
        }
      },
      ["Pizza"] = { -- action name
        description="Pizzas Saborosas.", -- action description
        in_money=15, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["pizza"] = 1
        }
      }
    }
    --, onstart = function(player,recipe) end, -- optional start callback
    -- onstep = function(player,recipe) end, -- optional step callback
    -- onstop = function(player,recipe) end -- optional stop callback
  },
  {

    name="Pescador", -- menu name
    permissions = {"mission.delivery.fish"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=200,
    units_per_minute=20,
    x=743.19586181641,y=3895.3967285156,z=30.5, 
    radius=4, height=1.5, -- area
    recipes = {
      ["Peixe Robalo"] = { -- action name
        description="Pescar Peixe Robalo com Isca", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["isca"] = 1
      },
        products={ -- items given per unit
          ["robalo"] = 2
        }
      },
      ["Peixe Traira"] = { -- action name
        description="Pescar Peixes Traira com Isca", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["isca"] = 1
      },
        products={ -- items given per unit
          ["traira"] = 2
        }
      }
    }
  },
  {
    name="Pescador de Tartaruga", -- menu name
    permissions = {"harvest.tartaruga"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=20, -- unidades que o transformador ganha de volta por minuto
    x=4095.5485839844,y=4464.8696289063,z=1.9822434186935, -- pos
    radius=2.5, height=0.5, -- area
    recipes = { -- items do menu
      ["Pescar"] = { -- action name
        description="Pescar Tartaruga com Rede.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["rede"] = 1
      },
        products={ -- items given per unit
          ["Tartaruga"] = 2
        }
      }
    }
  },
  {
    name="Vender Tartaruga", -- menu name
    permissions = {"process.Tartaruga"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=20, -- unidades que o transformador ganha de volta por minuto
    x=-119.17678833008,y=-1486.1040039063,z=36.98205947876, -- pos -119.17678833008,-1486.1040039063,36.98205947876
    radius=2.5, height=0.5, -- area
    recipes = { -- items do menu
      ["Vender Tartaruga"] = { -- action name
        description="", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Tartaruga"] = 1
      },
        products={ -- items given per unit
          ["dirty_money"] = 600
        }
      }
    }
  },
  {
    name="Curral de vacas", -- menu name
    permissions = {"harvest.vacas"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200000, -- unidades maximas do item
    units_per_minute=2000, -- unidades que o transformador ganha de volta por minuto
    x=1230.6618652344,y=1855.7913818359,z=79.234764099121, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Ordenhar"] = { -- action name
        description="Ordenhar Leite com o Balde.", -- action description

        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["balde"] = 1
      },
        products={ -- items given per unit
          ["baldedeleite"] = 2

        }
      }
    }
  },
  {
    name="Processador de Leite", -- menu name
    permissions = {"process.Leite"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200000, -- unidades maximas do item
    units_per_minute=20000, -- unidades que o transformador ganha de volta por minuto
    x=893.67346191406,y=3607.2319335938,z=32.824211120605, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processar Leite.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["baldedeleite"] = 1
      },
        products={ -- items given per unit
          ["Caixas de Leite"] = 1
        }
      }
    }
  },
  {
    name="Vender de Leite", -- menu name
    permissions = {"vender.Leite"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=20000, -- unidades maximas do item
    units_per_minute=200, -- unidades que o transformador ganha de volta por minuto
    x=2909.2255859375,y=4337.435546875,z=50.297298431396, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Vender"] = { -- action name
        description="Vender Leite.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Caixas de Leite"] = 1
      },
        products={ -- items given per unit
          ["money"] = 120

        }
      }
    }
  },
  {
    name="Campo de Diamante", -- Nome do menu
    permissions = {"harvest.diamante"}, -- Você pode adicionar permissões
    r=0,g=200,b=0, -- cor




    max_units=200000,
    units_per_minute=2000,
    x=-594.40759277344,y=2092.2802734375,z=131.56622314453, -- Localização
    radius=2.5, height=1.5, -- area


    recipes = {
      ["Minerar"] = { -- Nome da ação
        description="Diamante Bruto minerar com a Picareta.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={  -- items taken per unit
          ["picareta"] = 1
      },
        products={ -- items given per unit
          ["Diamante com Pedra"] = 2
        }
      }
    }
  },
  {
    name="Processador de Diamante", -- menu name
    permissions = {"process.diamante"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200000, -- unidades maximas do item
    units_per_minute=2000, -- unidades que o transformador ganha de volta por minuto
    x=830.19476318359,y=2147.2534179688,z=52.293380737305, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processador de Diamante.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Diamante com Pedra"] = 1
      },
        products={ -- items given per unit
          ["Diamante"] = 1
        }
      }
    }
  },
  {
    name="Venda de Diamante", -- menu name
    permissions = {"venda.diamante"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=2000, -- unidades maximas do item
    units_per_minute=200, -- unidades que o transformador ganha de volta por minuto
    x=2717.4016113281,y=1496.3310546875,z=24.500703811646, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Vender"] = { -- action name
        description="Vender Diamante.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Diamante"] = 1
      },
        products={ -- items given per unit
          ["money"] = 280
        }
      }
    }
  },
  {
    name="Criar Pistola", -- menu name
    permissions = {"criar.armas"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=3, -- unidades maximas do item
    units_per_minute=1, -- unidades que o transformador ganha de volta por minuto
    x=899.38250732422,y=-3224.1867675781,z=-98.266670227051, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Criar Pistola"] = { -- action name
        description="Criar Pistola.", -- action description
        in_money=20000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["pistol_parts"] = 1
      },
        products={ -- items given per unit
          ["wbody|WEAPON_COMBATPISTOL"] = 1
        }
      }
    }
  },
  {
    name="Vender Pistola", -- menu name
    permissions = {"vender.armas"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=50, -- unidades que o transformador ganha de volta por minuto
    x=249.37120056152,y=-50.248447418213,z=69.94108581543, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Vender Pistola"] = { -- action name
        description="Vender Pistola.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["wbody|WEAPON_COMBATPISTOL"] = 1
      },
        products={ -- items given per unit
          ["dirty_money"] = 4000
        }
      }
    }
  },
  {
    name="Criar Shotgun", -- menu name
    permissions = {"criar.armas"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=3, -- unidades maximas do item
    units_per_minute=1, -- unidades que o transformador ganha de volta por minuto
    x=896.67388916016,y=-3218.0920410156,z=-98.228691101074, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Criar Shotgun"] = { -- action name
        description="Criar Shotgun.", -- action description
        in_money=35000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["shotgun_parts"] = 1
      },
        products={ -- items given per unit
          ["wbody|WEAPON_PUMPSHOTGUN"] = 1
        }
      }
    }
  },
  {
    name="Vender Shotgun", -- menu name
    permissions = {"vender.armas"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=50, -- unidades que o transformador ganha de volta por minuto
    x=-1308.6829833984,y=-394.77651977539,z=36.695777893066, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Vender Shotgun"] = { -- action name
        description="Vender Shotgun.", -- action description

        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["wbody|WEAPON_PUMPSHOTGUN"] = 1
      },
        products={ -- items given per unit
          ["dirty_money"] = 11000

        }
      }
    }
  },
  {
    name="Criar SMG", -- menu name
    permissions = {"criar.armas"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=3, -- unidades maximas do item
    units_per_minute=1, -- unidades que o transformador ganha de volta por minuto
    x=908.94763183594,y=-3210.8532714844,z=-98.222160339355, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Criar SMG"] = { -- action name
        description="Criar SMG.", -- action description
        in_money=120000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["smg_parts"] = 1
      },
        products={ -- items given per unit
          ["wbody|WEAPON_SMG"] = 1
        }
      }
    }
  },
  {
    name="Vender SMG", -- menu name
    permissions = {"vender.armas"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=50, -- unidades que o transformador ganha de volta por minuto
    x=2569.1779785156,y=293.94525146484,z=108.73488616943, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Vender SMG"] = { -- action name
        description="Vender Shotgun.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["wbody|WEAPON_SMG"] = 1
      },
        products={ -- items given per unit
          ["dirty_money"] = 23000

        }
      }
    }
  },
  {
    name="Campo De Ouro", -- Nome do menu
    permissions = {"harvest.Ouro"}, -- Você pode adicionar permissões
    r=0,g=200,b=0, -- cor
    max_units=200000,
    units_per_minute=2000,
    x=2947.0209960938,y=2802.8874511719,z=41.299701690674, -- Localização
    radius=2.5, height=1.5, -- area
    recipes = {
      ["Minerar"] = { -- Nome da ação
        description="Ouro Bruto minerar com Picareta.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={  -- items taken per unit
          ["picareta"] = 1
      },
        products={ -- items given per unit
          ["Pepitas de Ouro"] = 3
        }
      }
    }
  },
  {
    name="Processamento de Ouro", -- menu name
    permissions = {"process.Ouro"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200000, -- unidades maximas do item
    units_per_minute=2000, -- unidades que o transformador ganha de volta por minuto
    x=3334.580078125,y=5162.70703125,z=18.316473007202, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processar Ouro Bruto.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Pepitas de Ouro"] = 1
      },
        products={ -- items given per unit
          ["Ouro"] = 1
        }
      }
    }
  },
  {
    name="Venda de Ouro", -- menu name
    permissions = {"venda.Ouro"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=20000, -- unidades maximas do item
    units_per_minute=2000, -- unidades que o transformador ganha de volta por minuto
    x=-1112.0698242188,y=4937.2407226563,z=218.39852905273, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Vender"] = { -- action name
        description="Venda de Ouro.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Ouro"] = 1
      },
        products={ -- items given per unit
          ["money"] = 280
        }
      }
    }

  },
  {
    name="Campo De Cobre", -- Nome do menu
    permissions = {"harvest.Cobre"}, -- Você pode adicionar permissões
    r=0,g=200,b=0, -- cor
    max_units=20000,
    units_per_minute=2000,
    x=-924.85504150391,y=4835.8149414063,z=308.70788574219, -- Localização

    radius=2.5, height=1.5, -- area
    recipes = {
      ["Pegar"] = { -- Nome da ação
        description="Farme De Cobre minerar com Picareta.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={  -- items taken per unit
          ["picareta"] = 1
      },
        products={ -- items given per unit
          ["Pepitas de Cobre"] = 4
        }
      }
    }
  },
  {
    name="Processamento de Cobre ", -- menu name
    permissions = {"process.Cobre"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=20000, -- unidades maximas do item
    units_per_minute=2000, -- unidades que o transformador ganha de volta por minuto
    x=814.57116699219,y=1176.7609863281,z=330.70367431641, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processar Cobre.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Pepitas de Cobre"] = 1
      },
        products={ -- items given per unit
          ["Cobre"] = 1
        }
      }
    }
  },
  {
    name="Venda de Cobre ", -- menu name
    permissions = {"venda.Cobre"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=20000, -- unidades maximas do item
    units_per_minute=2000, -- unidades que o transformador ganha de volta por minuto
    x=2731.8955078125,y=1564.7276611328,z=24.500968933105, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Vender"] = { -- action name
        description="Vender Cobre.", -- action description

        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Cobre"] = 1
      },
        products={ -- items given per unit
          ["money"] = 120

        }
      }
    }

  },
  {
    name="Farmar Sal", -- Nome do menu
    permissions = {"harvest.sal"}, -- Você pode adicionar permissões
    r=0,g=200,b=0, -- cor
    max_units=200,
    units_per_minute=20,
    x=-1605.7797851563,y=5258.8530273438,z=2.0872757434845, -- Localização

    radius=2.5, height=1.5, -- area
    recipes = {
      ["Minerar"] = { -- Nome da ação
        description="Farme de Sal minerar com Pa.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={  -- items taken per unit
          ["pa"] = 1
      },
        products={ -- items given per unit
          ["Sal Fino"] = 5
        }
      }
    }
  },
  {
    name="Processamento de Sal ", -- menu name
    permissions = {"process.sal"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=20, -- unidades que o transformador ganha de volta por minuto
    x=253.1393737793,y=894.65246582031,z=209.43571472168, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processador Sal.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Sal Fino"] = 1
      },
        products={ -- items given per unit
          ["Pacote de Sal"] = 1
        }
      }
    }
  },
  {
    name="Venda de Sal ", -- menu name
    permissions = {"venda.sal"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=20, -- unidades que o transformador ganha de volta por minuto
    x=2760.7849121094,y=1487.5935058594,z=30.791778564453, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Vender"] = { -- action name
        description="Venda de Sal.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Pacote de Sal"] = 1
      },
        products={ -- items given per unit
          ["money"] = 80
        }
      }
    }
  },
  {
    name="Farmar Trigo", -- Nome do menu
    permissions = {"harvest.trigo"}, -- Você pode adicionar permissões
    r=0,g=200,b=0, -- cor
    max_units=200,
    units_per_minute=20,
    x=2049.9018554688,y=4941.5913085938,z=40.966903686523, -- Localização
    radius=2.5, height=1.5, -- area
    recipes = {
      ["Minerar"] = { -- Nome da ação
        description="Farme De Trigo minerar com foice.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={  -- items taken per unit
          ["foice"] = 1
      },
        products={ -- items given per unit
          ["Trigo"] = 5

        }
      }
    }
  },
  {
    name="processador de Trigo ", -- menu name
    permissions = {"process.trigo"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=20, -- unidades que o transformador ganha de volta por minuto
    x=2342.8767089844,y=2616.7216796875,z=46.667598724365, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processador de Trigo.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Trigo"] = 1
      },
        products={ -- items given per unit
          ["Pacotes de Trigo"] = 1
        }
      }
    }
  },
  {
    name="Venda de Trigo ", -- menu name
    permissions = {"venda.trigo"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=20, -- unidades que o transformador ganha de volta por minuto
    x=1941.9615478516,y=4657.1611328125,z=40.541007995605, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Vender"] = { -- action name
        description="Venda de Trigo.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Pacotes de Trigo"] = 1
      },
        products={ -- items given per unit
          ["money"] = 60
        }
      }
    }
  },
  {
    name="Lavagem de Dinheiro", -- menu name
    permissions = {"process.dinheiro"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=40, -- unidades que o transformador ganha de volta por minuto
    x=-720.21801757813,y=-2235.1335449219,z=7.2344174385071, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Lavar"] = { -- action name
        description="Lavagem de Dinheiro com 60º%.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["dirty_money"] = 500
      },
        products={ -- items given per unit
          ["money"] = 300

        }
      }
    }



  },
{
    name="Lavagem de Dinheiro", -- 80% dos Galpões
    permissions = {"process.dinheiro"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=40, -- unidades que o transformador ganha de volta por minuto
    x=1119.1614990234,y=-3197.8588867188,z=-40.393184661865, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Lavar"] = { -- action name
        description="Lavagem de Dinheiro com 60%.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["dirty_money"] = 500
      },
        products={ -- items given per unit
          ["money"] = 300
        }
      }
    }
  },
{
    name="Lavagem de Yakuza", -- 80% dos Galpões
    permissions = {"yakuza.dinheiro"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200000, -- unidades maximas do item
    units_per_minute=1000, -- unidades que o transformador ganha de volta por minuto
    x=-2601.8469238281,y=1876.6229248047,z=167.31968688965, -- pos
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Lavar"] = { -- action name
        description="Lavagem de Dinheiro com 100%.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["dirty_money"] = 10000
      },
        products={ -- items given per unit
          ["money"] = 10000
        }
      }
    }
  },   
  {
    name="Treinamento", -- menu name
    r=255,g=125,b=0, -- color
    max_units=2000000,
    units_per_minute=500,
    x=-1202.96252441406,y=-1566.14086914063,z=4.61040639877319,
    radius=7.5, height=1.5, -- area
    recipes = {
      ["Treinar"] = { -- action name
        description="Treinar pra ficar Fortinho,Aumentando seu lvl de Força aumenta sua capacidade do Iventario.", -- action description

        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={}, -- items given per unit
        aptitudes={ -- optional
          ["physical.strength"] = 1 -- "group.aptitude", give 1 exp per unit
        }
      }
    }
  },
  {
    name="Hackear Cartões de Crédito", -- menu name
	permissions = {"hacker.credit_cards"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=200,
    units_per_minute=5,
    x=-1057.0246582031,y=-233.2060546875,z=44.021129608154,

    radius=2, height=1.0, -- area
    recipes = {
      ["Hackear"] = { -- action name
        description="Hackear informações de Cartões de Crédito.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["credit"] = 1,
		["dirty_money"] = 100
		}, -- items given per unit
        aptitudes={ -- optional
          ["hacker.hacking"] = 0.2 -- "group.aptitude", give 1 exp per unit
        }
      }
    }
  },
  {
    name="Contrabandista de Armas", -- menu name
    permissions = {"mission.weapons.smuggler"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=200,
    units_per_minute=20,
    x=-343.28500366211,y=6098.6586914063,z=31.327739715576,
    radius=3, height=1.5, -- area
    recipes = {
      ["Obter AK's"] = { -- action name
        description="Pegar AK's", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["AK47"] = 1
        }
      },
      ["Obter M4A1"] = { -- action name
        description="Pegar M4's", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["M4A1"] = 1
        }
      }
    }
  },
  {
    name="Carteira de Habilitacao", -- menu name
    r=255,g=125,b=46, -- color
    max_units=100,
    units_per_minute=10,
    x=-261.40533447266,y=-965.15747070313,z=31.224115371704,        
    radius=2, height=1.0, -- area
    recipes = {
      ["Pagar Habilitação"] = { -- action name
       description="Habilitação de Motorista.", -- action description`
        in_money=2000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["driver"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Carteira de Advogado", -- menu name
    r=255,g=125,b=46, -- color
    max_units=100,
    units_per_minute=10,
    x=-1912.056640625,y=-569.65020751953,z=19.097211837769,        
    radius=2, height=1.0, -- area
    recipes = {
      ["Pagar"] = { -- action name
       description="OAB Carteira de Advogado", -- action description`
        in_money=5000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["oabcda"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Funcional Policial Militar", -- menu name
	permissions = {"carteirapm.loadshop"},
    r=255,g=125,b=46, -- color
    max_units=100,
    units_per_minute=10,
    x=451.67889404297,y=-976.76116943359,z=30.689596176147,        
    radius=1, height=1.0, -- area
    recipes = {
      ["Pegar"] = { -- action name
       description="Carteira de Identidade Policial Militar.", -- action description`
        in_money=5000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["carteirapm"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Funcional Juiz", -- menu name
	permissions = {"carteirajuiz.loadshop"},
    r=255,g=125,b=46, -- color
    max_units=100,
    units_per_minute=10,
    x=117.42779541016,y=-752.26342773438,z=258.1520690918,        
    radius=1, height=1.0, -- area
    recipes = {
      ["Pegar"] = { -- action name
       description="Tibunal de Justica Arbitral.", -- action description`
        in_money=20000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["carteirajuiz"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Funcional Policial Civil", -- menu name
	permissions = {"carteirapciv.loadshop"},
    r=255,g=125,b=46, -- color
    max_units=100,
    units_per_minute=10,
    x=451.71850585938,y=-974.2109375,z=30.689596176147,        
    radius=1, height=1.0, -- area
    recipes = {
      ["Pegar"] = { -- action name
       description="Carteira de Identidade Policial Civil.", -- action description`
        in_money=3000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["carteiraciv"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Certificado de Registro Medico", -- menu name
	permissions = {"carteirasrm.loadshop"},
    r=255,g=125,b=46, -- color
    max_units=100,
    units_per_minute=10,
    x=246.19535827637,y=-1354.5625,z=24.5378074646,        
    radius=1, height=1.0, -- area
    recipes = {
      ["Pegar"] = { -- action name
       description="Certificado de Registro Medico.", -- action description`
        in_money=5000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["carteirasrm"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Certificado de Registro Medico", -- menu name
	permissions = {"carteirasrm.loadshop"},
    r=255,g=125,b=46, -- color
    max_units=100,
    units_per_minute=10,
    x=244.31977844238,y=-1382.4599609375,z=39.534374237061,        
    radius=1, height=1.0, -- area
    recipes = {
      ["Pegar"] = { -- action name
       description="Certificado de Registro Medico.", -- action description`
        in_money=5000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["carteirasrm"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="FENAJ Carteira de Jornalista", -- menu name
  permissions = {"carteirasjr.loadshop"},
    r=255,g=125,b=46, -- color
    max_units=100,
    units_per_minute=10,
    x=-597.74279785156,y=-936.12847900391,z=23.864892959595,        
    radius=1, height=1.0, -- area
    recipes = {
      ["Pegar"] = { -- action name
       description="FENAJ Carteira de Jornalista.", -- action description`
        in_money=1000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
    ["carteirajr"] = 1
    }, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Transportador de Valores", -- menu name
	permissions = {"bankdriver.money"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=100,
    units_per_minute=10,
    x=236.87298583984,y=217.09535217285,z=106.28678894043,
    radius=2, height=1.0, -- area
    recipes = {
      ["Dinheiro"] = { -- action name
       description="Dinheiro do Banco.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["bank_money"] = 200000
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Porte de Arma", -- menu name
	permissions = {"porte.arma"},
    r=255,g=125,b=46, -- color
    max_units=100,
    units_per_minute=1,
    x=437.33297729492,y=-991.03582763672,z=30.689599990845,
    radius=1, height=1.0, -- area
    recipes = {
      ["Pegar"] = { -- action name
       description="Porte de Arma.", -- action description`
        in_money=40000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["portearma"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },





  {
    name="Campo de Cocaina", -- menu name
    permissions = {"harvest.weed"}, -- you can add permissions
    r=0,g=200,b=0, -- color
    max_units=500,
    units_per_minute=200,
    x=442.52639770508,y=6465.33984375,z=28.732902526855,

    radius=1.5, height=1.5, -- area
    recipes = {
      ["Colher"] = { -- action name
        description="Folhas de Coca.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["folhadecoca"] = 1
        }
      }
	 }
  },  
  {
    name="Processador de cocaina", -- Galpão Coca
    permissions = {"process.cocaine"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=500, -- unidades maximas do item
    units_per_minute=200, -- unidades que o transformador ganha de volta por minuto
    x=1090.3659667969,y=-3196.6691894531,z=-38.993473052979, -- pos
    radius=1.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processador de Cocaina.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["folhadecoca"] = 1
      },


        products={ -- items given per unit
          ["cocaina"] = 1





        }
      }
    }
  },
  {
    name="Processador de cocaina", -- Galpão Coca
    permissions = {"process.cocaine"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=500, -- unidades maximas do item
    units_per_minute=200, -- unidades que o transformador ganha de volta por minuto
    x=1095.3104248047,y=-3194.9038085938,z=-38.993423461914, -- pos
    radius=1.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processador de Cocaina.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["folhadecoca"] = 1
      },
        products={ -- items given per unit
          ["cocaina"] = 1
        }
      }
    }
  },
  {
    name="Campo de Maconha", -- menu name
    permissions = {"harvest.weed"}, -- you can add permissions
    r=0,g=200,b=0, -- color
    max_units=500,
    units_per_minute=200,
    x=-1801.8638916016,y=2192.1975097656,z=100.54093170166, -- pos
    radius=1.5, height=1.5, -- area
    recipes = {
      ["Colher"] = { -- action name
        description="Folhas de Maconha.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["seeds"] = 1
        }
      }
    }
  },
    {
    name="Processar Maconha", -- Galpão Maconha
    permissions = {"process.weed"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=500, -- unidades maximas do item
    units_per_minute=200, -- unidades que o transformador ganha de volta por minuto
    x=1034.6259765625,y=-3205.4460449219,z=-38.176727294922, -- pos
    radius=1.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processador de Maconha.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["seeds"] = 1
    },

        products={ -- items given per unit
          ["caannabis"] = 1





        }
      }
    }
  },
  {
    name="Processar Maconha", -- Galpão Maconha
    permissions = {"process.weed"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=500, -- unidades maximas do item
    units_per_minute=200, -- unidades que o transformador ganha de volta por minuto
    x=1037.6231689453,y=-3205.3979492188,z=-38.170021057129, -- pos
    radius=1.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processador de Maconha.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["seeds"] = 1
    },


        products={ -- items given per unit
          ["caannabis"] = 1






        }
      }
    }
  },
  -- CAMPO DE METANFETAMINA    
  {
    name="Campo de Metanfetamina", -- Nome do menu







    permissions = {"harvest.metanfetamina"}, -- Você pode adicionar permissões
    r=0,g=200,b=0, -- cor
    max_units=500,
    units_per_minute=200,
    x=163.21620178223,y=2220.1794433594,z=90.446632385254, -- Localização

    radius=1.5, height=1.5, -- area
    recipes = {
      ["Colher"] = { -- Nome da ação
        description="Colher Crystal Melamine.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={}, -- Itens colhidos por unidade
        products={ -- Nome do produto fornecido por unidade
          ["crystalmelamine"] = 1








        }
      }
    }
  },
  {
    name="Processar Metanfetamina", -- Galpão de Meta
    permissions = {"process.metanfetamina"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=500, -- unidades maximas do item
    units_per_minute=200, -- unidades que o transformador ganha de volta por minuto
    x=1011.5279541016,y=-3198.4162597656,z=-38.993148803711, -- pos
    radius=1.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processador de Metanfetamina.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["crystalmelamine"] = 1
    },
        products={ -- items given per unit
          ["metanfetamina"] = 1
        }
      }


    }
  },
  {


    name="Processar Ervas Medicinais", -- menu name
    permissions = {"process.ervasmedicinais"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=20, -- unidades que o transformador ganha de volta por minuto
    x=3512.9367675781,y=3755.2492675781,z=29.968465805054, -- pos



    radius=1.5, height=1.5, -- area
    recipes = { -- items do menu

      ["Processar"] = { -- action name
        description="Processador de Ervas Medicinais.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Medical Weed"] = 1
    },
        products={ -- items given per unit
          ["remedio"] = 1


        }
      }



    }
  },
  {
    name="Transporte de Ervas Medicinais", -- menu name
    permissions = {"mission.delivery.medical"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=200,
    units_per_minute=20,
    x=2213.0520019531,y=5577.5981445313,z=53.795757293701,
    radius=3, height=1.5, -- area
    recipes = {
      ["Ervas Medicinais"] = { -- action name
        description="Ervas para uso Medicinais", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["Medical Weed"] = 1
        }
      }
	 }
  },
}

-- define transformers randomly placed on the map
cfg.hidden_transformers = {
  ["weed field"] = {

    def = {
      name="Weed field", -- menu name

      permissions = {"harvesst.weeed"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=30,
      units_per_minute=1,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Pegar"] = { -- action name
          description="Droga.", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["seeeds"] = 1,
			["cocaaine"] = 1,
			["harneess"] = 1

          }
        }
      }
    },
    positions = {
      {1873.36901855469,3658.46215820313,33.8029747009277},
      {1856.33776855469,3635.12109375,34.1897926330566},
      {1830.75390625,3621.44140625,33.8487205505371}

    }
  }
}

-- time in minutes before hidden transformers are relocated (min is 5 minutes)
cfg.hidden_transformer_duration = 5*24*60 -- 5 days

-- configure the information reseller (can sell hidden transformers positions)
cfg.informer = {
  infos = {
    ["weed field"] = 20000
  },
  positions = {
	{1821.12390136719,3685.9736328125,34.2769317626953},
    {1804.2958984375,3684.12280273438,34.217945098877}
  },
  interval = 60, -- interval in minutes for the reseller respawn
  duration = 10, -- duration in minutes of the spawned reseller
  blipid = 133,
  blipcolor = 2
}

return cfg
