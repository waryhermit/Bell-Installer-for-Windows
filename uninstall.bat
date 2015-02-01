"%~dp0\Executables\node-v0.10.26-x86.msi"
"C:\Program Files (x86)\Apache Software Foundation\CouchDB\unins000.exe"
Remove-Item -recurse -force "C:\Program Files (x86)\Apache Software Foundation/CouchDB"
timeout 2
rmdir "C:\Program Files (x86)\Apache Software Foundation/CouchDB" /s /q
timeout 2
rmdir "C:\Program Files (x86)\Apache Software Foundation" /s /q
