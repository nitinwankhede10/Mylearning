// Powered by Infostretch 

timestamps {

node ('maven-jdk-8-2048') { 

	stage ('predeploy - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/test']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '208618fe-9b64-4b35-9b29-9a19f6ff369f', url: 'https://github.com/nitinwankhede10/Mylearning.git']]]) 
	}
	stage ('predeploy - Build') {
 			// Ant build step
	withEnv(["PATH+ANT=${tool 'FMI'}/bin"]) { 
 			if(isUnix()) {
 				sh "ant -buildfile ${WORKSPACE}/build.xml -Dsf.samplePackageXML=${WORKSPACE}/samplePackage.xml -Dsf.username=${SALESFORCE_USERNAME} -Dsf.password=${SALESFORCE_PASSWORD} -Dserverurl=${SALESFORCE_URL} predeploy " 
			} else { 
 				bat "ant -buildfile ${WORKSPACE}/build.xml -Dsf.samplePackageXML=${WORKSPACE}/samplePackage.xml -Dsf.username=${SALESFORCE_USERNAME} -Dsf.password=${SALESFORCE_PASSWORD} -Dserverurl=${SALESFORCE_URL} predeploy " 
			} 
 		}
		archiveArtifacts allowEmptyArchive: false, artifacts: '**', caseSensitive: true, defaultExcludes: true, fingerprint: false, onlyIfSuccessful: false 
	}
	
		stage ('deploy - Build') {
	sh "ls -ltr"
	sh "ls -ltr ${WORKSPACE}"
 	
// Unable to convert a build step referring to "hudson.plugins.copyartifact.CopyArtifact". Please verify and convert manually if required.		// Ant build step
	withEnv(["PATH+ANT=${tool 'FMI'}/bin"]) { 
 			if(isUnix()) {
 				sh "ant -buildfile ${WORKSPACE}/build.xml -Dsf.samplePackageXML=${WORKSPACE}/samplePackage.xml -Dsf.username=${SALESFORCE_USERNAME} -Dsf.password=${SALESFORCE_PASSWORD} -Dserverurl=${SALESFORCE_URL} deploy " 
			} else { 
 				bat "ant -buildfile ${WORKSPACE}/build.xml -Dsf.samplePackageXML=${WORKSPACE}/samplePackage.xml -Dsf.username=${SALESFORCE_USERNAME} -Dsf.password=${SALESFORCE_PASSWORD} -Dserverurl=${SALESFORCE_URL} deploy " 
			} 
 		} 
	}
	
}

}
