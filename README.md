# ODP-API-Deploy

Docker-based deployment of the [ODP API](https://github.com/SAEONData/ODP-API).

## Installation

### Dev platform

    sudo docker-compose -f development.yml up -d

## Python dependencies

To re-generate `requirements.txt` for a new release, activate the appropriate
virtual environment, and run the following command:

    pip freeze | sed -E '/^(-e\s|pkg-resources==)/d' > requirements.txt
