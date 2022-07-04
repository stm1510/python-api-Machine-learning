node{
    
    def maven_home=tool name:'maven'
    
    stage ('Pull from Github'){
	git branch: 'main', url: 'https://github.com/stm1510/python-api-Machine-learning.git'
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

    stage ('Lint your Dockerfile'){
	sh "hadolint Dockerfile"
   }  
     
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
   sh "eksctl create cluster --region=us-east-1 --name=tawfiqeks --nodes=2 "
  }
  
  stage ('Deploy Image to Kubernetes with Kubectl '){
      sh "eksctl get cluster --region=us-east-1 --name=tawfiqeks > k8s.txt"
      sh "kubectl create deploy tawfiq-api --image=tawfiq15/api-python:latest"
      sh "kubectl get deploy,rs,svc,pods "
  }
  
   stage ('Port Forward of the '){
    sh "kubectl get pods | grep  "Running" | cut -d " " -f 1 > kk8.txt"   
    sh "kubectl port-forward pod/$(kk8.txt) --address 0.0.0.0 5000:80  
   } 
 
}  
