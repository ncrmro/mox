# ZFS

- [Snapshots](#snapshots)
 - [Automated Snapshots](#automated-snapshots)
 - [Offsite Snapshots](#offsite-backups)

## Snapshots

Snapshots can be listed with

```zsh
zfs list -t snapshot
```

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
#### Offsite Backups

mbuffer should be installed

```sh
apk add mbuffer
```

### Using zvols for VMS

```
apk add udev 
service udev start
service udev-postmount start
service udev-trigger start


apk add zfs-udev
udevadm trigger
```
