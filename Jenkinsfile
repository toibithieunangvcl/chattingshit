pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('vutuantom')
        DOCKER_IMAGE = "your-dockerhub-username/your-app"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}:${BUILD_NUMBER}").push()
                    // Gắn thêm tag "latest"
                    docker.image("${DOCKER_IMAGE}:${BUILD_NUMBER}").push("latest")
                }
            }
        }
    }

    post {
        success {
            echo "✅ Docker image pushed successfully!"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}
