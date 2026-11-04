#!/bin/sh
set -eu
BACKUP="/root/backup-network-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP"
[ ! -f /etc/network/interfaces ] || cp -a /etc/network/interfaces "$BACKUP/interfaces"
echo "Backup tersimpan di: $BACKUP"

cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.225.0.2
    netmask 255.255.252.0
    gateway 192.225.0.1
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf
EOF

ip link set eth0 up
ip addr flush dev eth0
ip addr add 192.225.0.2/22 dev eth0
ip route replace default via 192.225.0.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf

echo "=== Konfigurasi selesai: Kari ==="
ip -br addr
ip route
SCRIPT
chmod +x /root/config_Kari.sh
sh /root/config_Kari.sh