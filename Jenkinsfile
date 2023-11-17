pipeline {
    agent any
    stages {
        stage('Get Branch') {
            steps {
                script {
                   // Get the current branch using git commands
                  // echo "Current Branch: ${env.BRANCH_NAME}"
                    def gitBranch = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStdout: true).trim()
                    echo "Full Git Branch: ${gitBranch}"
                }

                }
            }
        }

    }

    
}
