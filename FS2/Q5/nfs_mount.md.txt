```

[root@fs2client01 ~]# mount 10.10.10.247:/storage/vrgdisk/nfs /mnt
[root@fs2client01 ~]# df -h
Filesystem                         Size  Used Avail Use% Mounted on
/dev/sda2                           99G  3.7G   90G   4% /
devtmpfs                           2.0G     0  2.0G   0% /dev
tmpfs                              2.0G     0  2.0G   0% /dev/shm
tmpfs                              2.0G   17M  2.0G   1% /run
tmpfs                              2.0G     0  2.0G   0% /sys/fs/cgroup
/dev/sda1                          976M  115M  794M  13% /boot
tmpfs                              396M     0  396M   0% /run/user/0
10.10.10.247:/storage/vrgdisk/nfs   50G   32M   50G   1% /mnt
```