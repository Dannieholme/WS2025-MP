#Installation af DHCP
Install-WindowsFeature -name DHCP -IncludeManagementTools
#Create Scope
Add-DhcpServerv4Scope -name "Lan Scope" -StartRange 192.168.103.1 -EndRange 192.168.103.126 -SubnetMask 255.255.255.128
Add-DhcpServerv4ExclusionRange -ScopeId 192.168.103.0 -StartRange 192.168.103.1 -EndRange 192.168.103.11
Set-DhcpServerv4OptionValue -ScopeId 192.168.103.0 -OptionId 3 -Value 192.168.103.10
Set-dhcpserverv4optionvalue -scopeid 192.168.103.0 -OptionId 6 -value 192.168.103.10
Set-DhcpServerv4OptionValue 15 enterprise.03C.gf2
Set-DhcpServerv4Scope -ScopeId 192.168.103.0 -LeaseDuration ([TimeSpan]::FromDays(1))

Restart-Computer

