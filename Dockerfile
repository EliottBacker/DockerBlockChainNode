FROM debian:jessie

MAINTAINER Eliott BACKER "eliott.backer@gmail.com"

ENV PACKAGE_NAME multichain-1.0-beta-1

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
  && apt-get upgrade -yqq \
  && apt-get dist-upgrade -yqq \
  && apt-get install -yqq wget curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && cd /tmp \
  && wget http://www.multichain.com/download/${PACKAGE_NAME}.tar.gz \
  && tar -xvzf ${PACKAGE_NAME}.tar.gz \
  && cd ${PACKAGE_NAME} \
  && mv multichaind multichain-cli multichain-util /usr/local/bin \
  && cd /tmp \
  && rm -Rf multichain*

CMD ["/bin/bash"]
