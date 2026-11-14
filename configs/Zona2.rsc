# 2026-11-14 16:38:54 by RouterOS 7.25.1
# system id = qTIOwTTfhAO
#
/interface bridge
add name=Bridge-SW vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/ip dhcp-client
# DHCP client can not run on slave or passthrough interface!
add interface=ether1 name=client1
/system identity
set name=Zona2
/tool romon
set enabled=yes
/interface bridge port
add bridge=Bridge-SW interface=ether1
add bridge=Bridge-SW interface=ether2 pvid=20
add bridge=Bridge-SW interface=ether3 pvid=20
/interface bridge vlan
add bridge=Bridge-SW tagged=ether1 untagged=ether2,ether3 vlan-ids=20
