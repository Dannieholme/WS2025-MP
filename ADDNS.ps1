$gruppe = Read-Host "Hvad er dit gruppenummer? fx. 03"
$user = Read-Host "Hvad er dit bogstav? fx. C"
#Installation af AD DS og DNS
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
Install-WindowsFeature -Name DNS -IncludeManagementTools
#Promotion til Domain controller med vigtige indstillinger
Get-Partition -DiskNumber 0 -PartitionNumber 5 | Set-Partition -NewDriveLetter E

Install-ADDSForest -DomainName "enterprise.$gruppe$user.gf2" -DomainNetbiosName "$gruppe$user" -CreateDnsDelegation:$false -DatabasePath "E:\NTDS" -LogPath "E:\NTDS" -SysvolPath "E:\SYSVOL" -DomainMode "Win2025" -Forestmode "Win2025" -InstallDns:$true -NoRebootOnCompletion:$false -Force:$true
