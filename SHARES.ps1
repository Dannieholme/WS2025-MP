# Opret Company share med grundlæggende permissions
New-SmbShare -Name "Company" -Path "C:\Shares\Company" -FullAccess "Domain Admins" -ChangeAccess "Domain Users"

# Sæt NTFS permissions
$Acl = Get-Acl "C:\Shares\Company"

# Fjern arvede permissions for bedre kontrol
$Acl.SetAccessRuleProtection($true,$false)

# Tilføj Domain Admins - Full Control
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("HQSDE\Domain Admins","FullControl","ContainerInherit,ObjectInherit","None","Allow")
$Acl.SetAccessRule($AccessRule)

# Tilføj Domain Users - Modify
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("HQSDE\Domain Users","Modify","ContainerInherit,ObjectInherit","None","Allow")
$Acl.SetAccessRule($AccessRule)

# System - Full Control (vigtig for systemet)
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("NT AUTHORITY\SYSTEM","FullControl","ContainerInherit,ObjectInherit","None","Allow")
$Acl.SetAccessRule($AccessRule)

# Anvend permissions
Set-Acl -Path "C:\Shares\Company" -AclObject $Acl

# Verificer share
Get-SmbShare -Name "Company"
Get-SmbShareAccess -Name "Company"


# Opret skjult home folders share
New-SmbShare -Name "HomeUsers$" -Path "C:\Shares\HomeUsers" -FullAccess "Domain Admins" -ChangeAccess "Authenticated Users"

# For hver bruger - opret personlig mappe og sæt permissions - kør som ISE script
Import-Module ActiveDirectory
$Users = @("anko", "tebj", "poti", "hafe", "beov")  # Tilføj alle brugernavne her

foreach ($User in $Users) {
    # Opret brugermappe
    $UserPath = "C:\Shares\HomeUsers\$User"
    New-Item -Path $UserPath -ItemType Directory -Force
    
    # Sæt NTFS permissions - kun brugeren selv har adgang
    $Acl = Get-Acl $UserPath
    $Acl.SetAccessRuleProtection($true,$false)
    
    # Domain Admins - Full Control
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("HQSDE\Domain Admins","FullControl","ContainerInherit,ObjectInherit","None","Allow")
    $Acl.SetAccessRule($AccessRule)
    
    # Brugeren selv - Full Control
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("HQSDE\$User","FullControl","ContainerInherit,ObjectInherit","None","Allow")
    $Acl.SetAccessRule($AccessRule)
    
    Set-Acl -Path $UserPath -AclObject $Acl
    
    # Konfigurer home directory i AD
    Set-ADUser -Identity $User -HomeDirectory "\\WS2025-DC01\HomeUsers$\$User" -HomeDrive "H:"
    
    Write-Host "Home folder oprettet for $User" -ForegroundColor Green
}

# Verificer home folders
Get-SmbShare -Name "HomeUsers$"
