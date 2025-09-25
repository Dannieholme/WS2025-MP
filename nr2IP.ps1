Remove-NetIPAddress -InterfaceAlias "LAN"

New-NetIPAddress -InterfaceAlias "LAN" -IPAddress 192.168.103.10 -PrefixLength 25

Set-DnsClientServerAddress -InterfaceAlias "LAN" -ServerAddresses ("192.168.103.10","127.0.0.1")
