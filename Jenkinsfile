pipeline {
    agent any

    

    stages {
        stage('Get Branch') {
            steps {
                script {
                   // Get the current branch using git commands
                    def currentBranch = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStdout: true).trim()
                    echo "Current branch is: ${currentBranch}"

                }
            }
        }

    }

    
}
