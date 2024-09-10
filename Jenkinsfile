pipeline {
    agent {
        docker {
            image 'sanket406/terraform-docker'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
