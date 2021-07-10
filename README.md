# mox
Alpine based KVM baremetal hypervisor on ZFS.

* [Install](#install)
* [ZFS](README_ZFS.md)

## Install

Follow the regular Alpine install and enable [ZFS Root](https://wiki.alpinelinux.org/wiki/Alpine_Linux_with_root_on_ZFS_with_native_encryption)

### More than one encrypted disk

There is currently a bug where having more than one encypted disk will block booting.
