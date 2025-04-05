@echo off
title Netzwerk-Info
color 0C
echo Netzwerk-Details:
ipconfig /all
echo Netzwerkgeschwindigkeit:
wmic nic where (NetEnabled=true) get Name, Speed
pause
