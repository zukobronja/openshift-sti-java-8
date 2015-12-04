FROM openshift/base-centos7

ENV STI_JAVA8_VERSION 0.1

USER root

# Some proxies will get in the way here, so increasing to avoid time out errors
RUN echo "timeout=120" >> /etc/yum.conf
# And some proxies does https man in the middle :(
RUN (cd /etc/yum.repos.d && grep -rl https | xargs sed -i 's/https\:/http\:/g')
RUN yum install -y java-1.8.0-openjdk-headless maven && yum clean all -y

COPY ./.sti/bin/ /usr/libexec/s2i
RUN chmod a+x /usr/libexec/s2i/*

USER 1001

EXPOSE 8080
