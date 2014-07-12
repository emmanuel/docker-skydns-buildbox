# SkyDNS build-box Dockerfile

This is my (likely janky) cross-platform build container to build [SkyDNS](https://github.com/skynetservices/skydns) for Linux on x86-64. Build it on my OS X machine via `boot2docker`, that is.

In other words, the whole point of this Dockerfile is to produce a SkyDNS binary.

# Usage

Pull in the git submodules:

```bash
git submodule update --init
```

Pull in the SkyDNS dependencies:

``` bash
cd skydns-src
go get -d -v ./...
```

Build the container:

``` bash
export BUILDBOX_NAME=`whoami`/skydns-buildbox:0.0.1
docker build -t $BUILDBOX_NAME .
docker run -i -t $BUILDBOX_NAME /bin/bash
```

Meanwhile, in another shell:

``` bash
docker ps
# find the build box container ID in the list, then copy out the binary
docker cp $BUILDBOX_CONTAINER_ID:/skydns ./path/to/where/you/want/skydns-binary
```

And that's about it.