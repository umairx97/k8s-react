pipeline {
    agent {
      dockerfile true
    }
    environment {
        CI = 'true' 
        HOME="." 
    }
    stages {
        stage('Test') {
            steps {
                sh 'npm run test'
            }
        }
    }
}