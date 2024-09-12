pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = 'terraform-image'
                    def imageTag = 'latest'

                    // Build the Docker image
                    docker.build("${imageName}:${imageTag}", "-f Dockerfile .")
                }
            }
        }

        stage('Run Terraform') {
            steps {
                script {
                    // Run Terraform commands inside the Docker container
                    // Override ENTRYPOINT to use /bin/sh for debugging or other purposes
                    docker.image('terraform-image:latest').inside('-entrypoint /bin/sh') {
                        // Execute Terraform commands
                        sh 'terraform init'
                        sh 'terraform plan'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace or perform other post-build actions
            cleanWs()
        }
    }
}
