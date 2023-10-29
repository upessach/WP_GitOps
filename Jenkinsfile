pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Check out the code from your Git repository
                checkout scm
            }
        }

        stage('Initialize and Apply Terraform') {
            steps {
                script {
                    // Change to the Terraform directory
                    dir('terraform') {
                        // Initialize and Apply Terraform configuration
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Verification') {
            steps {
                script {
                    // Assuming the Nginx server is accessible on localhost:10000
                    // This might need to change based on your networking setup
                    sh 'curl http://localhost:10000'
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Change to the Terraform directory
                    dir('terraform') {
                        // Destroy Terraform-managed infrastructure
                        sh 'terraform destroy -auto-approve'
                    }
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
