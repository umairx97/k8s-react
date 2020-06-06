pipeline {
    agent none
    environment {
        CI='true' 
        HOME="." 
    }
    stages {
        stage("Test & Build") { 
            agent {
                dockerfile true
            }
            steps {
                sh 'npm install'
                sh 'npm test'
                sh 'npm run build'
            }      
        }
    }
}