pipeline {
    agent any
    
    environment {
        TELEGRAM_BOT_TOKEN = '7589310720:AAHyOUC_Yak67Fb0yAKA9jEsqPv8oaJu0UY'
        TELEGRAM_CHAT_ID = '5841951613'
        REPO_OWNER = 'peible'
        REPO_NAME = 'jenkins'
    }

    stages {
        stage('Check Commit') {
            steps {
                script {
                    def commitSHA = sh(script: "curl -s https://api.github.com/repos/${env.REPO_OWNER}/${env.REPO_NAME}/commits/main | jq -r '.sha'", returnStdout: true).trim()
                    echo "Latest commit SHA: ${commitSHA}"

                    if (commitSHA) {
                        sendTelegramMessage(commitSHA)
                    } else {
                        error "Failed to retrieve commit SHA"
                    }
                }
            }
        }
        
        stage('List Branches') {
            steps {
                script {
                    def branches = sh(script: "curl -s https://api.github.com/repos/${env.REPO_OWNER}/${env.REPO_NAME}/branches | jq -r '.[].name'", returnStdout: true).trim()
                    echo "Branches in repository: \n${branches}"
                }
            }
        }
    }
}

def sendTelegramMessage(commitSHA) {
    sh "curl -s -X POST https://api.telegram.org/bot${env.TELEGRAM_BOT_TOKEN}/sendMessage -d chat_id=${env.TELEGRAM_CHAT_ID} -d text='New commit on main branch: ${commitSHA}'"
}
