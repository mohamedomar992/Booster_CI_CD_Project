pipeline{
	agent any
    stages {
    	// stage('Install Dependencies')
    	// {
    	// 	steps 
    	// 	{
    	// 		sh 'echo "installing Dependencies"'
    	// 		sh 'pip install --user -r requirements.txt'
    	// 	}
    	// }
 
  //       stage('Linting') 
  //       {
  //           steps 
  //           {
  //           }
  //       }
		// stage('Build image')
		// {
		// 	steps
		// 	{
		// 		sh './run_docker.sh'
		// 	}
		// }
		// stage('test')
		// {
		// 	steps
		// 	{
		// 	}
		// }
		// stage('Push image')
		// {
		// 	environment{
		// 		DOCKER_USER = credentials('docker_username')
		// 		DOCKER_PASSWORD = credentials('docker_password')
		// 	}
		// 	steps
		// 	{
		//  	}
		// }

}
   post {
        always {
	    /* Use slackNotifier.groovy from shared library and provide current build result as parameter */   
            slackNotifier(currentBuild.currentResult)
            cleanWs()
        }