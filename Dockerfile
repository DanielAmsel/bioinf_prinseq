FROM ubuntu:20.04

ADD https://downloads.sourceforge.net/project/prinseq/standalone/prinseq-lite-0.20.4.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fprinseq%2Ffiles%2Fstandalone%2Fprinseq-lite-0.20.4.tar.gz%2Fdownload&ts=1589870420 /tmp/prinseq.tar.gz

RUN set -e \
      && ln -sf bash /bin/sh

RUN set -e \
      && apt-get -y update && apt-get -y dist-upgrade \
      && apt-get -y install perl 

RUN set -e \
      && tar xvf /tmp/prinseq.tar.gz -C /usr/local/src --remove-files \
      && mv /usr/local/src/prinseq-* /usr/local/src/prinseq \
      && chmod +x /usr/local/src/prinseq/*.pl \
      && find /usr/local/src/prinseq -maxdepth 1 -type f -executable \
        -exec ln -s {} /usr/local/bin \;
