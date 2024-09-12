pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Define the Docker image name and tag
                    def imageName = 'terraform-img'
                    def imageTag = 'latest'

                    // Build the Docker image
                    docker.build("${imageName}:${imageTag}", "-f Dockerfile .")
                }
            }
        }

        stage('Run Terraform') {
            agent {
                docker {
                    // Define the Docker image name and tag to run the container
                    image 'terraform-img:latest'
                    args '-v /workspace:/workspace'
                }
            }
            steps {
                script {
                    // Run Terraform commands inside the Docker container
                    sh 'terraform init'
                    sh 'terraform plan'
                    sh 'terraform apply -auto-approve'
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
