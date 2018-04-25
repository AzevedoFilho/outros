RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"police.paycheck") then
		vRP.giveMoney(user_id,3000)
		vRPclient.notify(source,{"Pagamento diario: $3000"})
	end		
	-- EMS Paychecks	
	if vRP.hasPermission(user_id,"emsChief.paycheck") then
		vRP.giveMoney(user_id,7000)
		vRPclient.notify(source,{"Pagamento diario: $7000"})
	end
	if vRP.hasPermission(user_id,"emsLieutenant.paycheck") then
		vRP.giveMoney(user_id,3000)
		vRPclient.notify(source,{"Pagamento diario: $3000"})
	end
	if vRP.hasPermission(user_id,"emsMedic.paycheck") then
		vRP.giveMoney(user_id,3000)
		vRPclient.notify(source,{"Pagamento diario: $3000"})
	end
	if vRP.hasPermission(user_id,"emsSearchRescue.paycheck") then
		vRP.giveMoney(user_id,3500)
		vRPclient.notify(source,{"Pagamento diario: $3500"})
	end
	-- end EMS Paychecks
	if vRP.hasPermission(user_id,"repair.paycheck") then
		vRP.giveMoney(user_id,2000)
		vRPclient.notify(source,{"Pagamento diario: $2000"})
	end
	if vRP.hasPermission(user_id,"Chief.paycheck") then
		vRP.giveMoney(user_id,7000)
		vRPclient.notify(source,{"Pagamento diario: $7000"})
	end
	if vRP.hasPermission(user_id,"Commander.paycheck") then
		vRP.giveMoney(user_id,6000)
		vRPclient.notify(source,{"Pagamento diario: $6000"})
	end
	if vRP.hasPermission(user_id,"Captain.paycheck") then
		vRP.giveMoney(user_id,4500)
		vRPclient.notify(source,{"Pagamento diario: $4500"})
	end
	if vRP.hasPermission(user_id,"Lieutenant.paycheck") then
		vRP.giveMoney(user_id,2500)
		vRPclient.notify(source,{"Pagamento diario: $2500"})
	end
	if vRP.hasPermission(user_id,"Detective.paycheck") then
		vRP.giveMoney(user_id,3550)
		vRPclient.notify(source,{"Pagamento diario: $3550"})
	end
	if vRP.hasPermission(user_id,"Sergeant.paycheck") then
		vRP.giveMoney(user_id,3000)
		vRPclient.notify(source,{"Pagamento diario: $3000"})
	end
	if vRP.hasPermission(user_id,"uber.paycheck") then
		vRP.giveMoney(user_id,2500)
		vRPclient.notify(source,{"Pagamento diario: $2500"})
	end
	if vRP.hasPermission(user_id,"Lawyer.paycheck") then
		vRP.giveMoney(user_id,4000)
		vRPclient.notify(source,{"Pagamento diario: $4000"})
	end
	if vRP.hasPermission(user_id,"delivery.paycheck") then
		vRP.giveMoney(user_id,2000)
		vRPclient.notify(source,{"Pagamento diario: $2000"})
	end
	if vRP.hasPermission(user_id,"citizen.paycheck") then
		vRP.giveMoney(user_id,2000)
		vRPclient.notify(source,{"Pagamento diario: $2000"})
	end
	if vRP.hasPermission(user_id,"SWAT.paycheck") then
		vRP.giveMoney(user_id,6000)
		vRPclient.notify(source,{"Pagamento diario: $6000"})
	end
	if vRP.hasPermission(user_id,"sheriff.paycheck") then
		vRP.giveMoney(user_id,6000)
		vRPclient.notify(source,{"Pagamento diario: $6000"})
	end
	if vRP.hasPermission(user_id,"Cadet.paycheck") then
		vRP.giveMoney(user_id,2500)
		vRPclient.notify(source,{"Pagamento diario: $2500"})
	end
	if vRP.hasPermission(user_id,"trafficguard.paycheck") then
		vRP.giveMoney(user_id,1500)
		vRPclient.notify(source,{"Pagamento diario: $1500"})
	end
	if vRP.hasPermission(user_id,"santa.paycheck") then
		vRP.giveMoney(user_id,2000)
		vRPclient.notify(source,{"Pagamento diario: $2000"})
	end
	if vRP.hasPermission(user_id,"bankdriver.paycheck") then
		vRP.giveMoney(user_id,5000)
		vRPclient.notify(source,{"Pagamento diario: $5000"})
	end
	if vRP.hasPermission(user_id,"pilot.paycheck") then
		vRP.giveMoney(user_id,4000)
		vRPclient.notify(source,{"Pagamento diario: $4000"})
	end
	if vRP.hasPermission(user_id,"air.paycheck") then
		vRP.giveMoney(user_id,4000)
		vRPclient.notify(source,{"Pagamento diario: $4000"})
	end
	if vRP.hasPermission(user_id,"trash.paycheck") then
		vRP.giveMoney(user_id,3000)
		vRPclient.notify(source,{"Pagamento diario: $3000"})
	end
end)