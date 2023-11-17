pipeline {
    agent any
    environment {
        DOCKER_REGISTRY_CREDS = credentials('dockerhub-credentials-id')
    }

    stages {
        stage('Get Full Git Branch') {
            steps {
                script {
                    sh 'bash deploy.sh'
                    
                    
                    }
                }
            }
        }
    } 



/*pipeline {
    agent any

    stages {
        stage('Get Full Git Branch') {
            steps {
                script {
                    def gitBranch = sh(script: 'git ls-remote --heads origin | grep $(git rev-parse HEAD) | cut -d / -f 3-', returnStdout: true).trim()
                    echo "Full Git Branch: ${gitBranch}"
                }
            }
        }

        // Add more stages as needed
    }
}*/

/*pipeline {
    agent any

    stages {
        stage('Check Branch') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        echo 'This is the dev branch.'
                        // Add steps specific to the dev branch
                        sh 'bash build.sh'
                    } else {
                        echo 'This is not the dev branch.'
                        // Add steps for other branches
                    }
                }
            }
        }

        // Add more stages as needed
    }
} */
    

