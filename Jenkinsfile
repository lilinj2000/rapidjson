pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh '''mkdir -p build

cd build

kernel=`uname -sr | sed --e=\'s/ /\\//\'`

home_3rd=$JENKINS_HOME/3rd/${kernel}

cmake -DCMAKE_INSTALL_PREFIX=${home_3rd}/rapidjson ..

make'''
      }
    }
  }
}