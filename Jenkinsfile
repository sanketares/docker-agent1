pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:latest' // Use the latest Terraform Docker image
            label 'terraform-agent'
            args '-entrypoint=""' // Disable the default entrypoint
        }
    }
    stages {
        stage('Check Terraform Version') {
            steps {
                script {
                    // Check the Terraform version inside the Docker container
                    sh 'terraform --version'
                }
            }
        }
    }
}
