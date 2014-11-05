How to install Bell-Apps on a windows machine
Pre-requisites (Do these before running any file in the "BeLL-Offline-Installer")
	1- Uninstall CouchDB and Node.js from the system if they have been already installed.
	2- Clear cookies and cache of your firefox browser before starting the BeLL installer.
	   Here's some guidance on how to clear existing cookies and cache in ff:
		- Go to 'Tools' in the menu bar
		- Click on 'Options'
		- Click on 'Privacy Tab'
		- Click on the "clear your recent history" link
		- Select/Check the "Cookies" and "Cache" options from the list of checkboxed options that appear in a dialog/menu
		- Click on "Clear Now"

Running the "BeLL-Offline-Installer"
	Run the file named "install.bat" by double clicking on it.
		The installer script will come into action and carry out the following tasks:
			1- launch node.js setup  (requiring you (the user) to follow the wizard that pops up to install this dependency)
			2- launch couchdb setup  (requiring the user to follow the wizard that pops up to install this dependency)
			3- delete any databases of interest that might exist in couchdb (in order to start from scratch in all cases. No action required from user)
			4- run the couchdb service (in case it was not installed as a service while following step 2 above. No action required from user)
			5- configure couchdb to be accessible over the LAN (No action required from user)
			6- create databases and post design documents and bare minimal records, required to launch the BeLL application, in them. (No action required from user)
			7- prompt the user to indicate if he/she wants to include or exclude additional starter data (resources) in the installation.
			8- copy the additional starter data if the user responded with a "yes" in the previous step.
			9- push the BeLL-Apps code to the "apps" database created in the previous step. (No action required from user)
			10- launch a new tab in firefox web browser and load the application login page in it.

If the application login page loads up, you've made it. Close any command prompt (black screen window) that have not closed automatically till now.