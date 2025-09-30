pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials2')
        IMAGE_NAME = "your-dockerhub-username/streamlit-app"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${IMAGE_NAME}:latest .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    sh "echo ${DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${DOCKER_HUB_CREDENTIALS_USR} --password-stdin"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'docker push ${IMAGE_NAME}:latest'
                }
            }
        }
    }
}
