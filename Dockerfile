#
# cFS docker Development/runtime image
#

FROM ubuntu:latest
LABEL Description="cFS Bundle development Docker image"
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

RUN apt-get update && \
    #
    # Install tools and libraries
    #
    apt-get install -y \
       apt-utils build-essential \
       vim git cmake \
       bison flex texinfo bzip2 \
       xz-utils unzip python wget pax \
       libexpat1-dev \
       libpython2.7-dev zlib1g-dev libtinfo-dev && \
     rm -rf /var/lib/apt/lists/* && \
     cd / && \
     git clone https://github.com/nasa/cFS.git && \
     cd cFS && \
     git submodule init && \
     git submodule update && \
     cp cfe/cmake/Makefile.sample Makefile && \
     cp -a cfe/cmake/sample_defs .

# Expose CI_LAB and TO_LAB port
EXPOSE 1234 
EXPOSE 1235 
