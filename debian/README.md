# Debian image for ansible molecule tests

These are test containers for ansible molecule tests.

## Supported tags

- `11`
- `10`

## Usage

1. Run the container as a daemon

   `docker run -d --name debian --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/debian`

   or if it doesn't work

   `docker run -d --name debian --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/debian`

2. Enter to the container

   `docker exec -it debian sh`

3. Remove the container

   `docker rm -f debian`
