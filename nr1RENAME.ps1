$group = Read-Host "Hvad er dit gruppe nummer? fx. 03"
$user = Read-Host "Hvad er dit eget bogstav? fx. C"

#Create Partition til SYSVOL og NTDS
Get-Partition -DiskNumber 0 -PartitionNumber 5 | Set-Partition -NewDriveLetter E

$newName = "MP$group$user-SRV22"

Rename-Computer -NewName $newName -Force -Restart
