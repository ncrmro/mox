# KVM

## Bridge Interface

To load `modprobe tun`

Add `tun` to `/etc/modules` to enable on rreboot

## Datasets

Create the images dataset

```zsh
zfs create -o mountpoint=/mnt/images -o quota=50G rpool/images
```

Create the VM dataset

```zsh
zfs create rpool/vm
```
