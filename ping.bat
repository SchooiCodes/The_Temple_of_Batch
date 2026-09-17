@echo off
color b
title ping

set /p target="target(domain, ipv4, ipv6):"
ping -n 1 %target%
if "%errorlevdl%"=="0" (
   echo sorry we couldn't find this host!
   exit
)

ping -n 5 %target%
