@echo off
color b
title dosmode.bat

echo ####################################################
echo 1=standard dosmode
echo 2=exit
choice /c 123 /n /m ""
if "%errorlevel%"=="1" (
   taskkill /f /im explorer.exe
   cd \
   title cmd.exe
   cls
   cmd.exe
) else (
   exit
)
