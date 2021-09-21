#
# host system for DevOps work
#
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'
ENV CI 1

ADD builder.py .

RUN python builder.py
