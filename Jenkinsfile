pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Cleanup Docker') {
            steps {
                script {
                    sh 'docker stop nginx_test || true'
                    sh 'docker rm nginx_test || true'
                    sh 'docker rmi nginx:latest || true'
                }
            }
        }
        stage('Terraform Destroy') {
            steps {
                script {
                    dir('terraform') {
                        sh 'terraform init'
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Build Completed'
        }
    }
}
