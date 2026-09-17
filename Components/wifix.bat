@echo off
color b
title wi-fix.bat

echo releasing your ipv4
ipconfig /release 2>&1

echo giving a new one
ipconfig /renew 2>&1

echo chanching your dns server
ipconfig /flushdns

