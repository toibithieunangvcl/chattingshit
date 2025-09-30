pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('79459502-31ae-4974-aab4-8537a9cc7166')
        DOCKER_HUB_REPO = "your-dockerhub-username"
    }

    stages {
        stage('Login to Docker Hub') {
            steps {
                script {
                    sh """
                    echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin
                    """
                }
            }
        }
        
        stage('Build and Push Streamlit') {
            steps {
                sh """
                docker build -t $DOCKER_HUB_REPO/streamlit-app:latest -f Dockerfile.streamlit .
                docker push $DOCKER_HUB_REPO/streamlit-app:latest
                """
            }
        }
        
        stage('Build and Push Nginx') {
            steps {
                sh """
                docker build -t $DOCKER_HUB_REPO/nginx-proxy:latest -f Dockerfile.nginx .
                docker push $DOCKER_HUB_REPO/nginx-proxy:latest
                """
            }
        }
    }
}
