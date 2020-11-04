pipeline { 
    environment { 
        registry = "joebadmus/java-app" 
        registryCredential = 'dockerhub_id' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('checking deploy tools and initial clean'){
            steps{
                sh 'rm -rf codebase || true'
            }
        }
        stage('Cloning our Git') { 
            steps { 
                sh 'git clone https://github.com/joebadmus/cap-pet-proj.git codebase' 
            }
        } 
        stage('compile and build docker image'){
            steps{
                sh 'cd codebase && mvn clean install'
                sh 'cd codebase && docker build --tag joebadmus/java-app:latest .'
            }
        }
        
        stage('Deploy our image') { 
            steps { 
                withDockerRegistry([ credentialsId: "dockerhub_id", url: "" ]) {
                sh 'docker push joebadmus/java-app:latest'
                }
            }
        }
        stage('Cleaning up') { 
            steps { 
                 echo 'cleanup complete'
            }
        } 
    }
}