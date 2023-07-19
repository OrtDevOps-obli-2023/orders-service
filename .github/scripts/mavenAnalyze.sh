#!/bin/sh
./mvnw -B verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.qualitygate.wait=true -Dsonar.projectKey=$PROJECT_KEY -Dsonar.organization=$ORG_NAME -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.login=$SONAR_TOKEN

# mvn -Dsonar.coverage.jacoco.xmlReportPaths=
#       $JACOCO_XML
#     sonar:sonar -Pcoverage