Import-module ActiveDirectory
$gruppe = Read-Host "Gruppenr?"
$user = Read-Host "Bogstav?"

# Import CSV fil
$brugere = Import-Csv -Path "C:\Brugere.csv"

# Gennemgå hver bruger
foreach ($bruger in $brugere) {
    $brugernavn = "$($bruger.Fornavn).$($bruger.Efternavn)"
    $fuldenavn = "$($bruger.Fornavn) $($bruger.Efternavn)"
    
    # Opret brugeren
    New-ADuser -Name $fuldenavn -GivenName $bruger.Fornavn -Surname $bruger.Efternavn -SamAccountName $bruger.Initialer -EmailAddress $bruger.Email -Path "OU=$($bruger.Afdeling),DC=enterprise,DC=$gruppe$user,DC=gf2" -AccountPassword (ConvertTo-SecureString $bruger.Password -AsPlainText -Force) -Enabled $true
    
    Write-Host "Oprettet bruger: $fuldenavn"
}
