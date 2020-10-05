# Docker Test image

## Description

You can use this images as base containers to run systemd services inside.

## Usage

1. Run the container as a daemon

   `docker run -d --name systemd --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/$IMAGE`

   or if it doesn't work

   `docker run -d --name systemd --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro arillso/$IMAGE`

2. Enter to the container

   `docker exec -it systemd sh`

3. Remove the container

   `docker rm -f systemd`

## License

<!-- markdownlint-disable -->

This project is under the MIT License. See the [LICENSE](https://sbaerlo.ch/licence) file for the full license text.

<!-- markdownlint-enable -->

## Copyright

(c) 2020, Arillso
