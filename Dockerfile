# Container image that runs your code
FROM ubuntu

RUN apt-get update && apt-get install -y jq && apt-get install -y wget && apt-get install -y curl

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh", $INPUT_version, $INPUT_repo, $INPUT_file]
