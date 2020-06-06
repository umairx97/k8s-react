pipeline {
    agent none
    environment {
        CI='true' 
        HOME="." 
    }
    stages {
        stage('Install') {
            agent {
                dockerfile true
            }
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            agent {
                dockerfile true
            }    
            steps {
                sh 'npm run test'
            }
        }

        stage('Build') {
            agent {
                dockerfile true
            } 
            steps {
                sh 'npm run build'
            }
        }
      
    }
}