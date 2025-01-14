pipeline {
    agent { label 'PROD' }

    stages {
        stage('Clone') {
            steps {
                git url: 'https://github.com/Shubhamt111/Student-Management-App.git', branch: 'main'
            }
        }
        stage('Maven Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t myapp .'
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Stop any running container based on the same image
                    def containerId = sh(script: "docker ps -q --filter ancestor=myapp", returnStdout: true).trim()
                    if (containerId) {
                        sh "docker stop ${containerId}"
                        sh "docker rm ${containerId}"
                    }
                    
                    // Ensure all containers are stopped before starting a new one
                    sh 'docker ps -q | xargs -r docker stop'
                    sh 'docker ps -a -q | xargs -r docker rm'

                    // Start a new container
                    sh 'docker run -d -p 9090:7788 --name myapp_container myapp'
                }
            }
        }
    }
}
