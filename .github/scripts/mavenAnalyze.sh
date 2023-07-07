#!/bin/sh
./mvnw -B verify sonar:sonar -Dsonar.projectKey=$PROJECT_KEY -Dsonar.organization=$ORG_NAME -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.login=$SONAR_TOKEN