pipeline {
    agent none
    environment {
        CI='true' 
        HOME="." 
        dockerRegistry="umairx97/k8s-react"
        registryCredential='DOCKER_HUB_CREDENTIALS'
        dockerImage=''
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

        stage("Build and Push Docker Image") {
            stages { 
                stage("Build Image") { 
                    steps {
                        echo registryCredential
                        echo dockerRegistry
                        script { 
                            dockerImage = docker.build dockerRegistry + ":$BUILD_NUMBER"
                        }
                        
                    }
                }
           
                stage("Push Image") { 
                    steps {
                        script {
                            docker.withRegistry('', registryCredential) {
                                dockerImage.push()
                            }
                        }
                    }
                }
            }
        }
    }
}