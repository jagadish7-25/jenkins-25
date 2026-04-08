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