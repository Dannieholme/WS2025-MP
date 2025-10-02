#Installation af DHCP
Install-WindowsFeature -name DHCP -IncludeManagementTools
#Create Scope med start range 192.168.103.1 og end range 192.168.103.126, derudover sætter vi subnetmasken til /25 aka. 255.255.255.128
Add-DhcpServerv4Scope -name "Lan Scope" -StartRange 192.168.103.1 -EndRange 192.168.103.126 -SubnetMask 255.255.255.128
#Her siger vi at den ikke må uddele ip'erne mellem 192.168.103.0 - 192.168.103.11
Add-DhcpServerv4ExclusionRange -ScopeId 192.168.103.0 -StartRange 192.168.103.1 -EndRange 192.168.103.11
#opsætter default gateway(Option 3)
Set-DhcpServerv4OptionValue -ScopeId 192.168.103.0 -OptionId 3 -Value 192.168.103.10
#Her opsætter vi DNS serveren(Option 6)
Set-dhcpserverv4optionvalue -scopeid 192.168.103.0 -OptionId 6 -value 192.168.103.10
#Her opsætter vi Domæne navnet(Option 15)
Set-DhcpServerv4OptionValue 15 enterprise.03C.gf2
#Her siger vi at vi har en lease tid på 1Dag
Set-DhcpServerv4Scope -ScopeId 192.168.103.0 -LeaseDuration ([TimeSpan]::FromDays(1))
#Genstarter computeren så alt træder i kraft
Restart-Computer




