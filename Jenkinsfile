pipeline {
    agent any
    environment{
          Docker_TAG = getDockerTag()
    }
    stages{
        stage('Deploy App') {
         steps{
              sshagent(['sampledemo']) {
                  sh "scp -o  StrictHostKeyChecking=no config.yml  ubuntu@65.0.18.223:/home/ubuntu/"
                  script{
                      try{
                          sh "ssh ubuntu@65.0.18.223 kubectl create -f httppod.yml"
                      }catch(error){
                          sh "ssh ubuntu@65.0.18.223 kubectl apply -f httppod.yml"
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
