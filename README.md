# fedora-intel-ipu6
A script to rollback kernel to 6.6 so you can use intel webcam on Fedora 39

1. Enable rpmfsion rep
2. sudo dnf update --enablerepo=rpmfusion-nonfree-updates* 'ipu6-camera-*'
3. git clone https://github.com/reiserfs/fedora-intel-ipu6.git
4. fedora-intel-ipu6/fedora-kernel66.sh
5. reboot
