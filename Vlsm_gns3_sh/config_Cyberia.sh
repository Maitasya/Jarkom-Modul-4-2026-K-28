#!/bin/sh
set -eu
# Konfigurasi router Cyberia — K-28
BACKUP="/root/backup-network-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP"
[ ! -f /etc/network/interfaces ] || cp -a /etc/network/interfaces "$BACKUP/interfaces"
[ ! -f /etc/sysctl.d/99-k28-router.conf ] || cp -a /etc/sysctl.d/99-k28-router.conf "$BACKUP/99-k28-router.conf"
echo "Backup tersimpan di: $BACKUP"

cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 192.225.16.57
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 192.225.14.1
    netmask 255.255.255.128
    up iptables -t nat -C POSTROUTING -s 192.225.0.0/19 -o eth0 -j MASQUERADE 2>/dev/null || iptables -t nat -A POSTROUTING -s 192.225.0.0/19 -o eth0 -j MASQUERADE
    up ip route replace 192.225.0.0/19 via 192.225.16.58
EOF

cat > /etc/sysctl.d/99-k28-router.conf <<'EOF'
net.ipv4.ip_forward=1
EOF
sysctl --system >/dev/null

ip link set eth0 up
(dhclient eth0 2>/dev/null || udhcpc -i eth0 -q 2>/dev/null || true)
ip link set eth1 up
ip addr flush dev eth1
ip addr add 192.225.16.57/30 dev eth1
ip link set eth2 up
ip addr flush dev eth2
ip addr add 192.225.14.1/25 dev eth2
ip route replace 192.225.0.0/19 via 192.225.16.58
iptables -t nat -C POSTROUTING -s 192.225.0.0/19 -o eth0 -j MASQUERADE 2>/dev/null || iptables -t nat -A POSTROUTING -s 192.225.0.0/19 -o eth0 -j MASQUERADE
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "=== Konfigurasi selesai: Cyberia ==="
ip -br addr
ip route
sysctl net.ipv4.ip_forward
SCRIPT
chmod +x /root/config_Cyberia.sh
sh /root/config_Cyberia.sh