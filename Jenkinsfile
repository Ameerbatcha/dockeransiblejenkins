pipeline {
    agent any
    
    tools {
            maven 'maven'
          }
          
    environment {
        DOCKER_TAG = getVersion()
    }
          
  
    stages {
        
        stage('SCM') {
            steps {
              git 'https://github.com/Ameerbatcha/dockeransiblejenkins.git'  
            }
        }
        
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }
      
        stage('Create an Image') {
            steps {
              sh 'docker build . -t ameerbatcha/regapp:${DOCKER_TAG}'
            }
        }
        
         
         stage('Push image into repo') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhubpasswd')]) {
                      sh 'docker login -u ameerbatcha -p ${dockerhubpasswd}'
                   }
             
              sh 'docker push ameerbatcha/regapp:${DOCKER_TAG}'
            }
         }
         
         
          stage('Deploy on Container') {
            steps {
           ansiblePlaybook credentialsId: 'dev-dockerhost', disableHostKeyChecking: true, extras: '-e DOCKER_TAG=${DOCKER_TAG}', installation: 'ansible', inventory: 'dev.inv', playbook: 'deploy-docker.yml'
            }
        }
        
    }
}


def getVersion(){
    def commitHash = sh label: '' , returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}

