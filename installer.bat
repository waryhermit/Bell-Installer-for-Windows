@echo off
node-v0.10.26-x86.msi
setup-couchdb-1.5.0_R16B02.exe
timeout 5
start startcouchdb.bat
timeout 3
curl -X PUT http://localhost:5984/configurations/
curl -X PUT http://localhost:5984/languages/
curl -X PUT http://localhost:5984/members/
curl -X PUT http://localhost:5984/apps/
timeout 1
curl -d @languages.txt -H "Content-Type: application/json" -X POST http://localhost:5984/languages
curl -d @configurations.txt -H "Content-Type: application/json" -X POST http://localhost:5984/configurations
curl -d @admin.txt -H "Content-Type: application/json" -X POST http://localhost:5984/members
curl -d @assignmentsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/assignments
curl -d @collectionlistView.txt -H "Content-Type: application/json" -X POST http://localhost:5984/collectionlist
curl -d @communityreportsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/communityreportsviews
curl -d @coursestepviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/coursestepviews
curl -d @feedbackviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/feedbackviews
curl -d @mailviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/mailviews
curl -d @membercourseprogressviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/membercourseprogressviews
curl -d @membersviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/members
curl -d @nationreportsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/nationreportsviews
curl -d @publicationsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/publicationsviews
curl -d @reportviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/reportviews
curl -d @requestsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/requestsviews
curl -d @resourcesviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/resourcesviews
curl -d @resourcefrequencyviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/resourcefrequencyviews
curl -d @shelfviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/shelfviews
curl -d @usermeetupsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/usermeetupsviews






timeout 2
start firefox http://127.0.0.1:5984/_utils/
timeout 3
BeLL-Apps\node_modules\.bin\couchapp push BeLL-Apps\app.js http://127.0.0.1:5984/apps
timeout 2