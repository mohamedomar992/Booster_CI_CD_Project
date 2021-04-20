pipeline{
	agent any
    stages {
		stage('Build image')
		{
			steps
			{
				sh 'docker build -t django_server:v1 .'
				sh 'docker image ls'
			}
			success{
				slackSend(color:"#00FF00",message:"success")
			}
		}
		stage('Push image')
		{
			environment{
				DOCKER_USER = credentials('docker_username')
				DOCKER_PASSWORD = credentials('docker_password')
			}
			steps
			{
				sh './upload_docker.sh'	
		 	}
			success{
				slackSend(color:"#00FF00",message:"success")
			}
		}
		stage('Deploy')
		{
			steps
			{
				sh 'docker run -d -p 127.0.0.1:5000:8000 --name booster_project django_server:v1'
			}
			success{
				slackSend(color:"#00FF00",message:"success")
			}
		}

}

    }