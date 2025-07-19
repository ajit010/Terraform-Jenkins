pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                    branches: [[name: 'main']], // or '*/master'
                    userRemoteConfigs: [[
                        url: 'https://github.com/ajit010/Terraform-Jenkins.git',
                        credentialsId: 'github-credentials-id'
                    ]]
                ])
            }
        }
    
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Format and Validate') {
            steps {
                sh 'terraform fmt'
                sh 'terraform validate'
            }
        }
        
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
