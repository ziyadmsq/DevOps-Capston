pipeline {
	agent any
	stages {
		stage('Lint HTML') {
			steps {
				sh 'tidy -q -e *.html'
			}
		}
		stage('Lint Dockerfile') {
        	steps {
            	sh 'hadolint Dockerfile'
        	}
      	}
		stage('Build Docker Image') {
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker build -t ziyadmsq/cloudcapstone:$BUILD_ID .
					'''
				}
			}
		}

		stage('Push Image To Dockerhub') {
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
						docker push ziyadmsq/cloudcapstone:$BUILD_ID
					'''
				}
			}
		}

		stage('Set current kubectl context') {
			steps {
				withAWS(region:'us-east-1', credentials:'aws-static') {
					sh '''
						kubectl config use-context arn:aws:eks:us-east-1:517885445462:cluster/prodalvima2
					'''
				}
			}
		}

		stage('Create blue container') {
			steps {
				withAWS(region:'us-east-1', credentials:'aws-static') {
					sh '''
						kubectl run blueimage --image=ziyadmsq/cloudcapstone:$BUILD_ID --port=80
					'''
				}
			}
		}

		stage('Expose container') {
			steps {
				withAWS(region:'us-east-1', credentials:'aws-static') {
					sh '''
						kubectl expose deployment blueimage --type=LoadBalancer --port=80
					'''
				}
			}
		}

		stage('Domain redirect blue') {
			steps {
				withAWS(region:'us-east-1', credentials:'aws-static') {
					sh '''
						aws route53 change-resource-record-sets --hosted-zone-id U7VD19G906ZKC --change-batch file://alias-record.json
					'''
				}
			}
		}
      stage('Confirm') {
			steps {
				sh 'figlet DONE'
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