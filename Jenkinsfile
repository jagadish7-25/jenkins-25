pipeline {
    agent none
    
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
    }
    
    post {
        always {
            echo "Monitoring complete"
        }
    }
}