pipeline {
    agent any
    environment {
        DOCKER_ID = credentials('DOCKER_ID')
        DOCKER_PASSWORD = credentials('DOCKER_PASSWORD')
    }
    
    stages {
        stage('Build and Push') {
            steps {
                script {
                    sh 'echo "build and push phase"'
                    sh 'bash deploy.sh'
                       }
                }
            }
          
    stage('K8S Deploy') {
        steps{   
            script {
                withKubeConfig([credentialsId: 'K8S', serverUrl: '']) {
                sh ('kubectl apply -f deployment.yaml')
                }
            }
        }
       } 

    } 
} 
