FROM reg.cismet.de/abstract/cids-distribution:8.2.1-debian

ARG IMAGE_VERSION=unknown

ENV GIT_DISTRIBUTION_PROJECT=cismet/cids-distribution-wrrl-db-mv
ENV CIDS_ACCOUNT_EXTENSION wrrl-db-mv
ENV UPDATE_SNAPSHOTS -U -Dmaven.clean.failOnError=false -Dmaven.test.skip=true
ENV TSA_SERVER=http://sha256timestamp.ws.symantec.com/sha256/timestamp

ENV TZ=Europe/Berlin
ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE:de
ENV LC_ALL de_DE.UTF-8

# needed for the report generation stuff to work in a headless environment
RUN apt-get update && \
   apt-get install -y xvfb libxrender1 libxtst6 && \
   apt-get clean

LABEL maintainer="Jean-Michel Ruiz <jean.ruiz@cismet.de>" \
   de.cismet.cids.distribution.name="${GIT_DISTRIBUTION_PROJECT}" \
   de.cismet.cids.distribution.description="cids WRRL-DB-MV Distribution Runtime Image" \
   de.cismet.cids.distribution.version="${IMAGE_VERSION}" 

