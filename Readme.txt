How to install Bell-Apps on windows machine:
	Run the file "installer.bat" by double clicking on it
	Here's what it will do:
		1- launch node.js setup
		2- launch couchdb setup
		3- run the couchdb server (in case it was not installed as a service while following step 2 above).
		4- create databases "configurations", "languages", "members", and "apps"
		5- post a document into each of these databases
		6- launch firefox and open futon/UI page of couchdb in it
		7- push the "app.js" to the "apps" database