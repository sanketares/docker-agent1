pipeline {
    agent {
        docker {
            image 'hashicorp/terraform'
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
                git branch: 'main', url: 'https://github.com/sanketares/docker2.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
    
}
