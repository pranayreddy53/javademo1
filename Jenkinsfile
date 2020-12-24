pipeline {
    agent any
    environment{
          Docker_TAG = getDockerTag()
    }
    stages{
        stage('Deploy App') {
         steps{
              sshagent(['sampledemo']) {
                  sh "scp -o  StrictHostKeyChecking=no pod.yml  ubuntu@52.66.107.60:/home/ubuntu/"
                  script{
                      try{
                          sh "ssh ubuntu@52.66.107.60 kubectl create -f pod.yml"
                      }catch(error){
                          sh "ssh ubuntu@52.66.107.60 kubectl apply -f pod.yml"
                      } 
                                    }
            }
        }
    }
}
}
def getDockerTag(){
    def tag  = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
