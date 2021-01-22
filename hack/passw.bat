@echo off
mkdir results
start /min netsh wlan export profile folder=results key=clear
ipconfig /all > results\ip.txt
exit