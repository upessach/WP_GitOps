pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Check out the code from your Git repository
                checkout scm
            }
        }

        stage('Initialize Terraform') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                script {
                    // Apply Terraform configuration
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Verification') {
            steps {
                script {
                    // Add commands to verify your setup here
                    // For example, a simple cURL request to the Nginx server
                    sh 'curl http://localhost:10000'
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Optional: Remove Terraform-managed infrastructure
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }

    post {
        always {
            // Add any post-build actions here
            // For example, sending notifications or cleaning up workspace
        }
    }
}
