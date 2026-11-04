#!/bin/sh
set -eu
# Konfigurasi router Tachibana — K-28
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
    address 192.225.16.66
    netmask 255.255.255.252
    gateway 192.225.16.65

auto eth1
iface eth1 inet static
    address 192.225.10.1
    netmask 255.255.254.0

auto eth2
iface eth2 inet static
    address 192.225.16.73
    netmask 255.255.255.252
    up ip route replace 192.225.14.128/25 via 192.225.16.74
    up ip route replace 192.225.15.0/26 via 192.225.16.74
    up ip route replace 192.225.15.128/26 via 192.225.16.74
    up ip route replace 192.225.16.0/27 via 192.225.16.74
    up ip route replace 192.225.16.48/29 via 192.225.16.74
    up ip route replace 192.225.16.76/30 via 192.225.16.74
    up ip route replace 192.225.16.80/30 via 192.225.16.74
    up ip route replace 192.225.16.84/30 via 192.225.16.74
    up ip route replace 192.225.16.88/30 via 192.225.16.74
EOF

cat > /etc/sysctl.d/99-k28-router.conf <<'EOF'
net.ipv4.ip_forward=1
EOF
sysctl --system >/dev/null

ip link set eth0 up
ip addr flush dev eth0
ip addr add 192.225.16.66/30 dev eth0
ip link set eth1 up
ip addr flush dev eth1
ip addr add 192.225.10.1/23 dev eth1
ip link set eth2 up
ip addr flush dev eth2
ip addr add 192.225.16.73/30 dev eth2
ip route replace default via 192.225.16.65
ip route replace 192.225.14.128/25 via 192.225.16.74
ip route replace 192.225.15.0/26 via 192.225.16.74
ip route replace 192.225.15.128/26 via 192.225.16.74
ip route replace 192.225.16.0/27 via 192.225.16.74
ip route replace 192.225.16.48/29 via 192.225.16.74
ip route replace 192.225.16.76/30 via 192.225.16.74
ip route replace 192.225.16.80/30 via 192.225.16.74
ip route replace 192.225.16.84/30 via 192.225.16.74
ip route replace 192.225.16.88/30 via 192.225.16.74
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "=== Konfigurasi selesai: Tachibana ==="
ip -br addr
ip route
sysctl net.ipv4.ip_forward
SCRIPT
chmod +x /root/config_Tachibana.sh
sh /root/config_Tachibana.sh