#
# host system for DevOps work
#
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'
ENV CI 1

RUN apt-get update --fix-missing && apt-get dist-upgrade -y \
    && apt-get -y install \
       apt-utils \
       sudo \
       wget \
       python3 \
       python3-pip \
       python3-wheel \
       python3-setuptools \
       pkg-config \
       gcc-10 \
       g++-10 \
       git \
       ccache \
       cppcheck \
       libncurses5-dev \
       libncursesw5-dev \
       && rm -rf /var/lib/apt/lists/*

RUN wget http://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list && \
    wget -qO - https://dlang.org/d-keyring.gpg | sudo apt-key add - && \
    apt-get install dmd-bin

RUN pip3 -q install --upgrade pip \
    && python3 -m pip -q install \
       meson==0.62.0 \
       scan-build==2.0.19 \
       ninja==1.10.2 \
       cmake==3.21.2
