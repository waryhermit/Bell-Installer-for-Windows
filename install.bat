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
curl -d @Config_Files\languages.txt -H "Content-Type: application/json" -X POST http://localhost:5984/languages
curl -d @Config_Files\configurations.txt -H "Content-Type: application/json" -X POST http://localhost:5984/configurations
curl -d @Config_Files\admin.txt -H "Content-Type: application/json" -X POST http://localhost:5984/members

:: add design docs to all dbs, they are used/needed at different points in the application
curl -d @Design_Docs\design_doc_activitylog.txt -H "Content-Type: application/json" -X POST http://localhost:5984/activitylog
curl -d @Design_Docs\design_doc_assignments.txt -H "Content-Type: application/json" -X POST http://localhost:5984/assignments
curl -d @Design_Docs\design_doc_assignmentpaper.txt -H "Content-Type: application/json" -X POST http://localhost:5984/assignmentpaper
curl -d @Design_Docs\design_doc_calendar.txt -H "Content-Type: application/json" -X POST http://localhost:5984/calendar
curl -d @Design_Docs\design_doc_collectionlist.txt -H "Content-Type: application/json" -X POST http://localhost:5984/collectionlist
curl -d @Design_Docs\design_doc_communityreports.txt -H "Content-Type: application/json" -X POST http://localhost:5984/communityreports
curl -d @Design_Docs\design_doc_courseschedule.txt -H "Content-Type: application/json" -X POST http://localhost:5984/courseschedule
curl -d @Design_Docs\design_doc_coursestep.txt -H "Content-Type: application/json" -X POST http://localhost:5984/coursestep
curl -d @Design_Docs\design_doc_feedback.txt -H "Content-Type: application/json" -X POST http://localhost:5984/feedback
curl -d @Design_Docs\design_doc_groups.txt -H "Content-Type: application/json" -X POST http://localhost:5984/groups
curl -d @Design_Docs\design_doc_invitations.txt -H "Content-Type: application/json" -X POST http://localhost:5984/invitations
curl -d @Design_Docs\design_doc_mail.txt -H "Content-Type: application/json" -X POST http://localhost:5984/mail
curl -d @Design_Docs\design_doc_meetups.txt -H "Content-Type: application/json" -X POST http://localhost:5984/meetups
curl -d @Design_Docs\design_doc_membercourseprogress.txt -H "Content-Type: application/json" -X POST http://localhost:5984/membercourseprogress
curl -d @Design_Docs\design_doc_members.txt -H "Content-Type: application/json" -X POST http://localhost:5984/members
curl -d @Design_Docs\design_doc_nationreports.txt -H "Content-Type: application/json" -X POST http://localhost:5984/nationreports
curl -d @Design_Docs\design_doc_publicationdistribution.txt -H "Content-Type: application/json" -X POST http://localhost:5984/publicationdistribution
curl -d @Design_Docs\design_doc_publications.txt -H "Content-Type: application/json" -X POST http://localhost:5984/publications
curl -d @Design_Docs\design_doc_report.txt -H "Content-Type: application/json" -X POST http://localhost:5984/report
curl -d @Design_Docs\design_doc_requests.txt -H "Content-Type: application/json" -X POST http://localhost:5984/requests
curl -d @Design_Docs\design_doc_resourcefrequency.txt -H "Content-Type: application/json" -X POST http://localhost:5984/resourcefrequency
curl -d @Design_Docs\design_doc_resources.txt -H "Content-Type: application/json" -X POST http://localhost:5984/resources
curl -d @Design_Docs\design_doc_shelf.txt -H "Content-Type: application/json" -X POST http://localhost:5984/shelf
curl -d @Design_Docs\design_doc_usermeetups.txt -H "Content-Type: application/json" -X POST http://localhost:5984/usermeetups

:: take user input to decide if starter data is to be included or not in this installation
:: :PromptForStarterDataAgain
::set /p include_starter_data=Do you wish to include starter data with this install (yes/no):
::if /I %include_starter_data%==yes goto AddStarterData
::if /I %include_starter_data%==no goto ContinueInstall
:: ::if not %include_starter_data%==no && if not %include_starter_data%==yes goto PromptForStarterDataAgain
::goto PromptForStarterDataAgain
:AddStarterData
:: delete databases whose starter data is to be included, and then just copy their db files into the dbs directory of target couchdb
curl -X DELETE http://localhost:5984/collectionlist
curl -X DELETE http://localhost:5984/resources
curl -X DELETE http://localhost:5984/groups
curl -X DELETE http://localhost:5984/coursestep
set couchdb_databases_folder="C:\Program Files (x86)\Apache Software Foundation\CouchDB\var\lib\couchdb\"
set starter_data_folder="Starter_Data\"
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
:: add design doc for resources as its starter database file may not have design doc in it
curl -d @Design_Docs\design_doc_resources.txt -H "Content-Type: application/json" -X POST http://localhost:5984/resources
curl -d @Design_Docs\design_doc_groups.txt -H "Content-Type: application/json" -X POST http://localhost:5984/groups
curl -d @Design_Docs\design_doc_coursestep.txt -H "Content-Type: application/json" -X POST http://localhost:5984/coursestep
curl -d @Design_Docs\design_doc_collectionlist.txt -H "Content-Type: application/json" -X POST http://localhost:5984/collectionlist



:ContinueInstall
SET PATH=%PATH%;C:\Users\%USERNAME%\AppData\Roaming\npm;C:\Program Files (x86)\nodejs\
call create_desktop_icon.bat
call push_code_to_apps_db.bat
start firefox http://127.0.0.1:5984/apps/_design/bell/MyApp/index.html#login