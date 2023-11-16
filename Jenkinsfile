pipeline {
    agent any

    environment {
        // Store the current branch name in a variable
        CURRENT_BRANCH = "env.BRANCH_NAME"
    }

    stages {
        stage('Get Branch') {
            steps {
                script {
                    // Access the branch name using the environment variable
                    echo "Current branch is: ${CURRENT_BRANCH}"

                    // Your other build steps here
                }
            }
        }

        // Add more stages as needed
    }

    post {
        always {
            // Cleanup or post-build actions
        }
    }
}
