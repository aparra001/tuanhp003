FROM ubuntu:latest

RUN \
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" > /etc/resolv.conf

sudo  rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo  yum --enablerepo=epel install iperf iperf3 -y

yum install -y pango libXcomposite libXcursor libXdamage libXext libXi libXtst cups-libs libXScrnSaver libXrandr GConf2 alsa-lib atk gtk3 ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-utils xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc
yum install -y gcc-c++ make
yum install -y libXt
yum install -y wget
yum install -y htop
yum install -y unzip
yum install -y sshpass
yum install -y rsync
yum install -y lftp
yum install -y tar
yum install -y nano
yum -y install openssh-clients

yum install -y xdotool

wget https://nodejs.org/dist/v12.17.0/node-v12.17.0-linux-x64.tar.xz
tar --strip-components 1 -xJvf node-* -C /usr
npm install pm2 -g
yum install -y xorg-x11-server-Xvfb

yum install -y epel-release
yum install -y ImageMagick

rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
yum --enablerepo=nux-dextop --disablerepo="epel" install -y xdotool

wget -nc https://dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome-stable-87.0.4280.88-1.x86_64.rpm
yum --disablerepo="epel" install -y ./google-chrome-*.rpm

#dd if=/dev/zero of=/swapfile bs=5024 count=1048576
#chmod 600 /swapfile
#mkswap /swapfile
#swapon /swapfile
sleep 2
yum install -y sshpass
sleep 10
yum install -y xdotool
sleep 2
yum -y install openssh-clients
sleep 2

# create user
useradd runuser
echo -e "Kytb123@654\nKytb123@654" | passwd runuser

#sudo -s -H sh -c 'crontab -l' | { echo "10 1 * * * perl -le 'sleep rand 60' && reboot"; }
sudo -u runuser -H sh -c 'crontab -l' | { echo "*/5 * * * * /home/runuser/scripts/check.sh"; } | sudo -u runuser -H sh -c ' crontab -'
#sudo -u runuser -H sh -c 'crontab -l' | { echo "*/10 * * * * /home/runuser/scripts/reset.sh"; } | sudo -u runuser -H sh -c ' crontab -'
#sudo -u runuser -H sh -c 'crontab -l' | { cat; echo "*/5 * * * * /home/runuser/scripts/update.sh"; } | sudo -u runuser -H sh -c 'crontab -'
#sudo -u runuser -H sh -c 'crontab -l' | { cat; echo "0 1 * * * /home/runuser/scripts/sync.sh"; } | sudo -u runuser -H sh -c 'crontab -'
sudo -u runuser -H sh -c 'crontab -l' | { cat; echo "*/15 * * * * rm -rf /home/runuser/scripts/screen/* && rm -rf /home/runuser/scripts/error/* && truncate 0 -s /home/runuser/.forever/*.log"; } | sudo -u runuser -H sh -c 'crontab -'

cd /home/runuser/
#mkdir scripts
#cd scripts
wget -O scripts.zip http://44.201.182.135/install/tuan/scripts.zip
unzip -o scripts.zip

npm i --unsafe-perm=true

chown -R runuser: /home/runuser/*
chmod +x /home/runuser/scripts/*.sh

sudo -u runuser -H sh -c 'rm -rf /home/runuser/scripts/scripts.zip && cd /home/runuser/scripts && pm2 start main.js'
rm -rf install-vps.sh
rm -rf scripts.zip
