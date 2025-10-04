pipeline {
  environment {
    DOCKER_CLI_EXPERIMENTAL = 'enabled'
    registry = 'harshithkelkar/notepad-static-site'
    gitCredential = 'GITHUB_CREDENTIALS'
    DOCKERHUB_CREDENTIALS = credentials('DOCKER_CREDENTIALS')
  }
  agent any
  stages {
    stage('Cloning our Git') {
      steps {
        git credentialsId: gitCredential, url: 'https://github.com/Harshithhk/notepad-static-site.git', branch: 'main'

        echo 'Fetch successfull'
      }
    }
    stage('Checking if docker available') {
      steps {
        script {
            echo 'Checking docker version'
            sh 'docker --version'
        }
      }
    }
    stage('Building our image') {
      steps {
        script {
            // Create a builder instance
            sh 'docker buildx create --use'

            // Build multi-architecture image
            sh "docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t ${registry}:latest ."

            // Push multi-architecture image with registry credentials
            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u harshithkelkar --password-stdin'

            sh "docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t ${registry}:latest --push ."
        }
      }
    }
  }
}
