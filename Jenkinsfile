pipeline {
    agent any
    environment{
          Docker_TAG = getDockerTag()
    }
    stages{
        stage('Deploy App') {
         steps{
              sshagent(['sampledemo']) {
                  sh "scp -o  StrictHostKeyChecking=no config.yml ubuntu@3.6.91.129:/home/ubuntu/"
                  script{
                      try{
                          sh "ssh ubuntu@3.6.91.129 kubectl create -f config.yml"
                      }catch(error){
                          sh "ssh ubuntu@3.6.91.129 kubectl apply -f config.yml"
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
