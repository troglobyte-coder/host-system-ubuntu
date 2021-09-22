#
# host system for DevOps work
#
FROM ubuntu:20.04 AS dummy

ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'
ENV CI 1

RUN apt-get update --fix-missing && apt-get dist-upgrade -y \
    && apt-get -y install \
       apt-utils \
       python3 \
       python3-pip \
       python3-wheel \
       python3-setuptools \
       pkg-config \
       gcc-10 \
       g++-10 \
       default-jdk \
       default-jre \
       git \
       ccache \
       cppcheck \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 -q install --upgrade pip \
    && python3 -m pip -q install \
       meson==0.59.0 \
       scan-build==2.0.19 \
       ninja==1.10.2 \
       cmake==3.21.2 \
       pytest==6.2.5 \
       pytest-mock==3.6.1 \
       pytest-xdist==2.3.0 \
       pytest-benchmark==3.4.1
