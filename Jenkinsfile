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
    
    sh "docker login -u 'codeatcustomer1/oracleidentitycloudservice/balarama.reddy.osv@fedex.com' -p '4w[MdqNRVJY[hEX8P8.#' iad.ocir.io"
    
    sh "docker push iad.ocir.io/codeatcustomer1/gladiators/fsc-products:1.0.0"
    
    sh "kubectl apply -f deployment.yml"
   }
   post {
    success {
     echo "Success TEST"
    }
   }
  }
 }
 }
