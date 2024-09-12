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
            agent {
                docker {
                    image 'terraform-image:latest'
                    args '-v /var/lib/jenkins/workspace:/workspace' // Mount Jenkins workspace
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
