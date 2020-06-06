pipeline {
    agent {
      dockerfile true
    }
    environment {
        CI = 'true' 
        HOME="." 
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
      stage('Test') {
            steps {
                sh 'npm run test'
            }
        }
    }
}