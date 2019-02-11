node {
  stage('Initialize'){
    def mavenHome  = tool 'myMaven'
    env.PATH = "${mavenHome}/bin:${env.PATH}"
  }
  stage('Build') {
    git branch: 'ci_cd', url: 'https://github.com/tom2m/spring-boot-web-app.git'
    sh "mvn package -DskipTests"
  }
  stage('JUnit') {
    sh "mvn test"
  }
  stage('Integration tests') {
    sh "mvn verify -DskipUTs=true"
  }
  stage('Build Image') {
    sh "oc start-build sample-java-app --from-file=target/spring-boot-web-app-1.0.0-SNAPSHOT.jar --follow"
  }
  stage('Deploy') {
    openshiftDeploy depCfg: 'sample-java-app'
    openshiftVerifyDeployment depCfg: 'sample-java-app', replicaCount: 1, verifyReplicaCount: true
  }
}
