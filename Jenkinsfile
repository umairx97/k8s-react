pipeline {
    agent {
      dockerfile true
    }
    environment {
        CI = 'true' 
        HOME="." 
    }
    stages {
      stage('Install') {
            steps {
                sh 'npm install'
            }
        }
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