# ODP-API-Deploy

Docker-based deployment of the [ODP API](https://github.com/SAEONData/ODP-API).

## Installation

Create a `.env` file in the project directory on the target machine, and set the following environment variables:

- **`SERVER_ENV`**: deployment environment: `development`|`testing`|`staging`|`production`
- **`ACCOUNTS_API_URL`**: URL of the ODP Accounts API
- **`METADATA.READONLY_ROLES`**: JSON-encoded list of roles that may read metadata within the same institution
- **`METADATA.READWRITE_ROLES`**: JSON-encoded list of roles that may read and write metadata within the same institution
- **`METADATA.ADMIN_ROLES`**: JSON-encoded list of roles that may read and write metadata belonging to _any_ institution,
and that may access metadata admin functions
- **`CKAN_ADAPTER.CKAN_URL`**: URL of the CKAN server
- **`ELASTIC_ADAPTER.ES_URL`**: URL of the Elasticsearch instance; must include port
- **`ELASTIC_ADAPTER.INDICES`**: JSON-encoded list of Elasticsearch indexes

Rebuild and restart the container in the background:

    docker-compose down
    docker-compose build --no-cache
    docker-compose up -d

## Python dependencies

To re-generate `requirements.txt` for a new release, activate the appropriate
virtual environment, and run the following command:

    pip freeze | sed -E '/^(-e\s|pkg-resources==)/d' > requirements.txt
