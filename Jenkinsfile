pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')     // Your AWS creds in Jenkins
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/ajit010/Terraform-Jenkins.git',
                    credentialsId: 'github-credentials-id'
            }
        }

        stage('Terraform Init') {
            steps {
                echo 'Initializing Terraform...'
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo 'Planning Terraform changes...'
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                echo 'Applying Terraform changes...'
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs.'
        }
    }
}
