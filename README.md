# Installation Steps for Bell-Apps on Windows Machine
## Pre-requisites
1. Make sure you have Mozilla Firefox installed in your system
2. Uninstall CouchDB (Apache CouchDB) and Node.js from the system if they are already installed
	- Start &rarr; Control Panel &rarr; Uninstall a Program
3. Clear cookies and cache of your Firefox
	- Click the **Menu Button** , choose **History**, and then **Clear Recent History...**
	- Set Time range to clear to **Everything**
	- Click on the arrow next to **Details** to expand the list of history items.
	- Select **Cookies** and **Cache** and make sure that other items you want to keep are not selected.
	- Click **Clear Now** to clear the cookies and close the Clear Recent History window.

## Running the "BeLL-Offline-Installer"
1. Run the file named **install.bat** by double clicking on it
2. Node.js installation prompt comes up requiring you to follow the wizard to install this dependency
3. Couchdb installation prompt comes up requiring you to follow the wizard to install this dependency
4. Wait for few minutes and let the installer complete its homework
5. A new tab in Firefox will be initiated with the Bell-App launched in it
6. Sign-in with admin credentials and system will route to configuration Window that requires the following fields
	- Name - Community name assigned by the OLE
	- Code - Community-Specific Code assigned by the OLE
	- Type - Bell Type i.e. Nation or Community (Keep it untouched)
	- Nation Name - The Name of Nation heading your community
	- Nation URL - The URL of Head Nation provided by the OLE
7. After filling these fields, click "Save Configurations" and the System will route to Home Page


## QA steps
Any time there is new code for QA...
  
1. tag the BeLL-Apps repository.
2. modify `build.bat` in Bell-Install-for-Windows repository.
3. tag the Bell-Installer-for-Windows repository. 
4. Download the tag release code from the Bell-Installer-for-Windows onto a windows machine, unzip it.
5. If you don't have 7-zip installed on your machine, run `7z920.exe` to install it.
5. Double click on `build.bat`, verify the `BeLL-Apps` folder now has code  .
6. Double click on the `install.bat` file, verify the install.
