pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checks out the repository
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Output the plan for logging purposes
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply the Terraform plan
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            // Add steps to clean up or send notifications here
            echo 'Build finished.'
        }
        success {
            // Actions to perform on success
            echo 'Deployment successful!'
        }
        failure {
            // Actions to perform if the build fails
            echo 'Deployment failed.'
        }
    }
}
