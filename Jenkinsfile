pipeline {
    agent {
        docker {
            image 'my-custom-terraform:latest' // Use your custom Docker image

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
