pipeline {
    agent any
    
    stages {
        stage('checking deploy tools and initial clean'){
            steps{
                sh 'mvn --version'
                sh 'java -version'
                sh 'git --version'
                sh 'rm -rf codebase || true'
            }
        }
        stage('pull down code base'){
            steps{
                sh 'git clone https://github.com/joebadmus/cap-pet-proj.git codebase'
            }
        }

        stage('compile and build docker image'){
            steps{
                sh 'cd codebase && mvn clean install'
                sh 'docker build --tag java-app:1.0 .'
            }
        }

        stage('Deploy image to docker hub'){
            steps {

                echo 'code Deployed'
            }
        }
        
        stage('test code on app server'){
            steps {
                echo 'code tested'
            }
        }
        

        stage('complete'){
            steps {
                echo 'complete'
            }
        }
    }
}