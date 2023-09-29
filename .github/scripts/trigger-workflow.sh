#!/bin/bash

# Input parameter: buildTool
buildTool="$1"

# Check the value of buildTool and trigger the appropriate workflow
if [ "$buildTool" == "maven" ]; then
  # Trigger the Maven build workflow
  echo "Triggering the Maven build workflow"
  mvn -B compile --file pom.xml
  # Use GitHub API or workflow_dispatch event trigger here
  # Example:
  # curl --request POST \
  #   --url https://api.github.com/repos/yourusername/yourrepository/actions/workflows/maven.yml/dispatches \
  #   --header 'Authorization: Bearer $GITHUB_TOKEN' \
  #   --header 'Content-Type: application/json' \
  #   --data '{"ref":"main"}'
elif [ "$buildTool" == "gradle" ]; then
  # Trigger the Gradle build workflow
  echo "Triggering the Gradle build workflow"
  # Use GitHub API or workflow_dispatch event trigger here
else
  # Handle unknown or unsupported buildTool values
  echo "Unsupported buildTool: $buildTool"
fi
