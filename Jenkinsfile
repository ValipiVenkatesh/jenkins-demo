pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'building docker image'
                
                sh('docker build -t valipivenkatesh/venkatesh-jenkins-demo-image .')
            }
        }
        
        
        stage('Publish to Dockerhub') {
            steps {             
                
                sh('docker login -u valipivenkatesh -p Valipi8515@')
                
                sh('docker push valipivenkatesh/venkatesh-jenkins-demo-image')
                
                echo 'pushed image to docker hub'
            }
        }
        
        
        stage('pull image from Dockerhub') {
            steps {
                
                sh('docker pull valipivenkatesh/venkatesh-jenkins-demo-image')
                
                echo 'pulled image from Dockerhub'
                
                sh('docker images')
                
                echo 'Displayed previous images && pulled image' 
            }
        }
        
        
        stage('start a container') {
            steps {
               
                sh('docker run -it -d -p 8084:80 --name venkatesh-jenkins-container123 valipivenkatesh/venkatesh-jenkins-demo-image')
                
                sh('docker exec venkatesh-jenkins-container123 service nginx start')
                
            }
        }
    }
}
