#Spørger brugeren om Gruppenummer og Bogstav som den så ligger i variaber, som kan bruges når vi laver vores domæne
 $gruppe = Read-Host "Hvad er dit gruppenummer? fx. 03"
$user = Read-Host "Hvad er dit bogstav? fx. C"
#Installation af AD DS og DNS i server manager
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
Install-WindowsFeature -Name DNS -IncludeManagementTools

#Promotion til Domain controller med vigtige indstillinger
Install-ADDSForest -DomainName "enterprise.$gruppe$user.gf2" -DomainNetbiosName "$gruppe$user" -CreateDnsDelegation:$false -DatabasePath "E:\NTDS" -LogPath "E:\NTDS" -SysvolPath "E:\SYSVOL" -DomainMode "Win2025" -Forestmode "Win2025" -InstallDns:$true -NoRebootOnCompletion:$false -Force:$true





