pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh '''mkdir -p build

cd build

kernel=`uname -sr | sed --e=\'s/ /\\//\'`

home_3rd=$JENKINS_HOME/3rd/${kernel}

cmake -DINCLUDE_INSTALL_DIR=${home_3rd}/rapidjson/include ..

make'''
      }
    }
    stage('install') {
      steps {
        sh '''cd build

make install'''
      }
    }
  }
}