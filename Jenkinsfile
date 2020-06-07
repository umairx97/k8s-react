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

        stage("Docker") {
            when {
                branch 'master'
            }
            stages { 
                stage("Build Image") { 
                    steps {
                        echo registryCredential
                        echo dockerRegistry
                        script { 
                            dockerImage = docker.build dockerRegistry + ":LTS"
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
                stage('Remove Unused docker image') {
                    steps {
                        sh "docker rmi $dockerRegistry:LTS"
                    }
                }
            }
        }

        stage("Deploy to Kubernetes") { 
            steps {
                sh 'kubectl apply -f kubernetes/'
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