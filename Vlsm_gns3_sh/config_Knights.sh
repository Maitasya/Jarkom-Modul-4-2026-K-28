#!/bin/sh
set -eu
# Konfigurasi router Knights — K-28
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
    address 192.225.16.82
    netmask 255.255.255.252
    gateway 192.225.16.81

auto eth1
iface eth1 inet static
    address 192.225.16.85
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 192.225.16.49
    netmask 255.255.255.248
    up ip route replace 192.225.15.0/26 via 192.225.16.86
    up ip route replace 192.225.16.0/27 via 192.225.16.86
    up ip route replace 192.225.16.88/30 via 192.225.16.86
EOF

cat > /etc/sysctl.d/99-k28-router.conf <<'EOF'
net.ipv4.ip_forward=1
EOF
sysctl --system >/dev/null

ip link set eth0 up
ip addr flush dev eth0
ip addr add 192.225.16.82/30 dev eth0
ip link set eth1 up
ip addr flush dev eth1
ip addr add 192.225.16.85/30 dev eth1
ip link set eth2 up
ip addr flush dev eth2
ip addr add 192.225.16.49/29 dev eth2
ip route replace default via 192.225.16.81
ip route replace 192.225.15.0/26 via 192.225.16.86
ip route replace 192.225.16.0/27 via 192.225.16.86
ip route replace 192.225.16.88/30 via 192.225.16.86
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "=== Konfigurasi selesai: Knights ==="
ip -br addr
ip route
sysctl net.ipv4.ip_forward
SCRIPT
chmod +x /root/config_Knights.sh
sh /root/config_Knights.sh