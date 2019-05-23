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

   stage('Docker Build') {
   steps {
   
   script {
                    def scmVars = checkout([
                        $class: 'GitSCM',
                        doGenerateSubmoduleConfigurations: false,
                        userRemoteConfigs: [[
                            url: 'https://github.com/ramesh-github2017/Products-OCI.git'
                          ]],
                        branches: [ [name: '*/master'] ]
                      ])

    sh "docker build -t fsc-products:${scmVars.GIT_COMMIT} . --no-cache"
       
   }
  }
  } 

  stage('PUSH2OCIR') {
   steps {
   
   script {
                    def scmVars = checkout([
                        $class: 'GitSCM',
                        doGenerateSubmoduleConfigurations: false,
                        userRemoteConfigs: [[
                            url: 'https://github.com/ramesh-github2017/Products-OCI.git'
                          ]],
                        branches: [ [name: '*/master'] ]
                      ])

    
    sh "docker login -u 'codeatcustomer1/oracleidentitycloudservice/balarama.reddy.osv@fedex.com' -p '4w[MdqNRVJY[hEX8P8.#' iad.ocir.io"
    
	 sh "docker tag fsc-products:${scmVars.GIT_COMMIT} iad.ocir.io/codeatcustomer1/gladiators/fsc-products:${scmVars.GIT_COMMIT}"
	
    sh "docker push iad.ocir.io/codeatcustomer1/fsc-products:${scmVars.GIT_COMMIT}"
   }
  }
   post {
    success {
     echo "Success TEST"
    }
   }
  }
 }
 }
