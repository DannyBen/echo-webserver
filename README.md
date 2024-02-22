# Echo Webserver

![Version](https://img.shields.io/badge/version-0.2.0-blue.svg)

[Source on GitHub][1] | [Image on Docker Hub][2]

---

This is a simple webserver that echoes the request information back.

## Usage

    $ docker run --rm -p 3000:3000 dannyben/echo

## Advanced Usage

If you want to use the development (non-docker) version:

1. Clone the repository
2. Run `bundle` to install dependencies
3. Run `rackup -p 3000 -o 0.0.0.0`


---

[1]: https://github.com/DannyBen/echo-webserver
[2]: https://hub.docker.com/r/dannyben/echo/
