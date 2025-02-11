pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                script {
                    sh 'git clone https://github.com/your-username/your-repo.git workspace'
                }
            }
        }
        stage('List Branches') {
            steps {
                script {
                    sh './scripts/branch-commit.sh'
                }
            }
        }
    }
    post {
        success {
            script {
                def commitSha = sh(script: 'git rev-parse HEAD', returnStdout: true).trim()
                sh "./scripts/notify-tg.sh ${commitSha}"
            }
        }
    }
}
