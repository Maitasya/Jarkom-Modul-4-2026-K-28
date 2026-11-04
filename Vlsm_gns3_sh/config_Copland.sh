#!/bin/sh
set -eu
# Konfigurasi router Copland — K-28
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
    address 192.225.16.35
    netmask 255.255.255.248
    gateway 192.225.16.33

auto eth1
iface eth1 inet static
    address 192.225.8.1
    netmask 255.255.254.0

auto eth2
iface eth2 inet static
    address 192.225.15.193
    netmask 255.255.255.192
EOF

cat > /etc/sysctl.d/99-k28-router.conf <<'EOF'
net.ipv4.ip_forward=1
EOF
sysctl --system >/dev/null

ip link set eth0 up
ip addr flush dev eth0
ip addr add 192.225.16.35/29 dev eth0
ip link set eth1 up
ip addr flush dev eth1
ip addr add 192.225.8.1/23 dev eth1
ip link set eth2 up
ip addr flush dev eth2
ip addr add 192.225.15.193/26 dev eth2
ip route replace default via 192.225.16.33
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "=== Konfigurasi selesai: Copland ==="
ip -br addr
ip route
sysctl net.ipv4.ip_forward
SCRIPT
chmod +x /root/config_Copland.sh
sh /root/config_Copland.sh