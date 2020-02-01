FROM alpine:3.9

ARG JMETER_VERSION="5.2.1"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN	${JMETER_HOME}/bin
ENV	JMETER_DOWNLOAD_URL  https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

RUN apk add --update --no-cache \
    ca-certificates \
    coreutils \
    curl \
    nss \
    openjdk8-jre \
    unzip \
    wget \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /tmp/dependencies \
    && curl -L --silent ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
    && mkdir -p /opt \
    && tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
    && rm -rf /tmp/dependencies

ENV PATH $PATH:$JMETER_BIN

# kubectl
ARG KUBE_VERSION=1.14.1
RUN wget -q https://storage.googleapis.com/kubernetes-release/release/v$KUBE_VERSION/bin/linux/amd64/kubectl -O /bin/kubectl && \
  chmod +x /bin/kubectl
CMD ["/bin/sh"]
