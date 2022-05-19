pipeline {
    agent {
        docker { 
            image 'cypress/base:14.16.0' 
            args '--ipc=host --shm-size 512M' 
        }
    }
    stages {
        stage('Stage 1') {
            steps {
                echo 'Hello world!' 
            }
        }
        stage('Stage 2') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'gitpw')]) {
                        sh 'echo -n "" > filename.txt'
                        sh 'git add .'
                        sh 'git commit -am \"test\"'
                        sh 'git push https://scm.bluebeam.com/scm/~valagenov/jenkins-test.git --all'
                }
            }
        }
    }
}