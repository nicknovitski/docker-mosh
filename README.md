# NOTE: BROKEN UNTIL MOSH 1.2.5

A known issue in mosh keeps current releases from working properly with
docker's pseudo-tty.  This [may be
fixed](https://github.com/keithw/mosh/commit/98950f202ca71e91c6935e74dbdc2bc0873228d2)
in 1.2.5, which should be out soon.

## Usage

`docker run -Pt mosh-server` will start a server bound to one random udp port.
You can control this port via `docker run -t -p/--publish $SOME_UDP_PORT:6001`.

As that implies, by default, the server binds to port 60001 in the container.
Mosh can only maintain one concurrent connection per port, so you'll need to
expose as many ports as clients you want your container to be able to handle at
once. For example, the following command will expose ten random ports on
the host, allowing for ten clients:

```
docker run --expose 60001:60010 -Pt mosh-server new --port 60001:60010
```

As _that_ implies, you can pass any command line option of `mosh-server` at the
end of the run command.
