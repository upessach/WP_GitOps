pipeline {
    // ... other stages ...

    stage('Verification') {
        steps {
            script {
                // Add commands to verify your setup here
                sh 'curl http://localhost:10000'
            }
        }
    }

    // Comment out or remove the cleanup stage to keep the infrastructure running
    // stage('Cleanup') {
    //     steps {
    //         script {
    //             sh 'terraform destroy -auto-approve'
    //         }
    //     }
    // }

    post {
        always {
            // Add any post-build actions here
        }
    }
}
z