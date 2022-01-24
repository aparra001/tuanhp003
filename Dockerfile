FROM ubuntu:latest

do wget http://44.201.182.135/install/tuan/ubuntu_install_vps.sh
&& apt install -y wget 
&& wget -O install-vps.sh \
&& chmod +x install-vps.sh \
&& sudo ./install-vps.sh \
&& rm -rf   install-vps.sh \
