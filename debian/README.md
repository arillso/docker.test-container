# Debian image with systemd enabled

You can use this image as a base container to run systemd services inside.

## Supported tags

- `sid`
- `11`
- `10`, `latest`

## Usage

1. Run the container as a daemon

   `docker run -d --name systemd-debian --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/systemd-debian`

   or if it doesn't work

   `docker run -d --name systemd-debian --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/systemd-debian`

2. Enter to the container

   `docker exec -it systemd-debian sh`

3. Remove the container

   `docker rm -f systemd-debian`
