pipeline {
    agent any
    environment{
          Docker_TAG = getDockerTag()
    }
    stages{
        stage('Deploy App') {
         steps{
              sshagent(['sampledemo']) {
                  sh "scp -o  StrictHostKeyChecking=no config.yml ubuntu@13.233.196.119:/home/ubuntu/"
                  script{
                      try{
                          sh "ssh ubuntu@13.233.196.119 kubectl apply -f config.yml"
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
