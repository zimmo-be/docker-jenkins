FROM jenkins:1.651.3

USER root

RUN apt-get update \
    && apt-get install -y sudo \
    && rm -rf /var/lib/apt/lists/* \
    && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

COPY plugins.txt /var/jenkins_home/
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt