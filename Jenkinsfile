pipeline {
    agent any
     tools{
        maven 'maven'
          }
    stages {
        
        stage('Build') {
              steps {
                  sh "mvn -B -DskipTests clean package"
                  archiveArtifacts artifacts: 'target/samplejava.war'
            }
        } 
        
    stage('Build Docker image'){
                       
            steps {
                script {
                    app = docker.build("suhita/samplejava")
                    app.inside {
                        sh 'echo $(curl localhost:80)'
                    }
                }
            }  
    }
      
                         
        stage('Push docker image'){
           
            steps{
                script {
                    docker.withRegistry('https://registry.hub.docker.com','docker_hub_login'){
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
       /*stage('Deploy kubernetes'){
          
          steps {
           kubernetesDeploy(
                kubeconfigId: 'kubeconfig',
                configs: 'application.yaml',
                enableConfigSubstitution: true)
                echo 'App url: http://54.190.168.185:30005/app'
          }
                     
        }*/
    }
}
