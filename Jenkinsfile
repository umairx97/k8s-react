pipeline {
    agent {
        docker {
            image 'node:12-alpine'
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true' 
        HOME="." 
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
    }
}