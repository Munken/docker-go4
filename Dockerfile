FROM munken/root:trusty-root6

RUN apt-get update && apt-get install -y --no-install-recommends \
    libqt4-dev gdb curl \
    && rm -rf /var/lib/apt/lists/*

ENV GO4_VERSION="5.1.2"
ENV GO4_DL="http://web-docs.gsi.de/~go4/download/go4-${GO4_VERSION}.tar.gz"
ENV GO4_DIR="/source/go4-$GO4_VERSION" 

RUN mkdir /source \
  && curl ${GO4_DL} \
  | tar -xzC /source \
  && make -C $GO4_DIR \
  && rm -rf $GO4_DIR/Go4*/*.[do] $GO4_DIR/Go4*/*.cxx


ENV GO4SYS=/source/go4-5.1.2
ENV PATH=/source/go4-5.1.2/bin:$PATH
ENV PYTHONPATH=/source/go4-5.1.2/python:$PYTHONPATH
ENV LD_LIBRARY_PATH=.:/source/go4-5.1.2/lib:$LD_LIBRARY_PATH
