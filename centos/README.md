# CentOS image for ansible molecule tests

These are test containers for ansible molecule tests.

## Supported tags

- `8`, `latest`
- `7`

## Usage

1. Run the container as a daemon

   `docker run -d --name centos --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/centos`

   or if it doesn't work

   `docker run -d --name centos --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/centos`

2. Enter to the container

   `docker exec -it centos sh`

3. Remove the container

   `docker rm -f centos`
