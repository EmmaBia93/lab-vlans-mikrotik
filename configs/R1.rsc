# 2026-11-14 16:38:24 by RouterOS 7.25.1
# system id = iiOBODC5khI
#
/ip dhcp-server network
add address=10.110.0.0/24 dns-none=yes gateway=10.110.0.1
add address=10.111.0.0/24 dns-none=yes gateway=10.111.0.1
/ip pool
add name=dhcp_pool0 ranges=10.110.0.2-10.110.0.254
add name=dhcp_pool1 ranges=10.111.0.2-10.111.0.254
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface vlan
add interface=ether2 name=vlan10-zona1 vlan-id=10
add interface=ether2 name=vlan20-zona2 vlan-id=20
/ip address
add address=10.110.0.1/24 interface=vlan10-zona1 network=10.110.0.0
add address=10.111.0.1/24 interface=vlan20-zona2 network=10.111.0.0
/ip dhcp-client
add interface=ether1 name=client1
/ip dhcp-server
add add-arp=yes address-pool=dhcp_pool0 interface=vlan10-zona1 name=dhcp1
add add-arp=yes address-pool=dhcp_pool1 interface=vlan20-zona2 name=dhcp2
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/system identity
set name=Borde
/tool romon
set enabled=yes
