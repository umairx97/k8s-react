def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]

pipeline {
    agent any
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
              docker { 
                  image 'node:lts-alpine3.9'
                  args '-p 3000:3000' 
              }
            }
            steps {
                sh 'npm install'
                sh 'npm test'
                sh 'npm run build'
            }      
        }

        stage("Build and Push Docker Image") {
            when {
                branch 'master'
            }
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
        stage('Remove Unused docker image') {
            when {
                branch 'master'
            }
            steps {
                sh "docker rmi $dockerRegistry:$BUILD_NUMBER"
            }
        }
    }

    post {
        always {
            slackSend channel: '#lets-learn-notice',
                color: COLOR_MAP[currentBuild.currentResult],
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} Branch: ${env.BRANCH_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
        }
    }
}