#Opsætter NAT(Network address translation) som giver dine private ip'er en fælles Offentlig IPv4, så vi spare på offentlige IP'er.
#Desuden skjuler det vores infrastruktur fra verdenen, så vi ikke er lige så nemme at angribe/hacke
New-NetNat -name "NAT" -InternalIPInterfaceAddressPrefix 192.168.103.0/25




