# ModusToolbox offline content package

This package enables you to use ModusToolbox Project Creator and Library Manager
tools without persistent internet connection. It contains all the ModusToolbox 
repos referenced in the ModusToolbox manifest files.

## Installation

1. If you do not already have a hidden directory named .modustoolbox in your 
   home directory, create one. Using Cygwin on Windows for example:

    mkdir -p "$USERPROFILE/.modustoolbox"

   Note: If you installed ModusToolbox in a non-default location, modify the
   command for the appropriate location of the .modustoolbox folder. Refer to
   the ModusToolbox Installation Guide for additional details 
   (https://www.cypress.com/ModusToolboxInstallGuide).

2. Extract the ZIP archive to the ~/.modustoolbox sub-directory in your home 
   directory. The resulting path should be: ~/.modustoolbox/offline.

   The following is a Cygwin on Windows command-line example to use for
   extracting the content:

    unzip -qbod "$USERPROFILE/.modustoolbox" modustoolbox-offline-content.zip

   Note: If you previously installed a copy of the offline content, you should
   delete the existing ~/.modustoolbox/offline directory before extracting the
   archive. Using Cygwin on Windows for example:

    rm -rf "$USERPROFILE/.modustoolbox/offline"

## Usage

To use the Project Creator CLI in offline mode, execute the tool with the
--offline argument. For example:

    project-creator-cli --board-id CY8CPROTO-062-4343W --app-id mtb-example-psoc6-hello-world --offline

To use the Project Creator GUI or Library Manager GUI in offline mode,
select 'Offline' from the 'Settings' menu (refer to the appropriate user guide
for details).

The tools execute the "make getlibs" command under the hood to download/update
the firmware libraries. To execute the 'getlibs' target in offline mode, pass
the CY_GETLIBS_OFFLINE=true argument:

    make getlibs CY_GETLIBS_OFFLINE=true

Refer to the ModusToolbox User Guide for additional details
(http://www.cypress.com/ModusToolboxUserGuide).

## Third-Party Dependencies

ModusToolbox Offline Content might include 3rd-party code libraries that 
include a subset of their project history. If you would like to download the
full historical information for third-party content manually, execute the
following commands in a terminal:
 
    git -C ~/.modustoolbox/offline/git/https___git.savannah.nongnu.org_git_lwip/lwip fetch --unshallow
    git -C ~/.modustoolbox/offline/git/https___github.com_ARMmbed_mbedtls/mbedtls fetch --unshallow
    git -C ~/.modustoolbox/offline/git/https___github.com_aws_aws-iot-device-sdk-embedded-C/aws-iot-device-sdk-embedded-C fetch --unshallow
    git -C ~/.modustoolbox/offline/git/https___github.com_JuulLabs-OSS_mcuboot/mcuboot fetch --unshallow

Note: If you installed ModusToolbox in a non-default location, modify the
command for the appropriate location of the .modustoolbox folder. Refer to
the ModusToolbox Installation Guide for additional details 
(https://www.cypress.com/ModusToolboxInstallGuide).

===============================================================================
Copyright (C) 2020, Cypress Semiconductor Corporation or a subsidiary of 
Cypress Semiconductor Corporation. All rights reserved. Other names and brands
may be claimed as property of their respective owners.
