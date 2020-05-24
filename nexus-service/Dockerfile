FROM raspbian/stretch:latest

RUN apt-get update && \
	apt-get install -y cmake git cmake libmosquittopp-dev autoconf libtool autoconf-archive pkg-config python3-dev build-essential

WORKDIR /src
RUN wget https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/snapshot/libgpiod-1.1.1.tar.gz
RUN tar xvf libgpiod-1.1.1.tar.gz
RUN cd libgpiod-1.1.1 && export PYTHON_VERSION=3 && ./autogen.sh --enable-tools=yes --enable-bindings-python --prefix=/usr/local && make && make install && ldconfig
#RUN cd .. && git clone https://github.com/aquaticus/nexus433
RUN cd .. && git clone https://github.com/StalkerSVR/nexus433
RUN mkdir release && cd release 
RUN cmake ../nexus433 -DCMAKE_BUILD_TYPE=RELEASE -DBOARD=RASPBERRYPI
RUN make
RUN make install

RUN apt-get update && \
      apt-get -y install sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
USER docker

# CMD ["nexus433", "--verbose","-n", "17"] 
CMD sudo service nexus start && tail -F /var/log/mysql/error.log
