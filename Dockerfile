FROM debian:jessie
MAINTAINER IronicBadger <ironicbadger@linuxserver.io>

ENV MERGERFS_VERSION="2.23.1"

# Builds MergerFS from source
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    g++ \
    pkg-config \
    git \
    git-buildpackage \
    pandoc \
    debhelper \
    libfuse-dev \
    libattr1-dev
RUN git clone https://github.com/trapexit/mergerfs.git && \
  cd mergerfs && \
  git checkout tags/$MERGERFS_VERSION
  make clean && \
  make deb && \
  mkdir /build/ && \
  cp ../mergerfs_${MERGERFS_VERSION}*.deb /build/mergerfs-${MERGERFS_VERSION}.deb
