pipeline {
    agent { label 'agent-1' }
    
    stages {
        stage('Monitor Server') {
            steps {
                script {
                    echo "Starting server monitoring on agent-1..."
                    sh 'echo "Checking server health on agent-1"'
                    sh 'uptime'
                }
            }
        }

        stage('ports') {
            steps {
                script {
                    echo "Checking open ports on agent-1..."
                    sh 'netstat -lntp'
                    sh 'env'
                }
            }
        }

        stage ('Docker build Image') {
            steps {
                script {
                    withAws(region: 'us-east-1', credentials: 'aws-creds') {
                        sh """ 
                            aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 993268716422.dkr.ecr.us-east-1.amazonaws.com
                            docker build -t roboshop/catalouge .
                            docker tag roboshop/catalouge:latest 993268716422.dkr.ecr.us-east-1.amazonaws.com/roboshop/catalouge:latest
                            docker push 993268716422.dkr.ecr.us-east-1.amazonaws.com/roboshop/catalouge:latest
                            docker images 
                        """
                    }
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
            echo "Monitoring failed. Please check the logs for details."
        }

        success {
            echo "Monitoring succeeded. Server is healthy."
        }
    }
}