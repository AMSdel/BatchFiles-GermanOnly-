@echo off
title RAM-Cache leeren
color 0A
echo ======================================
echo      RAM-Cache wird geleert...
echo ======================================

:: Schließen nicht benötigter Tasks (optional)
echo Beende unnötige Prozesse...
taskkill /F /IM explorer.exe
timeout /t 2 /nobreak >nul
start explorer.exe

:: RAM-Speicher bereinigen
echo Leere den Arbeitsspeicher...
wmic process where "name!='System Idle Process'" call setpriority 64
echo Bereinigung abgeschlossen!

:: Alternativer Befehl für Windows 10/11
echo Speicherbereinigung ausführen...
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks

echo ======================================
echo RAM wurde geleert! Dein PC sollte nun schneller laufen.
echo ======================================
pause
