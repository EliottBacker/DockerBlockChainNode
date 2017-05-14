FROM eliottbacker/debian-ssh

MAINTAINER Eliott BACKER "eliott.backer@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update

# install multichain
RUN cd /tmp && \
  wget http://www.multichain.com/download/multichain-1.0-beta-1.tar.gz && \
  tar -xvzf multichain-1.0-beta-1.tar.gz && \
  cd multichain-1.0-beta-1 && \
  mv multichaind multichain-cli multichain-util /usr/local/bin && \
  cd /tmp && \
  rm -Rf multichain*

VOLUME [ "/opt/chains" ]

EXPOSE 8333 8332 18333 18332

ENTRYPOINT [ "/usr/local/bin/multichaind", "-datadir=/opt/chains" ]

