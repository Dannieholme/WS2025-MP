#Spørger brugeren hvilken gruppe og Bogstav, den ligger selv variablerne ind i navnet
$group = Read-Host "Hvad er dit gruppe nummer? fx. 03"
$user = Read-Host "Hvad er dit eget bogstav? fx. C"

#Opret Partition til SYSVOL og NTDS
Get-Partition -DiskNumber 0 -PartitionNumber 5 | Set-Partition -NewDriveLetter E
#Det nye navn vi vil give computeren
$newName = "MP$group$user-SRV22"
#Giver computeren navnet og genstarter computeren, så alt fungere
Rename-Computer -NewName $newName -Force -Restart
