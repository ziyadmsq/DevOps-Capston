pipeline {
	agent any
	stages {
		stage('Lint HTML') {
			steps {
				sh 'echo "hi"'
			}
		}
		stage('Lint Dockerfile') {
        	steps {
            	sh 'ls'
        	}
      }
		stage('Build Docker Image') {
			steps {
				sh 'echo "hi"'
			}
		}

		stage('Push Image To Dockerhub') {
			steps {
				sh 'echo "hi"'
			}
		}

		stage('Set current kubectl context') {
			steps {
				sh 'echo "hi"'
			}
		}

		stage('Create blue container') {
			steps {
				sh 'echo "hi"'
			}
		}

		stage('Expose container') {
			steps {
				sh 'echo "hi"'
			}
		}

		stage('Domain redirect blue') {
			steps {
				sh 'echo "hi"'
			}
		}
      stage('Confirm!') {
			steps {
				sh 'echo "Greate!"'
			}
		}

	}
}
// ======================== \\
// pipeline {
//      agent any
//      stages {
//          stage('Build') {
//              steps {
//                  sh 'echo "Hello World"'
//                  sh '''
//                      echo "Multiline shell steps works too"
//                      ls -lah
//                  '''
//              }
//          }
//          stage('Lint HTML') {
//               steps {
//                   sh 'tidy -q -e *.html'
//               }
//          }
//          stage('Upload to AWS') {
//               steps {
//                   withAWS(region:'us-east-1',credentials:'aws-creditional-ID') {
//                   sh 'echo "Uploading content with AWS creds"'
//                       s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'static')
//                   }
//               }
//          }
//      }
// }