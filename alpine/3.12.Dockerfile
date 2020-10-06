FROM alpine:3.12

LABEL "org.opencontainers.image.vendor"="arillso" \
    "org.opencontainers.image.licenses"="MIT" \
    "org.opencontainers.image.url"="https://github.com/arillso/docker.container" \
    "org.opencontainers.image.documentation"="https://github.com/arillso/docker.container" \
    "org.opencontainers.image.source"="https://github.com/arillso/docker.test-container"

RUN apk --update --no-cache add \
    openrc \
    python3 \
    sudo \ 
    bash \
    ca-certificates \
    && mkdir -p /run/openrc \
    && touch /run/openrc/softlevel \
    # Disable getty's
    && sed -i 's/^\(tty\d\:\:\)/#\1/g' /etc/inittab \
    && sed -i \
    # Change subsystem type to "docker"
    -e 's/#rc_sys=".*"/rc_sys="docker"/g' \
    # Allow all variables through
    -e 's/#rc_env_allow=".*"/rc_env_allow="\*"/g' \
    # Start crashed services
    -e 's/#rc_crashed_stop=.*/rc_crashed_stop=NO/g' \
    -e 's/#rc_crashed_start=.*/rc_crashed_start=YES/g' \
    # Define extra dependencies for services
    -e 's/#rc_provide=".*"/rc_provide="loopback net"/g' \
    /etc/rc.conf \
    # Remove unnecessary services
    && rm -f /etc/init.d/hwdrivers \
    /etc/init.d/hwclock \
    /etc/init.d/hwdrivers \
    /etc/init.d/modules \
    /etc/init.d/modules-load \
    /etc/init.d/modloop \
    # Can't do cgroups
    && sed -i 's/cgroup_add_service /# cgroup_add_service /g' /lib/rc/sh/openrc-run.sh \
    && sed -i 's/VSERVER/DOCKER/Ig' /lib/rc/sh/init.sh

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/sbin/init"]
