pipeline {
    agent any
    environment{
          Docker_TAG = getDockerTag()
    }
    stages{
        stage('Deploy App') {
         steps{
              sh "chmod +x changeTag.sh"
              sh "./changeTag.sh ${Docker_TAG}"
              sshagent(['sampledemo']) {
                  sh "scp -o  StrictHostKeyChecking=no elastic-app-pod.yml ubuntu@15.207.84.91:/home/ubuntu/"
                  script{
                      try{
                          sh "ssh ubuntu@15.207.84.91 kubectl apply -f elastic-app-pod.yml"
                      } catch(error){
                           sh "ssh ubuntu@15.207.84.91 kubectl create -f elastic-app-pod.yml"
                   
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
