FROM jenkins/jenkins:lts-jdk11

USER root

# Install docker CLI inside Jenkins
RUN apt-get update && apt-get install -y \
    curl \
    docker.io \
    git \
    && curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

USER jenkins
