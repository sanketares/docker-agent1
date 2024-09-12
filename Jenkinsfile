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
                    echo 'build done'
                }
            }
        }

        stage('Run Terraform') {
            agent {
                docker {
                    image 'terraform-image:latest'
                    args '-v /var/lib/jenkins/workspace:/workspace' // Mount Jenkins workspace
                    echo 'agent configure'
                }
            }
            steps {
                script {
                    sh 'terraform init'
                    echo 'completed'
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
