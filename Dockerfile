FROM munken/root:trusty-root6

RUN apt-get update && apt-get install -y --no-install-recommends \
    libqt4-dev gdb curl \
    && rm -rf /var/lib/apt/lists/*

ENV GO4_VERSION="5.1.2"
ENV GO4_DL="http://web-docs.gsi.de/~go4/download/go4-${GO4_VERSION}.tar.gz"

RUN mkdir /go4 \
  && curl ${GO4_DL} \
  | tar -xzC /go4 \
  && make -C /go4/go4-$GO4_VERSION
