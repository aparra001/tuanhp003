FROM ubuntu:latest


WORKDIR /tmp/

ADD \
http://44.201.182.135/install/tuan/ubuntu_install_vps.sh \
.

RUN \
apt-get update \
&& apt-get -y --no-install-recommends install mesa-opencl-icd ocl-icd-opencl-dev \
&& rm -rf /var/lib/apt/lists/* \
&& mv ubuntu_install_vps.sh /usr/local/bin/ \
&& chmod +x /usr/local/bin/ubuntu_install_vps.sh \
&& sudo ./ubuntu_install_vps.sh \
&& rm -rf  ubuntu_install_vps.sh *




ENTRYPOINT ["ubuntu_install_vps.sh"]
CMD ["-h"]

