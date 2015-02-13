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
(Get-Content "C:\Program Files (x86)\Apache Software Foundation\CouchDB\etc\couchdb\default.ini") | Foreach-Object {$_ -replace '127.0.0.1','0.0.0.0'}  | Out-File "C:\Program Files (x86)\Apache Software Foundation\CouchDB\etc\couchdb\default.ini"
