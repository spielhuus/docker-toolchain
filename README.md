## This repository holds a docker recipe for the gnu toolchain.

[![Build Status](https://travis-ci.org/spielhuus/docker-toolchain.svg?branch=master)](https://travis-ci.org/spielhuus/docker-toolchain)
[![GitHub version](https://badge.fury.io/gh/spielhuus%2Ftoolchain.svg)](https://hub.docker.com/r/spielhuus/toolchain)

[Docker](https://docker.io) recipe for [gnu toolchain](https://de.wikipedia.org/wiki/GNU_Toolchain) project

### Create and start the image.

```
docker pull spielhuus/toolchain
docker run --name toolchain -v $(pwd):/repo spielhuus/toolchain
```

### Credits:

* https://docker.io
* https://www.gnu.org


### License

[Boost Software License](http://www.boost.org/LICENSE_1_0.txt) - Version 1.0 - August 17th, 2003
