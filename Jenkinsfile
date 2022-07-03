node{
    
    def maven_home=tool name:'maven'
    
    stage ('Pull from Github'){
        git credentialsId: 'githubID', url: 'https://github.com/stm1510/hellowolrd19.git'
    }

    stage ('Build Environment'){
        sh "python3 -m venv venv"
    }

    stage ('Activate The Environmetn'){
      sh "source venv/bin/activate"
    }
 

    stage ('Install the neccesary Plugins'){
      sh "make install"    
    }

    stage ('Lint your Dockerfile')  
  
    stage ('Docker Build'){
        sh " docker build -t tawfiq15/api-python:${BUILD_NUMBER} ."
    }
  

    stage ('Docker Login'){
       sh "cat /var/lib/jenkins/docker.json > /var/lib/jenkins/.docker/config.json"
    }
    

    stage ('Docker Login'){
        sh "docker login"
    }

    stage ('Docker Push'){
        sh "docker push tawfiq15/api-python:${BUILD_NUMBER}"
    }
  
  stage ('Build Kubernetes Cluster with EKS'){
   sh "eks create cluster --region=us-east-1 --name=tawfiqeks --nodes=2 "
  }
  
  stage ('Deploy Image to Kubernetes with Kubectl '){
   #Get info about the created clustes
   sh " eksctl get cluster --region=us-east-1 --name=tawfiqeks > k8s.txt"
   sh " kubectl create deploy tawfiq-api --image=tawfiq15/api-python:latest"
   #check Nodes status
   sh " kubectl get deploy,rs,svc,pods "
  }
   
 
}  
