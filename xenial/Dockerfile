FROM munken/root:xenial-root6

RUN apt-get update && apt-get install -y --no-install-recommends \
    libqt4-dev gdb curl g++ \
    && rm -rf /var/lib/apt/lists/*

ENV GO4_VERSION="5.1.2"
ENV GO4_DL="http://web-docs.gsi.de/~go4/download/go4-${GO4_VERSION}.tar.gz"
ENV GO4_DIR="/source/go4-$GO4_VERSION" 

RUN mkdir /source \
  && curl ${GO4_DL} \
  | tar -xzC /source \
  && make -C $GO4_DIR \
  && rm -rf $GO4_DIR/Go4*/*.[do] $GO4_DIR/Go4*/*.cxx


ENV GO4SYS=$GO4_DIR
ENV PATH=$GO4_DIR/bin:$PATH
ENV PYTHONPATH=$GO4_DIR/python:$PYTHONPATH
ENV LD_LIBRARY_PATH=.:$GO4_DIR/lib:$LD_LIBRARY_PATH
