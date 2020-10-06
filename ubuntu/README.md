# Ubuntu image for ansible molecule tests

These are test containers for ansible molecule tests.

## Supported tags

- `20.04`, `latest`
- `18.04`
- `16.04`

## Usage

1. Run the container as a daemon

   `docker run -d --name ubuntu --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/ubuntu`

   or if it doesn't work

   `docker run -d --name ubuntu --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/ubuntu`

2. Enter to the container

   `docker exec -it ubuntu sh`

3. Remove the container

   `docker rm -f ubuntu`
