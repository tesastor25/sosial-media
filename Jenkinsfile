properties([pipelineTriggers([githubPush()])])
pipeline {
    agent { label 'master' }
      stages {
        stage("Clone Code") {
            steps {
                script {
                checkout scm
                }
            }
        }
        stage('Building Image') {
            steps{
                script {
                  sh "docker build . -t dana2cr/sosmedprod:${BUILD_NUMBER}"
                }
            }
        }
       stage('Push Image') {
            steps{
                script {
                  sh "docker push dana2cr/sosmedprod:${BUILD_NUMBER}"
                }
            }
        }
       stage('kubernetes') {
            steps{
                script {
                  sh "kubectl  set image deployment/sosmed  sosmed=dana2cr/sosmedprod:${BUILD_NUMBER} -n production"
                }
            }
        }
     }
   }
