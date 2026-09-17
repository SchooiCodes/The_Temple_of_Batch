@echo off
REM Runner script - 17/9/26 - SchooiCodes
REM Not used to commenting my own code but I will try it for collaboration purposes :)
REM If running as admin, it is crucial to CD into the directory the script lives in (%~dp0)
cd /d "%~dp0\Components"
title The Temple of Batch ^| 1.0
REM I was thinking of giving you a proper ASCII logo, like in SMT, but that's up to you: https://www.youtube.com/watch?v=1ecuUu2UWW0

:main
cls
echo =======================
echo - THE TEMPLE OF BATCH -
echo =======================
echo Welcome to The Temple of Batch Made by pvpbot11
echo What script would you like to run?
echo 1. Clean up Windows
echo 2. Run DOS mode
echo 3. Ping a site 
echo 4. Fix your Wi-Fi
echo 5. Schooi's Multitool
REM Ask for input
set /p "choice=> "
if /i "%choice%"=="1" start clean.bat
if /i "%choice%"=="2" start dosmode.bat
if /i "%choice%"=="3" start ping.bat
if /i "%choice%"=="4" start wifix.bat
if /i "%choice%"=="5" start getsmt.bat
goto main
exit