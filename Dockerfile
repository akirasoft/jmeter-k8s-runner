FROM vmarrazzo/jmeter:latest
RUN apk add --update --no-cache \
    ca-certificates \
    wget 

# kubectl
ARG KUBE_VERSION=1.14.1
RUN wget -q https://storage.googleapis.com/kubernetes-release/release/v$KUBE_VERSION/bin/linux/amd64/kubectl -O /bin/kubectl && \
  chmod +x /bin/kubectl
