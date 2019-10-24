@echo off
@title Bravoow Tecnologia
cls
color 2
:start

echo I######----  BravoowTec  ----######I
echo I#(3)$UNITED STATES OF BRASIL $(3)#I
echo I#$$          /$$$\   $$$$$$$$  $$#I
echo I!# {G}      I(X.X)I             ##I
echo I#! $$$$$$   I /v\ I   TNTG-#### !#I
echo I#(3)         ---/             (3)#I
echo I##-------  Bravoow Tec  --------##I

timeout /t 10 >null

start "FXServer" ..\run.cmd +exec server.cfg
echo ... %time% - Iniciando Servidor...

timeout /t 15 >null
echo ... %time% - Carregando resources...

timeout /t 1 >null
echo ... %time% - Servidor reinicia a cada 4 horas...

timeout /t 14400 >null
echo ... %time% - 4 horas se foram. Matando servicos. Servidor reiniciando....

timeout /t 2 >null

taskkill /f /fi "WindowTitle eq Server*"
taskkill /f /im FXServer.exe >nul

timeout /t 12 >null
echo ... %time% - mais um pouco...

timeout /t 1 >null
echo ... %time% - ta quase....

timeout /t 1 >null
echo ... %time% - ok... vamos startar!

timeout /t 1 >null
goto start