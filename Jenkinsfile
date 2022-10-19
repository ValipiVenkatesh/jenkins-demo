pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'building docker image'
                
                sh('docker build -t valipivenkatesh/venkatesh_jenkins_image .')
            }
        }
        
        
        stage('Publish to Dockerhub') {
            steps {             
                
                sh('docker login -u valipivenkatesh -p Valipi8515@')
                
                sh('docker push valipivenkatesh/venkatesh_jenkins_image')
                
                echo 'pushed image to docker hub'
            }
        }
        
        
        stage('pull image from Dockerhub') {
            steps {
                
                sh('docker pull valipivenkatesh/venkatesh_jenkins_image')
                
                echo 'pulled image from Dockerhub'
                
                sh('docker images')
                
                echo 'Displayed previous images && pulled image' 
            }
        }
        
        
        stage('start a container') {
            steps {
               
                sh('docker run -it -d -p 8084:80 --name venkatesh-jenkins-demo-container valipivenkatesh/venkatesh_jenkins_image')
                
                sh('docker exec venkatesh-jenkins-container service curl start')
                
            }
        }
    }
}
