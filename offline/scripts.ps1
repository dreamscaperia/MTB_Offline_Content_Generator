Invoke-WebRequest -Uri https://itools.infineon.cn/mtb/manifests/mtb-super-manifest.zip -OutFile ./mtb-super-manifest.zip
Expand-Archive -Path .\mtb-super-manifest.zip -DestinationPath .\manifests-v2.X -Force
#Remove-Item -Recurse -Force .\git
if (Test-Path .\update.bash) {Remove-Item .\update.bash}
"#!/bin/bash`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
"rm -rf ./git`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
Get-Content .\manifests-v2.X\*.xml|%{
#    if($_ -match "(?<=>)http.*cypresssemiconductorco.*(?=</)")
    if($_ -match "(?<=>)http.*github\.com\/.*(?=</)")
    {
        "Discovered: "+$matches[0]
        $splits=$matches[0].Split("/");
        $dirname=$matches[0].Replace("<", "_").Replace(">", "_").Replace(":", "_").Replace("`"", "_").Replace("/", "_").Replace("\\", "_").Replace("|", "_").Replace("\?", "_").Replace("\*", "_");
        "git clone --verbose --progress --bare "+$matches[0]+" ./git/"+$dirname+"/"+$($splits[$splits.count-1])+"`n" | Out-File .\update.bash -Append -Encoding ascii -NoNewline
    }
}
If ((test-path env:CY_TOOLS_PATHS) -and (Get-ChildItem env:CY_TOOLS_PATHS).value.length -gt 0) {
    $cytp=(Get-ChildItem env:CY_TOOLS_PATHS).value.Replace("/","\")
    $loc=(Get-Location).Path.Replace(":","").Replace("\","/").Replace(" ", "\ ")
    Invoke-Expression $cytp"\modus-shell\bin\bash --login -i -c `"cd /cygdrive/"$loc";./update.bash`""
    if (Test-Path .\update.bash) {Remove-Item .\update.bash}
} else {
    echo "Error: Cannot detect environment variable CY_TOOLS_PATHS. Please explicitly add it to environment variables and re-run the generator."
    pause
}
quit