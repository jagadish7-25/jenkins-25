pipeline {
    agent { label 'agent-1' }

    environment {
        AWS_ACCOUNT_ID = '993268716422'
        AWS_REGION = 'us-east-1'
        IMAGE_NAME = 'roboshop/catalogue'
    }

    stages {
        stage('Monitor Server') {
            steps {
                echo "Starting server monitoring on agent-1..."
                sh 'echo "Checking server health on agent-1"'
                sh 'uptime'
            }
        }

        stage('Ports Check') {
            steps {
                echo "Checking open ports on agent-1..."
                sh 'ss -lntp'
                sh 'env'
            }
        }

        stage('Docker Build & Push') {
            steps {
                withAWS(region: "${AWS_REGION}", credentials: 'aws-creds') {
                    sh """
                        aws ecr get-login-password --region ${AWS_REGION} | \
                        docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

                        docker build -t ${IMAGE_NAME} .

                        docker tag ${IMAGE_NAME}:latest \
                        ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}:latest

                        docker push \
                        ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}:latest

                        docker images
                    """
                }
            }
        }
    }

    post {
        always {
            echo "Monitoring complete"
            cleanWs()
        }
        failure {
            echo "Monitoring failed. Please check logs."
        }
        success {
            echo "Monitoring succeeded. Server is healthy."
        }
    }
}