echo Welcome to the mox installer

DISK=/dev/disk/by-id/ata-M4-CT128M4SSD2_0000000011380319AEA1
DISK=/dev/sda1

echo Confirm installing to $DISK

apk add zfs sfdisk e2fsprogs syslinux

echo -e "${DISK}1: start=1M,size=100M,bootable\n/dev/sda2: start=101M" | sfdisk --quiet --label dos ${DISK}

echo " "
mdev -s

echo "Setting up tun interface"

modprobe tun

echo "Setting up bridge network interface"
apk add bridge

# /etc/network/interfaces
auto br0
iface br0 inet dhcp
  bridge_ports eth0
  bridge_stp 0
