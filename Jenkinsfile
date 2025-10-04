pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out repository..."
                checkout scm
            }
        }

        stage('Prepare Scripts') {
            steps {
                echo "Ensuring deploy script is executable..."
                sh 'chmod +x ./scripts/deploy-prod.sh'
            }
        }

        stage('Deploy Static Site') {
            steps {
                echo "Running deploy-prod.sh to deploy infrastructure and static site..."
                sh './scripts/deploy-prod.sh'
            }
        }
    }

    post {
        success {
            echo "✅ Deployment completed successfully!"
        }
        failure {
            echo "❌ Deployment failed! Check logs for errors."
        }
    }
}
