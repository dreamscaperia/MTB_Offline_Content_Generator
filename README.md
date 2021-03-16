The ModusToolbox Offline Content Package Generator is released to help you generate your own and up-to-date ModusToolbox offline content package.

ModusToolbox offline content package was first introduced in Jun, 2020. 
> "This package enables you to use ModusToolbox Project Creator and Library Manager tools without a persistent internet connection. It contains all the ModusToolbox repos referenced in the ModusToolbox manifest files. We continue to recommend working with the online content - so you always have access to the latest software - but this is a useful alternative method of accessing libraries for users who are frequently working offline."

However the official package becomes quite out-of-date. To fix this once for all, you will need the ModusToolbox Offline Content Package Generator.

-----------------------------------------------------------

# 1. Prerequisites

   The generator requires ModusToolbox 2.x and PowerShell (>=v5.0) to be installed on your Computer. The generated package might work on Windows/MacOS/Linux but the generator only works on Windows.

   It's recommended to run the generator on an Windows 10 Computer because PowerShell (>=5.0) is included by default. For Windows 8.1 and earlier, install/update the PowerShell manually.

   The generator needs open and persistent Internet access during the whole generating process. Ensure you have granted access to github.com and all its subsidiaries before proceeding.

-----------------------------------------------------------

# 2. Work Flow

   a) (!!!) Ensure the environment variable **CY_TOOLS_PATHS** is explicitly added to the environment variables, even if you have installed ModusToolbox in the default location. To do this on Windows, go to System Properties --> Advanced --> Environment Variables. Ensure the value references to the directory "tools_X.Y" correctly, and you must use forward slashes in the variable’s path. For more information, see ModusToolbox User Guide .

   b) (!!!) Also, remember to delete the environment variable **CyRemoteManifestOverride** if you find it in the System Environment. Because it will interfere with the offline mode in ModusToolbox and cause incoherence.

   c) Download the attached ModusToolbox Offline Content Package Generator. Unzip it to the preferred location. You'll get a directory named **offline** and it includes the script files.

   d) Double-click to run the file **!!!PLEASE_RUN_ME!!!.cmd** and leave all other files untouched. Now the generating process is started and might need hours to complete. Please wait for the window to be terminated automatically.

   e) Now you have successfully generated your own and up-to-date ModusToolbox offline content package. Return to superior directory and copy the whole directory **offline** that you just generated, to the hidden directory named ".modustoolbox" in your home directory. Theoretically the generated package can be used on Windows/MacOS/Linux.

   f) Congratulations! Use the ModusToolbox in offline mode. You will see the package is loaded. If your package becomes out-of-date, simply run the file **!!!PLEASE_RUN_ME!!!.cmd** again.

-----------------------------------------------------------

# 3. Notes

   a) Use this feature for emergency only. Online content is always prior to offline content.

   b) The offline package is always generated using the latest content online. The version and release date of the generator will *not* put a constraint on fetching the latest content.

   c) The generated offline package is compatible with ModusToolbox 1.x, 2.x and hopefully later.

   d) Third-Party dependencies might be cached during the generation. But the generator itself doesn't contain Third-Party dependencies/repos/code.

   e) For more infomation, see: *https://community.cypress.com/t5/Resource-Library/ModusToolbox-offline-libraries/ta-p/252288*
