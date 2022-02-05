# Alpine image for ansible molecule tests

These are test containers for ansible molecule tests.

## Supported tags

- `3.15`

## Usage

1. Run the container as a daemon

   `docker run -d --name alpine --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/alpine`

   or if it doesn't work

   `docker run -d --name alpine --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/alpine`

2. Enter to the container

   `docker exec -it alpine sh`

3. Remove the container

   `docker rm -f alpine`
