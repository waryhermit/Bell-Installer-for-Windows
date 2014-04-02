@echo off
node-v0.10.26-x86.msi
setup-couchdb-1.5.0_R16B02.exe
timeout 5
start startcouchdb.bat
timeout 3
curl -X PUT http://localhost:5984/configurations
curl -X PUT http://localhost:5984/languages
curl -X PUT http://localhost:5984/members
curl -X PUT http://localhost:5984/assignmentpaper
curl -X PUT http://localhost:5984/assignments
curl -X PUT http://localhost:5984/calendar
curl -X PUT http://localhost:5984/collectionlist
curl -X PUT http://localhost:5984/communities
curl -X PUT http://localhost:5984/community
curl -X PUT http://localhost:5984/community_code
curl -X PUT http://localhost:5984/communityreports
curl -X PUT http://localhost:5984/courseschedule
curl -X PUT http://localhost:5984/coursestep
curl -X PUT http://localhost:5984/facilities
curl -X PUT http://localhost:5984/feedback
curl -X PUT http://localhost:5984/groups
curl -X PUT http://localhost:5984/install
curl -X PUT http://localhost:5984/invitations
curl -X PUT http://localhost:5984/languages
curl -X PUT http://localhost:5984/mail
curl -X PUT http://localhost:5984/meetups
curl -X PUT http://localhost:5984/membercourseprogress
curl -X PUT http://localhost:5984/nationreports
curl -X PUT http://localhost:5984/publications
curl -X PUT http://localhost:5984/report
curl -X PUT http://localhost:5984/requests
curl -X PUT http://localhost:5984/resourcefrequency
curl -X PUT http://localhost:5984/resources
curl -X PUT http://localhost:5984/shelf
curl -X PUT http://localhost:5984/stepresults
curl -X PUT http://localhost:5984/sync
curl -X PUT http://localhost:5984/usermeetups
curl -X PUT http://localhost:5984/actions
curl -X PUT http://localhost:5984/apps
timeout 1
curl -d @languages.txt -H "Content-Type: application/json" -X POST http://localhost:5984/languages
curl -d @configurations.txt -H "Content-Type: application/json" -X POST http://localhost:5984/configurations
curl -d @admin.txt -H "Content-Type: application/json" -X POST http://localhost:5984/members
curl -d @assignmentsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/assignments
curl -d @collectionlistviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/collectionlist
curl -d @communityreportsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/communityreports
curl -d @coursestepviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/coursestep
curl -d @feedbackviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/feedback
curl -d @mailviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/mail
curl -d @membercourseprogressviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/membercourseprogress
curl -d @membersviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/members
curl -d @nationreportsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/nationreports
curl -d @publicationsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/publications
curl -d @reportviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/report
curl -d @requestsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/requests
curl -d @resourcesviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/resources
curl -d @resourcefrequencyviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/resourcefrequency
curl -d @shelfviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/shelf
curl -d @usermeetupsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/usermeetups
curl -d @pubresourcesviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/pubresources
curl -d @groupsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/groups
curl -d @invitationsviews.txt -H "Content-Type: application/json" -X POST http://localhost:5984/invitations
timeout 2
start firefox http://127.0.0.1:5984/_utils/
timeout 3
BeLL-Apps\node_modules\.bin\couchapp push BeLL-Apps\app.js http://127.0.0.1:5984/apps
timeout 2