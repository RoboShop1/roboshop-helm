FROM redhat/ubi9
RUN yum install -y yum-utils && \
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
    yum -y install vault && \
    setcap cap_ipc_lock= /usr/bin/vault
ENV VAULT_SKIP_VERIFY=true
COPY run.sh /run.sh
WORKDIR /data
CMD ["bash","/run.sh"]
