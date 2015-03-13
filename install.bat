@echo off

:: run node.js executable/installer wizard
Executables\node-v0.10.26-x86.msi

:: run couchdb executable/installer wizard
Executables\setup-couchdb-1.5.0_R16B02.exe

timeout 2

:: run couchdb server, in case it was not installed as a service by user
cmd /c Executables\startcouchdb.bat

:: configure couchdb to be accessible to any node on the LAN
curl -X PUT http://localhost:5984/_config/httpd/bind_address -d "\"0.0.0.0\""

:: delete databases
curl -X DELETE http://localhost:5984/activitylog
curl -X DELETE http://localhost:5984/apps
curl -X DELETE http://localhost:5984/assignmentpaper
curl -X DELETE http://localhost:5984/assignments
curl -X DELETE http://localhost:5984/calendar
curl -X DELETE http://localhost:5984/collectionlist
curl -X DELETE http://localhost:5984/communities
curl -X DELETE http://localhost:5984/community
curl -X DELETE http://localhost:5984/communityreports
curl -X DELETE http://localhost:5984/configurations
curl -X DELETE http://localhost:5984/courseschedule
curl -X DELETE http://localhost:5984/coursestep
curl -X DELETE http://localhost:5984/feedback
curl -X DELETE http://localhost:5984/groups
curl -X DELETE http://localhost:5984/invitations
curl -X DELETE http://localhost:5984/languages
curl -X DELETE http://localhost:5984/mail
curl -X DELETE http://localhost:5984/meetups
curl -X DELETE http://localhost:5984/members
curl -X DELETE http://localhost:5984/membercourseprogress
curl -X DELETE http://localhost:5984/nationreports
curl -X DELETE http://localhost:5984/publicationdistribution
curl -X DELETE http://localhost:5984/publications
curl -X DELETE http://localhost:5984/report
curl -X DELETE http://localhost:5984/requests
curl -X DELETE http://localhost:5984/resourcefrequency
curl -X DELETE http://localhost:5984/resources
curl -X DELETE http://localhost:5984/shelf
curl -X DELETE http://localhost:5984/usermeetups

:: create databases
curl -X PUT http://localhost:5984/activitylog
curl -X PUT http://localhost:5984/apps
curl -X PUT http://localhost:5984/assignmentpaper
curl -X PUT http://localhost:5984/assignments
curl -X PUT http://localhost:5984/calendar
curl -X PUT http://localhost:5984/collectionlist
curl -X PUT http://localhost:5984/communities
curl -X PUT http://localhost:5984/community
curl -X PUT http://localhost:5984/communityreports
curl -X PUT http://localhost:5984/configurations
curl -X PUT http://localhost:5984/courseschedule
curl -X PUT http://localhost:5984/coursestep
curl -X PUT http://localhost:5984/feedback
curl -X PUT http://localhost:5984/groups
curl -X PUT http://localhost:5984/invitations
curl -X PUT http://localhost:5984/languages
curl -X PUT http://localhost:5984/mail
curl -X PUT http://localhost:5984/meetups
curl -X PUT http://localhost:5984/members
curl -X PUT http://localhost:5984/membercourseprogress
curl -X PUT http://localhost:5984/nationreports
curl -X PUT http://localhost:5984/publicationdistribution
curl -X PUT http://localhost:5984/publications
curl -X PUT http://localhost:5984/report
curl -X PUT http://localhost:5984/requests
curl -X PUT http://localhost:5984/resourcefrequency
curl -X PUT http://localhost:5984/resources
curl -X PUT http://localhost:5984/shelf
curl -X PUT http://localhost:5984/usermeetups

:: add bare minimal required data to couchdb for launching bell-apps smoothly
curl -d @BeLL-Apps\init_docs\languages.txt -H "Content-Type: application/json" -X POST http://localhost:5984/languages
curl -d @BeLL-Apps\init_docs\ConfigurationsDoc-Community.txt -H "Content-Type: application/json" -X POST http://localhost:5984/configurations
curl -d @BeLL-Apps\init_docs\admin.txt -H "Content-Type: application/json" -X POST http://localhost:5984/members

SET PATH=%PATH%;C:\Users\%USERNAME%\AppData\Roaming\npm;C:\Program Files (x86)\nodejs\

cd BeLL-Apps
call npm install
timeout 2

:: add design docs to all databases
FOR /R databases %%F in (*.*) do (node_modules\.bin\couchapp push databases\%%~nxF http://localhost:5984/%%~nF
											timeout 2)

cd ..
call create_desktop_icon.bat
call push_code_to_apps_db.bat
start firefox http://127.0.0.1:5984/apps/_design/bell/MyApp/index.html#login
