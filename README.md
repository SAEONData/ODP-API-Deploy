# ODP-API-Deploy

Docker-based deployment of the [ODP API](https://github.com/SAEONData/ODP-API).

## Python dependencies

To re-generate `requirements.txt` for a new release, activate the appropriate
virtual environment, and run the following command:

    pip freeze | sed -E '/^(-e\s|pkg-resources==)/d' > requirements.txt
