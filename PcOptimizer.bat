@echo off
title PC Optimizer
color 0B
mode con: cols=80 lines=25
echo ======================================
echo        PC-Optimierung gestartet...
echo ======================================
echo 1. Temporäre Dateien und Cache loeschen...
del /s /q /f %temp%\*.* >nul 2>&1
del /s /q /f C:\Windows\Temp\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
md %temp%
echo [OK] Temporäre Dateien gelöscht!

echo.
echo 2. Arbeitsspeicher bereinigen...
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
wmic process where "name!='System Idle Process'" call setpriority 64 >nul
echo [OK] RAM-Cache geleert!

echo.
echo 3. Nicht benötigte Prozesse beenden...
taskkill /F /IM OneDrive.exe >nul 2>&1
taskkill /F /IM YourPhone.exe >nul 2>&1
taskkill /F /IM SearchIndexer.exe >nul 2>&1
taskkill /F /IM RuntimeBroker.exe >nul 2>&1
echo [OK] Hintergrundprozesse gestoppt!

echo.
echo 4. Festplattenbereinigung starten...
cleanmgr /sagerun:1
echo [OK] Festplattenbereinigung gestartet!

echo.
echo 5. Systemdateien prüfen und reparieren...
sfc /scannow
echo [OK] Systemdateien überprüft!

echo.
echo 6. Windows-Start beschleunigen...
wmic startup get caption,command > startup_programs.txt
echo [OK] Liste der Autostart-Programme gespeichert in "startup_programs.txt".
echo Du kannst unnötige Programme in "Task-Manager > Autostart" deaktivieren.

echo.
echo ======================================
echo        Optimierung abgeschlossen!
echo Starte deinen PC neu, um die Änderungen zu übernehmen.
echo ======================================
pause
