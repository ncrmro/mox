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

### Weekly Scrub

Add the following to `/etc/crontabs/root`

```
*       *       */7     *       *       zpool scrub rpool
```

### Automated Snapshots

Install required packages

```zsh
apk add git perl-config-inifiles perl-capture-tiny pv gzip lzop mbuffer
```

Clone and checkout stable version

```zsh
git -C /opt clone https://github.com/jimsalterjrs/sanoid.git
git checkout v2.1.0
```

Create configuration files

```zsh
mkdir /etc/sanoid
cp /opt/sanoid/sanoid.conf /etc/sanoid/sanoid.conf
cp /opt/sanoid/sanoid.defaults.conf /etc/sanoid/sanoid.defaults.conf
```

Link the sanoid and syncoid binaries into sbin

```zsh
ln -s /opt/sanoid/sanoid /sbin/sanoid
ln -s /opt/sanoid/syncoid /sbin/syncoid
```

You should now be able to execute `sanoid` and `syncoid`

Enable snapshots on `rpool/ROOT/alpine` (where the os is installed)

Comment out the block

```
# you can also handle datasets recursively in an atomic way without the possibility to override settings for child datasets.
[zpoolname/parent2]
        use_template = production
        recursive = zfs
```

Add the following underneath it.

```x
[rpool/ROOT/alpine]
        use_template = production
```


Next we need to set up the cronjobs 

```zsh
nano /etc/crontabs/root
```

Add the cronjobs, the flock makesure we commands don't run multiple times.

```zsh
*/15    *       *       *       *       flock -n /var/run/sanoid/cron-take.lock -c "TZ=UTC sanoid --take-snapshots"
*/15    *       *       *       *       flock -n /var/run/sanoid/cron-prune.lock -c "sanoid --prune-snapshots"
```

Check crontab

```zsh
crontab -l
```



#### Offsite Backups

mbuffer should be installed

```sh
apk add mbuffer
```

### Using zvols for VMS

```
apk add udev zfs-udev
service udev start
service udev-postmount start
service udev-trigger start
udevadm trigger

rc-update add udev
rc-update add udev-postmount
rc-update add udev-trigger
```
