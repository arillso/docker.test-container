FROM debian:buster

LABEL "org.opencontainers.image.vendor"="arillso" \
    "org.opencontainers.image.licenses"="MIT" \
    "org.opencontainers.image.url"="https://github.com/arillso/docker.container" \
    "org.opencontainers.image.documentation"="https://github.com/arillso/docker.container" \
    "org.opencontainers.image.source"="https://github.com/arillso/docker.test-container"

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y systemd systemd-sysv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]
