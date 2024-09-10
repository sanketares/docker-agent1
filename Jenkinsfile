pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'sanket406/terraform-image:latest'
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Ensure Docker is installed on Jenkins agent
                    docker.build(DOCKER_IMAGE, '.')
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        docker.image(DOCKER_IMAGE).push('latest')
                    }
                }
            }
        }

        stage('Terraform Init') {
            agent {
                docker {
                    image DOCKER_IMAGE
                    args '-v /var/lib/jenkins/terraform:/workspace' // Optional: for mounting volumes
                }
            }
            steps {
                script {
                    // Ensure Terraform init is run
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    // Run Terraform plan
                    sh 'terraform plan'
                }
            }
        }
    }

    post {
        always {
            // Archive the Terraform plan output or other artifacts if needed
            // archiveArtifacts artifacts: '**/*.tfplan', allowEmptyArchive: true
        }
    }
}
