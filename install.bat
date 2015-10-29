::@echo off

:: run node.js executable/installer wizard
Executables\node-v0.10.26-x86.msi

:: run couchdb executable/installer wizard
Executables\setup-couchdb-1.5.0_R16B02.exe

:: run Ghostscript installer wizard
Executables\gs914w64.exe

:: run GraphicsMagick installer wizard
Executables\GraphicsMagick-1.3.19-Q16-win64.exe

timeout 2

:: run couchdb server, in case it was not installed as a service by user
cmd /c .\Executables\startcouchdb.bat

:: configure couchdb to be accessible to any node on the LAN
curl -X PUT http://localhost:5984/_config/httpd/bind_address -d "\"0.0.0.0\""

:: delete databases
FOR /R BeLL-Apps\databases %%F in (*.*) do (
    curl -X DELETE http://localhost:5984/%%~nF
)

:: create databases
FOR /R BeLL-Apps\databases %%F in (*.*) do (
    curl -X PUT http://localhost:5984/%%~nF
)

:: add bare minimal required data to couchdb for launching bell-apps smoothly
curl -d @BeLL-Apps\init_docs\languages.txt -H "Content-Type: application/json" -X POST http://localhost:5984/languages
curl -d @BeLL-Apps\init_docs\languages-Urdu.txt -H "Content-Type: application/json" -X POST http://localhost:5984/languages
curl -d @BeLL-Apps\init_docs\languages-Arabic.txt -H "Content-Type: application/json" -X POST http://localhost:5984/languages
curl -d @BeLL-Apps\init_docs\ConfigurationsDoc-Community.txt -H "Content-Type: application/json" -X POST http://localhost:5984/configurations
curl -d @BeLL-Apps\init_docs\admin.txt -H "Content-Type: application/json" -X POST http://localhost:5984/members

:: delete empty dbs we want to replace with Starter data dbs
curl -X DELETE http://localhost:5984/collectionlist
curl -X DELETE http://localhost:5984/resources
curl -X DELETE http://localhost:5984/groups
curl -X DELETE http://localhost:5984/coursestep

set couchdb_databases_folder="C:\Program Files (x86)\Apache Software Foundation\CouchDB\var\lib\couchdb\"
set starter_data_folder="StarterData\"

:: copy the resources, collectionlist, groups, and coursestep db files into the couchdb_databases_folder
copy /y %starter_data_folder%resources.couch %couchdb_databases_folder%resources.couch
copy /y %starter_data_folder%collectionlist.couch %couchdb_databases_folder%collectionlist.couch
copy /y %starter_data_folder%groups.couch %couchdb_databases_folder%groups.couch
copy /y %starter_data_folder%coursestep.couch %couchdb_databases_folder%coursestep.couch

:: if "Starter_Data" folder did not have any data in it, then we need to create the databases again
curl -X PUT http://localhost:5984/collectionlist
curl -X PUT http://localhost:5984/coursestep
curl -X PUT http://localhost:5984/groups
curl -X PUT http://localhost:5984/resources

:: Move specific Dosign Docs from Databases to anywhere else
move BeLL-Apps\databases\communities.js BeLL-Apps\communities.js
move BeLL-Apps\databases\languages.js BeLL-Apps\languages.js
move BeLL-Apps\databases\configurations.js BeLL-Apps\configurations.js

SET PATH=%PATH%;C:\Users\%USERNAME%\AppData\Roaming\npm;C:\Program Files (x86)\nodejs\

call .\install_nodemodules.bat

:: add design docs to all databases
FOR /R BeLL-Apps\databases %%F in (*.*) do (
call BeLL-Apps\node_modules\.bin\couchapp push BeLL-Apps\databases\%%~nxF http://localhost:5984/%%~nF
timeout 1
)

:: Move specific Dosign Docs back to databases
move BeLL-Apps\communities.js BeLL-Apps\databases\communities.js
move BeLL-Apps\languages.js BeLL-Apps\databases\languages.js
move BeLL-Apps\configurations.js BeLL-Apps\databases\configurations.js

start Launch_PDFOptimizer.bat

call .\create_desktop_icon.bat
start firefox http://127.0.0.1:5984/apps/_design/bell/MyApp/index.html#login
