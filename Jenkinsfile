pipeline {
 agent any
 tools {
  maven 'mvn'
  jdk 'jdk'
 }
 stages {
  stage('Initialize') {
   steps {
    sh '''
    echo "PATH = ${PATH}"
    echo "M2_HOME = ${M2_HOME}"
    '''
   }
  }

  stage('Build') {
   steps {
    sh 'mvn -U -Dmaven.test.failure.ignore=true -DskipTests=true install'
    
   }
   post {
    success {
     echo "Success TEST"
    }
   }
  }
  stage('Docker-Build') {
   steps {

    sh "docker build -t iad.ocir.io/codeatcustomer1/gladiators/fsc-products:1.0.0 . --no-cache"
    //sh "docker build -t fsc-config-server:0.0.1 ."
    //sh "docker images"
    //sh "kubectl --version"
    //sh ""
    sh "docker push iad.ocir.io/codeatcustomer1/gladiators/fsc-products:1.0.0"
   }
   post {
    success {
     echo "Success TEST"
    }
   }
  }
 }
 }
