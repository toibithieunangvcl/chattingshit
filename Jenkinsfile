pipeline {
    agent any

    environment {
        DOCKER_USER = credentials('dockerhub-user')   // username trong Jenkins Credentials
        DOCKER_PASS = credentials('dockerhub-pass')   // password/token trong Jenkins Credentials
        IMAGE_NAME = "toibithieunangvcl/myapp"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/your-username/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh """
                    docker build -t $IMAGE_NAME:\${BUILD_NUMBER} .
                    docker tag $IMAGE_NAME:\${BUILD_NUMBER} $IMAGE_NAME:latest
                    """
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh """
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push $IMAGE_NAME:\${BUILD_NUMBER}
                    docker push $IMAGE_NAME:latest
                    """
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh """
                    kubectl set image deployment/myapp-deployment myapp-container=$IMAGE_NAME:\${BUILD_NUMBER} --record
                    kubectl rollout status deployment/myapp-deployment
                    """
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deploy thành công!"
        }
        failure {
            echo "❌ Build/Deploy thất bại!"
        }
    }
}
