
FROM centos:7

MAINTAINER cl4y <leecode@qq.com>




RUN mkdir -p /opt/steam /var/lib/steam \
 && adduser steam \
 && curl --silent --show-error --fail --location --header "Accept: application/tar+gzip, application/gzip, application/octet-stream" -o - \
        https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
    | tar --no-same-owner -xz -C /opt/steam/ \
 && mkdir -p /home/steam/.steam/sdk32/steamclient.so \
 && ln -s /opt/steam/linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so \
 && chown -R steam:steam /opt/steam /var/lib/steam \
 && chmod 0755 /opt/steam/linux32/steamcmd



RUN yum update -y; yum -y install glibc.i686 libstdc++.i686 net-tools

RUN /opt/steam/steamcmd.sh +quit; rm -rf /root/.steam/logs/* /tmp/*


EXPOSE 27015/udp

RUN /opt/steam/steamcmd.sh +login anonymous +force_install_dir /home/steam/insurgency +app_update 237410 validate +quit &&\
	chown -R steam /home/steam/insurgency

WORKDIR /home/steam/insurgency

USER steam

ENTRYPOINT ["./srcds_run", "-game", "insurgency", "-console"]


