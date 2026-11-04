#!/bin/sh
set -eu
# Konfigurasi router Wired — K-28
BACKUP="/root/backup-network-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP"
[ ! -f /etc/network/interfaces ] || cp -a /etc/network/interfaces "$BACKUP/interfaces"
[ ! -f /etc/sysctl.d/99-k28-router.conf ] || cp -a /etc/sysctl.d/99-k28-router.conf "$BACKUP/99-k28-router.conf"
echo "Backup tersimpan di: $BACKUP"

cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.225.16.58
    netmask 255.255.255.252
    gateway 192.225.16.57

auto eth1
iface eth1 inet static
    address 192.225.16.33
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.225.16.65
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 192.225.16.69
    netmask 255.255.255.252
    up ip route replace 192.225.0.0/22 via 192.225.16.34
    up ip route replace 192.225.4.0/22 via 192.225.16.36
    up ip route replace 192.225.8.0/23 via 192.225.16.35
    up ip route replace 192.225.10.0/23 via 192.225.16.66
    up ip route replace 192.225.12.0/24 via 192.225.16.70
    up ip route replace 192.225.13.0/24 via 192.225.16.70
    up ip route replace 192.225.14.128/25 via 192.225.16.66
    up ip route replace 192.225.15.0/26 via 192.225.16.66
    up ip route replace 192.225.15.64/26 via 192.225.16.70
    up ip route replace 192.225.15.128/26 via 192.225.16.66
    up ip route replace 192.225.15.192/26 via 192.225.16.35
    up ip route replace 192.225.16.0/27 via 192.225.16.66
    up ip route replace 192.225.16.40/29 via 192.225.16.36
    up ip route replace 192.225.16.48/29 via 192.225.16.66
    up ip route replace 192.225.16.60/30 via 192.225.16.36
    up ip route replace 192.225.16.72/30 via 192.225.16.66
    up ip route replace 192.225.16.76/30 via 192.225.16.66
    up ip route replace 192.225.16.80/30 via 192.225.16.66
    up ip route replace 192.225.16.84/30 via 192.225.16.66
    up ip route replace 192.225.16.88/30 via 192.225.16.66
EOF

cat > /etc/sysctl.d/99-k28-router.conf <<'EOF'
net.ipv4.ip_forward=1
EOF
sysctl --system >/dev/null

ip link set eth0 up
ip addr flush dev eth0
ip addr add 192.225.16.58/30 dev eth0
ip link set eth1 up
ip addr flush dev eth1
ip addr add 192.225.16.33/29 dev eth1
ip link set eth2 up
ip addr flush dev eth2
ip addr add 192.225.16.65/30 dev eth2
ip link set eth3 up
ip addr flush dev eth3
ip addr add 192.225.16.69/30 dev eth3
ip route replace default via 192.225.16.57
ip route replace 192.225.0.0/22 via 192.225.16.34
ip route replace 192.225.4.0/22 via 192.225.16.36
ip route replace 192.225.8.0/23 via 192.225.16.35
ip route replace 192.225.10.0/23 via 192.225.16.66
ip route replace 192.225.12.0/24 via 192.225.16.70
ip route replace 192.225.13.0/24 via 192.225.16.70
ip route replace 192.225.14.128/25 via 192.225.16.66
ip route replace 192.225.15.0/26 via 192.225.16.66
ip route replace 192.225.15.64/26 via 192.225.16.70
ip route replace 192.225.15.128/26 via 192.225.16.66
ip route replace 192.225.15.192/26 via 192.225.16.35
ip route replace 192.225.16.0/27 via 192.225.16.66
ip route replace 192.225.16.40/29 via 192.225.16.36
ip route replace 192.225.16.48/29 via 192.225.16.66
ip route replace 192.225.16.60/30 via 192.225.16.36
ip route replace 192.225.16.72/30 via 192.225.16.66
ip route replace 192.225.16.76/30 via 192.225.16.66
ip route replace 192.225.16.80/30 via 192.225.16.66
ip route replace 192.225.16.84/30 via 192.225.16.66
ip route replace 192.225.16.88/30 via 192.225.16.66
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "=== Konfigurasi selesai: Wired ==="
ip -br addr
ip route
sysctl net.ipv4.ip_forward
SCRIPT
chmod +x /root/config_Wired.sh
sh /root/config_Wired.sh