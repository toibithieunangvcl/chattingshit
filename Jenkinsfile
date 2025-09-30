pipeline {
    agent any

    environment {
        IMAGE_NAME = "toibithieunangvcl/streamlit-app"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME%:latest ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials2', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                bat "docker push %IMAGE_NAME%:latest"
            }
        }
    }
}
