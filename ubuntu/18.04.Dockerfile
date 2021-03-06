FROM ubuntu:18.04

LABEL "org.opencontainers.image.vendor"="arillso" \
    "org.opencontainers.image.licenses"="MIT" \
    "org.opencontainers.image.url"="https://github.com/arillso/docker.container" \
    "org.opencontainers.image.documentation"="https://github.com/arillso/docker.container" \
    "org.opencontainers.image.source"="https://github.com/arillso/docker.test-container"

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y \
    systemd \
    systemd-sysv \
    python3 \
    sudo \
    bash \
    ca-certificates \
    iproute2 \
    python3-apt \
    aptitude \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /lib/systemd/system/sysinit.target.wants/ \
    && ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/* \
    /lib/systemd/system/plymouth* \
    /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]
