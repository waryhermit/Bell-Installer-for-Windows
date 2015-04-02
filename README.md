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
3. Then Couchdb installation prompt comes up requiring you to follow the wizard to install this dependency
4. Then Ghostscript installation prompt comes up requiring you to follow the wizard to install this dependency
5. Then GraphicsMagick installation prompt comes up requiring you to follow the wizard to install this dependency
6. Wait for few minutes and let the installer complete its homework
7. A command-line window will appear saying "PDF optimization engine is up and running...". Make sure to keep this window running 
8. A new tab in Firefox will also be initiated with the Bell-App launched in it
9. Sign-in with admin credentials and system will route to configuration Window that requires the following fields
	- Name - Community name assigned by the OLE
	- Code - Community-Specific Code assigned by the OLE
	- Type - Bell Type i.e. Nation or Community (Keep it untouched)
	- Nation Name - The Name of Nation heading your community
	- Nation URL - The URL of Head Nation provided by the OLE
10. After filling these fields, click "Save Configurations" and the System will route to Home Page


## Release Instructions 
Any time there is new code for QA...
  
1. tag the BeLL-Apps repository.
2. modify `build.bat` in Bell-Install-for-Windows repository.
3. modify the BeLL-Apps version in `Config_Files/configurations.txt`, do not add a `v` to the version otherwise the updater will always fail.
4. tag the Bell-Installer-for-Windows repository. 
5. Download the tag release code from the Bell-Installer-for-Windows onto a windows machine, unzip it.
6. Double click on `build.bat`, verify the `BeLL-Apps` folder now has code  .
7. Double click on the `install.bat` file, verify the install.
8. Right click on the `network.bat` file and click "Run as administrator"
