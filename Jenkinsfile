pipeline {
    agent any

    environment {
        DOCKER_PATH = 'C:\\Program Files\\Docker\\Docker\\resources\\bin'
        TERRAFORM_PATH = 'C:\\Program Files\\terraform_1.11.4_windows_amd64'
        AZURE_CLI_PATH = 'C:\\Program Files\\Microsoft SDKs\\Azure\\CLI2\\wbin'
        GIT_PATH = 'C:\\Program Files\\Git\\cmd'
        PATH="${DOCKER_PATH};${TERRAFORM_PATH};${AZURE_CLI_PATH};${GIT_PATH};${PATH}"  

        DOCKERHUB_USERNAME = 'atishayjain01'
        DOCKERHUB_CREDENTIALS_ID = 'dockerhub-credentials-id'   // Jenkins credentials ID
        IMAGE_NAME = 'cloud-assessment'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Atishay-Jain01/CloudAssessment.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %DOCKERHUB_USERNAME%/%IMAGE_NAME%:%IMAGE_TAG% ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                bat "docker push %DOCKERHUB_USERNAME%/%IMAGE_NAME%:%IMAGE_TAG%"
            }
        }
    }

    post {
        success {
            echo 'Docker image built and pushed to Docker Hub successfully!'
        }
        failure {
            echo 'Failed.'
        }
    }
}
