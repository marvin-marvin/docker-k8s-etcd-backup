FROM marvinmarvin/docker-k8s-rclone
ARG ETCD_VERSION=3.3.10
RUN apt-get update -y && \
    apt-get install wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN wget -q https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz && \
    tar xzvf etcd-v${ETCD_VERSION}-linux-amd64.tar.gz && \
    mv etcd-v${ETCD_VERSION}-linux-amd64/etcd* /bin/ && \
    rm -Rf etcd-v${ETCD_VERSION}-linux-amd64*
RUN mkdir /root/etcd-backup
