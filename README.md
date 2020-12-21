# mox
Alpine based KVM baremetal hypervisor on ZFS.

* [Install](#install)
* [ZFS](#zfs)
    * [Snapshoting](#manual-snapshotting)
    * [Automated Snapshotting](#automated-snapshots)

## Install

Follow the regular Alpine install and enable [ZFS Root](https://wiki.alpinelinux.org/wiki/Alpine_Linux_with_root_on_ZFS_with_native_encryption)

Once we are booted into the installed os lets go ahead and make a snapshot.


## ZFS

We will initially focus on ZFS before moving onto any other steps as data integrity comes first and foremost.

We can make a snapshot of all the datasets available on rpool.

### Manual Snapshotting
```bash
zfs snapshot -r rpool@$(date +%Y-%m-%d_%H-%M-%S)
```

To see our current snapshots

```bash
zfs list -t snapshot
```

To destroy a snapshot

```bash
zfs destroy rpool/vm/data/hydra@2020-12-21_12-46-19
```

### Automated Snapshots

```
apk add zfs-auto-snapshot
```

```bash
zfs-auto-snapshot -h
```


### More than one encrypted disk

There is currently a bug where having more than one encypted disk will block booting.
