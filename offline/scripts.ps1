# Auther: dreamscaperia @github.com
# Version: 2.4.0.0
# Title: ModusToolbox Offline Content Generator
# Desc: The ModusToolbox Offline Content Generator is released to help you generate your own and up-to-date ModusToolbox offline content package.

chcp 65001

Invoke-WebRequest -Uri https://gitee.com/dreamscaperia/mtb-super-manifest/raw/master/mtb-super-manifest.zip -OutFile ./mtb-super-manifest.zip
Expand-Archive -Path .\mtb-super-manifest.zip -DestinationPath .\manifests-v2.X -Force
#Remove-Item -Recurse -Force .\git
if (Test-Path .\update.bash) {Remove-Item .\update.bash}
"#!/bin/bash`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
"git config --global http.sslVerify false`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
"git config --global https.sslVerify false`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
#"rm -rf ./git`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
Get-Content .\manifests-v2.X\*.xml|%{
#    if($_ -match "(?<=>)http.*cypresssemiconductorco.*(?=</)")
#    if($_ -match "(?<=>)http.*github\.com\/.*(?=</)")
    if($_ -match "(?<=uri>)http.*\/.*(?=</)")
    {
        "Discovered: "+$matches[0]
        $splits = $matches[0].Split("/");
        $dirname = $matches[0].Replace("<", "_").Replace(">", "_").Replace(":", "_").Replace("`"", "_").Replace("/", "_").Replace("\\", "_").Replace("|", "_").Replace("\?", "_").Replace("\*", "_");
        $librepo = "./git/"+$dirname+"/"+$($splits[$splits.count-1])
        #"git clone --verbose --progress --bare "+$matches[0]+" ./git/"+$dirname+"/"+$($splits[$splits.count-1])+"`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
        if(Test-Path ((Get-Location).Path.toString()+$librepo)){
            "pushd "+$librepo+"`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
            "git config remote.origin.fetch 'refs/heads/*:refs/heads/*'`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
            "git fetch --verbose --progress --all --tags --force`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
            "popd`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
        } else {
            "git clone --verbose --progress --bare "+$matches[0]+" "+$librepo+"`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
        }
    }
}
$InstPath = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Select-Object -Last 1
if ( -not $InstPath ){ $InstPath = Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Select-Object -Last 1 }
$cytp = Get-ChildItem -Path $instpath -Filter "tool*"|Select-Object -Last 1|%{$_.fullname}
#If ((test-path env:CY_TOOLS_PATHS) -and (Get-ChildItem env:CY_TOOLS_PATHS).value.length -gt 0) {
If ($cytp) {
    #$cytp=(Get-ChildItem env:CY_TOOLS_PATHS).value.Replace("/","\")
    #.Replace("+", "\+").Replace("%", "\%").Replace("~", "\~").Replace("-", "\-").Replace(".", "\.").Replace("#", "\#")
    $loc = (Get-Location).Path.Replace(":","").Replace("\","/").Replace(" ", "\ ").Replace(";", "\;").Replace("'", "\'").Replace("!", "\!").Replace("$", "\$").Replace("{", "\{").Replace("}", "\}").Replace("(", "\(").Replace(")", "\)").Replace("[", "\[").Replace("]", "\]").Replace("&", "\&").Replace("=", "\=")
    Invoke-Expression $cytp"\modus-shell\bin\bash --login -i -c `'cd /cygdrive/"$loc";./update.bash 2>&1|tee ./update.log`'"
    if (Test-Path .\update.bash) {Remove-Item .\update.bash}
} else {
    echo "Error: Cannot detect ModusToolbox. Please INSTALL it on your computer first and then re-run the generator. OR manually use any compatible UNIX shell to run the generated bash script (update.bash)."
    pause
}
If (test-path env:CyRemoteManifestOverride) {
    echo "Error: environment variable CyRemoteManifestOverride detected. Please REMOVE it from the environment variables so you can use the offline mode."
    pause
}
If (test-path env:CY_GETLIBS_CACHE_PATH) {
    echo "Error: environment variable CY_GETLIBS_CACHE_PATH detected. Please REMOVE it from the environment variables to avoid unexpected results."
    pause
}
exit