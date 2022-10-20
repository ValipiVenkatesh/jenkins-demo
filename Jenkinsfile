pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'building docker image'
                
                sh('docker build -t valipivenkatesh/venkatesh-docker-jenkins .')
            }
        }
        
        
        stage('Publish to Dockerhub') {
            steps {             
                
                sh('docker login -u valipivenkatesh -p Valipi8515@')
                
                sh('docker push valipivenkatesh/venkatesh-docker-jenkins')
                
                echo 'pushed image to docker hub'
            }
        }
        
        
        stage('pull image from Dockerhub') {
            steps {
                
                sh('docker pull valipivenkatesh/venkatesh-docker-jenkins')
                
                echo 'pulled image from Dockerhub'
                
                sh('docker images')
                
                echo 'Displayed previous images && pulled image' 
            }
        }
        
        
        stage('start a container') {
            steps {
                sh '''if [ $(docker ps | awk \'{print $NF}\' | grep venkatesh-jenkins-container123) = \'venkatesh-jenkins-container123\' ]; then
                        docker stop "venkatesh-jenkins-container123"
                        docker rm "venkatesh-jenkins-container123"
                      fi'''
               
                sh('docker run -it -d -p 8084:80 --name venkatesh-jenkins-container123 valipivenkatesh/venkatesh-docker-jenkins')
                
                sh('docker exec venkatesh-jenkins-container123 service nginx start')
                
            }
        }
    }
}
