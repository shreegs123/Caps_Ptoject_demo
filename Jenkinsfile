pipeline {
    agent any

    

    stages {
        stage('Get Branch') {
            steps {
                script {
                   // Get the current branch using git commands
                   sh 'git for-each-ref --format='%(upstream:short)' "$(git symbolic-ref -q HEAD)"'

                }
            }
        }

    }

    
}
