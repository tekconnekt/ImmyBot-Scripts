#assuming this will be only running on 64-bit computers, so for now will only work on a 64-bit implementation.
#Reiterating above note - NOT COMPATIBLE W/ 32-bit systems (these systems should be upgraded)
$destination = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
$BGConfig = "$env:APPDATA\bginfo64"

#Reminder to delete this line before final release
$InstallerFolder = C:\Users\TannerLange\Documents\GitHub\ImmyBot-Scripts\BGInfo\BGInfo-Installer-Folder

Copy-Item $InstallerFolder\Bginfo64.exe $destination
Copy-Item $InstallerFolder\Bgiconfig.bgi $BGConfig
Invoke-Command{reg import $InstallerFolder\BGInfoDefault.reg} 
Start-Process $destination\Bginfo64.exe -ArgumentList "$BGConfig /silent /timer0 /nolicprompt"