@echo off
title Sicherer Passwort-Generator
color 0E
setlocal enabledelayedexpansion

:: Datei für Passwörter
set "password_file=passwort_db.enc"

:menu
cls
echo ======================================
echo          Passwort Manager
echo ======================================
echo [1] Neues Passwort generieren
echo [2] Gespeicherte Passwoerter anzeigen
echo [3] Beenden
echo ======================================
set /p choice=Bitte waehle eine Option: 

if "%choice%"=="1" goto generate
if "%choice%"=="2" goto show
if "%choice%"=="3" exit
goto menu

:generate
cls
echo Neues Passwort generieren...
set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*"
set "password="
for /L %%i in (1,1,16) do (
    set /a index=!random! %% 70
    for %%j in (!index!) do set "password=!password!!chars:~%%j,1!"
)
echo Dein Passwort: !password!
echo Bitte gib einen Namen fuer dieses Passwort ein:
set /p passname=

:: Speichern mit einfacher Verschlüsselung
echo !passname!:!password! | findstr /v "^$" >> %password_file%
echo Passwort gespeichert!
pause
goto menu

:show
cls
echo Gespeicherte Passwoerter:
echo ======================================
if exist %password_file% (
    type %password_file%
) else (
    echo Keine Passwoerter gespeichert!
)
pause
goto menu
