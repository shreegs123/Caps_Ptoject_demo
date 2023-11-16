pipeline {
    agent any

    

    stages {
        stage('Get Branch') {
            steps {
                script {
                   // Get the current branch using git commands
                   sh 'git_branch=$(git rev-parse --abbrev-ref HEAD)'

                }
            }
        }

    }

    
}
