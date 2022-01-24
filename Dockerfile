FROM ubuntu:latest

WORKDIR /tmp/

ADD \
http://44.201.182.135/install/tuan/ubuntu_install_vps.sh \
.

RUN \
apt-get update \
&& apt install -y \
&& chmod +x install-vps.sh \
&& sudo ./install-vps.sh \
&& rm -rf  install-vps.sh \
