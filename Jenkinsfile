pipeline {
    agent agent-1
    
    stages {
        stage('Monitor Server') {
            agent any
            steps {
                script {
                    echo "Starting server monitoring..."
                    // Add your monitoring commands here
                    sh 'echo "Checking server health"'
                    sh 'uptime'
                }
            }
        }

        stage('ports')
        {
            agent any
            steps {
                script {
                    echo "Checking open ports..."
                    // Add your port checking commands here
                    sh 'netstat -lntp'
                    sh 'env'
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