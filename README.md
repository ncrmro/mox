# mox
Alpine based KVM baremetal hypervisor on ZFS.

## Usage

Burn the ISO to a use disk.

The this will boot into Alpine running on the USB drive.

Run `sh install.sh`, this will begin the instillation process.

## Development

This currently can only be done on an existing KVM host.

The easiest way to use the script without changes is to add to your ssh config mox_installer which shoul be pointed at your kvm_host.

We run the `build_installer.sh` which will create and iso.

The iso can be burned to a USB flash drive and contains the
required files to run the mox installer.


## Reference
[Alpine Docs](https://wiki.alpinelinux.org/wiki/Alpine_Linux_with_root_on_ZFS_with_native_encryption)
[Alpine Linux root on ZFS](https://gist.github.com/kongkrit/2d31d58a7656d3b5d3e3ce1a8dda9f56)


