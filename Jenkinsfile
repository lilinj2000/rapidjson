pipeline {
  agent {
    docker {
      image 'lilinj2000/dev:centos6.gcc'
    }
  }

  environment {
    home_3rd = '/var/jenkins_home/dist_pkg/3rd/centos6'
    home_libs = '/var/jenkins_home/dist_pkg/libs/centos6'
    home_app = '/var/jenkins_home/dist_pkg/app/centos6'
  }

  stages {
    stage('build') {
      steps {
        sh '''
mkdir -p build
cd build
cmake -DINCLUDE_INSTALL_DIR=${home_3rd}/rapidjson/include ..
make
	'''
      }
    }
    stage('install') {
      steps {
        sh '''
cd build
make install
	'''
      }
    }
  }
}
