pipeline {
	agent any

	environment {
	def project = 'fsc'
	def appName = 'fsc-products'  
	def imageVersion = "${env.BUILD_NUMBER}.0.0" 
	def namespace = 'b-namespace'
	def imageTag = "iad.ocir.io/fedexoraclecloud/${project}/${appName}:${imageVersion}"
	}
	
	stages {
		//Stage 1: Build the JAR file with Maven.
		stage('Build') {
			steps {
				sh("mvn clean install -DskipTests")
			}
		}

		//Stage 2: Build the docker image.
		stage('Build docker image') {
			steps {
				sh("docker build -t ${imageTag} .")
			}
		}

		//Stage 3: Push the image to docker registry
		stage('Push image to registry') {
			steps {
				sh "docker login -u 'fedexoraclecloud/oracleidentitycloudservice/5297102' -p 'z;.4Ld>Ach]f61pv6[y0' iad.ocir.io"
				sh("docker push iad.ocir.io/fedexoraclecould/fsc/commerce-services:0.0.1")
			}
		}
		 
		//Stage 4: Deploy Application
		/*stage('Deploy Application') {
			steps {
				sh("kubectl get ns ${namespace} || kubectl create ns ${namespace}")
				sh("sed -i 's#iad.ocir.io/fedexoraclecloud/fsc/${appName}:latest#${imageTag}#g' ./*.yml")
				sh("kubectl --namespace=${namespace} apply -f deployment-br.yml")
				sh("kubectl --namespace=${namespace} apply -f service-br.yml")
			}	
		} */
	}
}
