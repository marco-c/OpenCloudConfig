rem task user initialisation script

rem auto hide task bar
powershell -command "&{$p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3';$v=(Get-ItemProperty -Path $p).Settings;$v[8]=3;&Set-ItemProperty -Path $p -Name Settings -Value $v;&Stop-Process -ProcessName explorer}"

rem task user firewall exceptions
netsh advfirewall firewall add rule name="ssltunnel-%USERNAME%" dir=in action=allow program="%USERPROFILE%\build\tests\bin\ssltunnel.exe" enable=yes
netsh advfirewall firewall add rule name="ssltunnel-%USERNAME%" dir=out action=allow program="%USERPROFILE%\build\tests\bin\ssltunnel.exe" enable=yes
netsh advfirewall firewall add rule name="python-%USERNAME%" dir=in action=allow program="%USERPROFILE%\build\venv\scripts\python.exe" enable=yes
netsh advfirewall firewall add rule name="python-%USERNAME%" dir=out action=allow program="%USERPROFILE%\build\venv\scripts\python.exe" enable=yes
