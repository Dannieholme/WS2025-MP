#Fjerner alt tidligere configuration af vores LAN(VLAN) adapter
Remove-NetIPAddress -InterfaceAlias "LAN"
#Laver en ny ip adresse med subnetmaske
New-NetIPAddress -InterfaceAlias "LAN" -IPAddress 192.168.103.10 -PrefixLength 25
#Sætter DNS adresserne.
Set-DnsClientServerAddress -InterfaceAlias "LAN" -ServerAddresses ("192.168.103.10","127.0.0.1")
