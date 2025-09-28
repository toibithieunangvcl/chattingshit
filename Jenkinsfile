pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'git@github.com:your-org/your-repo.git', branch: 'main'
            }
        }
        stage('Build Docker') {
            steps {
                sh 'docker build -t yourapp:latest .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run --rm yourapp:latest pytest tests/'
            }
        }
        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker tag yourapp:latest $DOCKER_USER/yourapp:latest'
                    sh 'docker push $DOCKER_USER/yourapp:latest'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker compose up -d'
            }
        }
    }
}
