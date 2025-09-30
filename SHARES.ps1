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
