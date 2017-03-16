1. fdisk /dev/sd*  
2. parted /dev/sd* 
3. ls /dev/sd*
4. mkfs.ext4 /dev/sd*1
5. mkdir /home2
6. mount /dev/sdb1  /home2
7. blkid
8. vi /etc/fstab
9. UUID=*  /home2      ext4    defaults        0  0  

Change owner

sudo chown -R ngaam:ngaam /mount_point
