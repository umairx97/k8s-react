pipeline {
  agent {
      dockerfile true
  }
  environment {
    CI=true
  }
  stages {
      stage('Install') { 
          steps {
              sh 'npm run build' 
          }
      }
  }
}