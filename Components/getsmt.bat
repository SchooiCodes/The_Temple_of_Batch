@echo off
REM If running as admin, it is crucial to CD into the directory the script lives in (%~dp0)
cd /d "%~dp0"
REM Elevate automatically
fltmc >nul 2>&1 || (
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        >nul pause && exit 1
    )
    exit 0
)
REM Install SMT (officially)
title Schooi's Multitool
REM Check Windows verison
for /f "tokens=4-7 delims=[.] " %%i in ('ver') do @(if "%%i"=="Version" (set windowsver=%%j) else (set windowsver=%%i))
REM Print logo based on Windows version
if %WINDOWSVER% GEQ 10 for /f "tokens=2,*delims=:" %%i in ('chcp') do set /a oldcp=%%i
if %WINDOWSVER% GEQ 10 chcp 65001 >nul
if %WINDOWSVER% GEQ 10 echo/░██████╗░█████╗░██╗░░██╗░█████╗░░█████╗░██╗██╗░██████╗
if %WINDOWSVER% GEQ 10 echo/██╔════╝██╔══██╗██║░░██║██╔══██╗██╔══██╗██║╚█║██╔════╝
if %WINDOWSVER% GEQ 10 echo/╚█████╗░██║░░╚═╝███████║██║░░██║██║░░██║██║░╚╝╚█████╗░
if %WINDOWSVER% GEQ 10 echo/░╚═══██╗██║░░██╗██╔══██║██║░░██║██║░░██║██║░░░░╚═══██╗
if %WINDOWSVER% GEQ 10 echo/██████╔╝╚█████╔╝██║░░██║╚█████╔╝╚█████╔╝██║░░░██████╔╝
if %WINDOWSVER% GEQ 10 echo/╚═════╝░░╚════╝░╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░░╚═════╝░
if %WINDOWSVER% GEQ 10 echo/
if %WINDOWSVER% GEQ 10 echo/███╗░░░███╗██╗░░░██╗██╗░░░░░████████╗██╗████████╗░█████╗░░█████╗░██╗░░░░░
if %WINDOWSVER% GEQ 10 echo/████╗░████║██║░░░██║██║░░░░░╚══██╔══╝██║╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░
if %WINDOWSVER% GEQ 10 echo/██╔████╔██║██║░░░██║██║░░░░░░░░██║░░░██║░░░██║░░░██║░░██║██║░░██║██║░░░░░
if %WINDOWSVER% GEQ 10 echo/██║╚██╔╝██║██║░░░██║██║░░░░░░░░██║░░░██║░░░██║░░░██║░░██║██║░░██║██║░░░░░
if %WINDOWSVER% GEQ 10 echo/██║░╚═╝░██║╚██████╔╝███████╗░░░██║░░░██║░░░██║░░░╚█████╔╝╚█████╔╝███████╗
if %WINDOWSVER% GEQ 10 echo/╚═╝░░░░░╚═╝░╚═════╝░╚══════╝░░░╚═╝░░░╚═╝░░░╚═╝░░░░╚════╝░░╚════╝░╚══════╝
if %WINDOWSVER% GEQ 10 chcp %oldcp% >nul
if %WINDOWSVER% LEQ 6 echo  __      _                 _ _         
if %WINDOWSVER% LEQ 6 echo / _\ ___^| ^|__   ___   ___ (_^| )__      
if %WINDOWSVER% LEQ 6 echo \ \ / __^| '_ \ / _ \ / _ \^| ^|/ __^|     
if %WINDOWSVER% LEQ 6 echo _\ \ (__^| ^| ^| ^| (_) ^| (_) ^| ^|\__ \     
if %WINDOWSVER% LEQ 6 echo \__/\___^|_^| ^|_^|\___/ \___/^|_^|^|___/     
if %WINDOWSVER% LEQ 6 echo.                                    
if %WINDOWSVER% LEQ 6 echo               _ _   _ _              _ 
if %WINDOWSVER% LEQ 6 echo   /\/\  _   _^| ^| ^|_(_) ^|_ ___   ___ ^| ^|
if %WINDOWSVER% LEQ 6 echo  /    \^| ^| ^| ^| ^| __^| ^| __/ _ \ / _ \^| ^|
if %WINDOWSVER% LEQ 6 echo / /\/\ \ ^|_^| ^| ^| ^|_^| ^| ^|^| (_) ^| (_) ^| ^|
if %WINDOWSVER% LEQ 6 echo \/    \/\__,_^|_^|\__^|_^|\__\___/ \___/^|_^|
echo.
echo Checking if SMT is installed..
where SMT.bat >nul 2>&1
if NOT ERRORLEVEL 0 goto install
echo SMT found! Starting..
smt

:install
echo Fetching installer script..
REM Official installer
powershell -Command "$ProgressPreference = 'SilentlyContinue'; irm smt.gleeze.com | iex" 
timeout /t 10
exit