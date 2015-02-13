"%~dp0\Executables\BonjourPSSetup.exe"
timeout 2
netsh advfirewall firewall add rule name="CouchDB/HTTP" dir=out action=allow protocol=TCP localport=5984
timeout 2
netsh advfirewall firewall add rule name="CouchDB/HTTP" dir=in action=allow protocol=TCP localport=5984
timeout 2
netsh advfirewall firewall add rule name="CouchDB/HTTPS" dir=out action=allow protocol=TCP localport=6984
timeout 2
netsh advfirewall firewall add rule name="CouchDB/HTTPS" dir=in action=allow protocol=TCP localport=6984
timeout 2
PowerShell.exe -NoProfile -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dpn0.ps1""' -Verb RunAs}"
PAUSE
