pipeline {
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
}
    

