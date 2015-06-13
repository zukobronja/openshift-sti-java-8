
# openshift/base-centos7
FROM openshift/base-centos7

ENV STI_NODEJS_VERSION 0.10

USER root
RUN yum install -y java-1.8.0-openjdk-headless maven ; yum clean all -y


# TODO (optional): Copy the builder files into /opt/openshift
# COPY ./<builder_folder>/ /opt/openshift/

COPY ./.sti/bin/ /usr/local/sti/
RUN chmod a+x /usr/local/sti/*

EXPOSE 8080
