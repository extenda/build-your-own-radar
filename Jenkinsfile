library identifier: 'pipeline-library', changelog: false
configuration {
  slack = 'tools-build'
  email = false
}
buildProject {
  node('ecs-small') {
    def image = "${env.EXTENDA_ECR}/extenda/tech-radar:latest"
    stage('docker-build') {
      checkout scm
      dockerCli "build --squash -t $image ."
    }

    if (branch('master')) {
      stage('docker-push') {
        dockerCli "push $image"
      }
    }
  }
}
