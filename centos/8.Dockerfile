FROM centos:8

LABEL "org.opencontainers.image.vendor"="arillso" \
    "org.opencontainers.image.licenses"="MIT" \
    "org.opencontainers.image.url"="https://github.com/arillso/docker.container" \
    "org.opencontainers.image.documentation"="https://github.com/arillso/docker.container" \
    "org.opencontainers.image.source"="https://github.com/arillso/docker.test-container"

ENV container docker

RUN cd /lib/systemd/system/sysinit.target.wants/; \
    for i in *; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i; done

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/*

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
