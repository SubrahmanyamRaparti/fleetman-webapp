pipeline {
   agent any

   environment {
     DOCKERHUB_USERNAME = 'subrahmanyamr'
     APPLICATION_NAME = "fleetman"
     SERVICE_NAME = "webapp"
     REPOSITORY_TAG="${DOCKERHUB_USERNAME}/${APPLICATION_NAME}-${SERVICE_NAME}:latest"
   }

   stages {

      stage('Pre-Build') {
         steps {
           sh '''
               echo Pipeline started at $(date)
              '''
         }
      }

      stage('Build Image') {
         steps {
           sh '''
               echo Building Image for Fleetman Webapp.
               docker image build -t ${REPOSITORY_TAG} .
              '''
         }
      }

      stage('Push Image') {
         environment {
            DOCKER_CREDENTIALS = credentials('dockercredentials')
         }
         steps {
           sh '''
               echo ${DOCKER_CREDENTIALS_PSW} | docker login -u ${DOCKER_CREDENTIALS_USR} --password-stdin
               echo Pushing Docker Image Fleetman Queue to Docker Hub.
               docker image push ${REPOSITORY_TAG}
               docker logout
              '''
         }
      }
      
      stage('Post-Build') {
         steps {
           sh '''
               echo Pipeline ended at $(date)
              '''
         }
      }
   }
}
