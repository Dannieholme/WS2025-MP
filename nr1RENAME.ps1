$group = Read-Host "Hvad er dit gruppe nummer? fx. 03"
$user = Read-Host "Hvad er dit eget bogstav? fx. C"

$newName = "MP$group$user-SRV22"

Rename-Computer -NewName $newName -Force -Restart
