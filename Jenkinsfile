pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Initialize Terraform') {
            steps {
                script {
                    sh 'cd terraform && terraform init'
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                script {
                    sh 'cd terraform && terraform apply -auto-approve'
                }
            }
        }

        stage('Verification') {
            steps {
                script {
                    sh 'curl http://localhost:10000'
                }
            }
        }

        // Comment out or remove the cleanup stage to keep the infrastructure running
        // stage('Cleanup') {
        //     steps {
        //         script {
        //             sh 'cd terraform && terraform destroy -auto-approve'
        //         }
        //     }
        // }
    }

    post {
        always {
            echo 'Build Completed'
            // Add any post-build actions here
        }
    }
}
