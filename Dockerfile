FROM jenkins/jenkins:lts-jdk11

USER root

# Install docker CLI inside Jenkins
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*

# Switch back to Jenkins user
USER jenkins
