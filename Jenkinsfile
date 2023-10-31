pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
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
