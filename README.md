Important Update: Offline Content has been deprecated since ModusToolbox 3.1, Jun 12, 2023. Instead, the new feature [***Local Content Storage***](https://community.infineon.com/t5/ModusToolbox-General/Offline-content-users-Try-our-new-local-content-storage-feature/td-p/447399) is now introduced, making working offline easier.
------------------------------------------------------------

The **ModusToolbox Offline Content Generator** is released to help you generate your own and up-to-date ModusToolbox offline content package.

ModusToolbox offline content package was first introduced in April, 2020. 
> "This package enables you to use ModusToolbox Project Creator and Library Manager tools without a persistent internet connection. It contains all the ModusToolbox repos referenced in the ModusToolbox manifest files. We continue to recommend working with the online content - so you always have access to the latest software - but this is a useful alternative method of accessing libraries for users who are frequently working offline."

However the official package becomes quite out-of-date. To fix this once for all, you will need the **ModusToolbox Offline Content Generator**.


# 1. Prerequisites

The generator requires ModusToolbox 2.x and PowerShell (>=v5.0) to be installed on your Computer. The generated package might work on Windows/MacOS/Linux but the generator only works on Windows.

It's recommended to run the generator on a Windows 10 Computer because PowerShell (>=5.0) is included by default. For Windows 8.1 and earlier, install/update the PowerShell manually.

The generator needs open and persistent Internet access during the whole generating process. Ensure you have granted access to github.com and all its subsidiaries before proceeding. "sslVerify=false" will be now added to gitconfig to ensure the download process under some monitored networks. Be aware of this change and stop using the tool if you cannot afford MITM.


# 2. Work Flow

a) **(!!!)** Remember to delete **CyRemoteManifestOverride** AND **CY_GETLIBS_CACHE_PATH** if you find it in the environment variables. Because it will interfere with the offline mode of ModusToolbox and cause incoherence.

b) Download the ModusToolbox Offline Content Package Generator. Unzip it to the preferred location. You'll get a directory named **offline** and it includes the script files. Enter that directory.

c) Double-click to run the file **!!!PLEASE_RUN_ME!!!.cmd** and leave all other files untouched. Now the generating process is started and might need hours to complete. Please wait for the window to be terminated automatically.

d) Now you have successfully generated your own and up-to-date ModusToolbox offline content package. Return to superior directory and copy the whole directory **offline** that you just generated, to the hidden directory named **.modustoolbox** in your home directory. Theoretically the generated package can be used on Windows/MacOS/Linux.

e) Congratulations! Use the ModusToolbox in offline mode. You will see the package is loaded. If your package becomes out-of-date, simply run the file **!!!PLEASE_RUN_ME!!!.cmd** again.


# 3. Notes

a) Use this feature for emergency only. Online content is always prior to offline content.

b) The offline package is always generated using the latest content online. The version and release date of the generator will *not* put a constraint on fetching the latest content.

c) The generated offline package is compatible with ModusToolbox 1.x, 2.x and 3.0. Pleae use Local Content Storage instead for MTB 3.1 and later.

d) Third-Party dependencies might be cached during the generation. But the generator itself doesn't contain Third-Party dependencies/repos/code.

e) There is NO WARRANTY, to the extent permitted by law.

f) For more infomation, see: [*ModusToolbox offline libraries*](https://community.infineon.com/t5/Resource-Library/ModusToolbox-Offline-Libraries/ta-p/252265)
