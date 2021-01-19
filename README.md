# GeoServer

Geoserver contructed from the ground up, based on the zip file found on the official geoserver download homepage:
http://geoserver.org/download/

## Pre-Requirements

For succesfully running this Repo you need to have at least docker (locally) installed. The image has been constructed mainly for usage within Kubernetes, but
local test runs are also possible.

## Building the image
To build the image locally, build it via the following command: `docker build --no-cache -t <imagename:imagetag> .`

# GeoServer configuration / docker image

To succesfully run the image locally or dedicated, the following info has to be supplied:

## Mandatory
- -Xms${INITIAL_MEMORY}
  - Initial memory used to start the container with. This ENV isn't linked and has to be set manually.
  - Not setting it will result in the application not starting!
- -Xmx${MAXIMUM_MEMORY}
  - Maximum memory used to start the container with. This ENV isn't linked and has to be set manually. 
  - Not setting it will result in the application not starting!
- ${geoserver_adminpw}
  - Admin password to be set for accessing Geoserver. 
  - Please note the user is always "admin". 
  - The password will be stored encrypted inside the "users.xml" file, found in the ${GEOSERVER_DATA_DIR} directory.

## Optional 
(for use within the datastore.xml file in /opt/geoserver/data_dir/workspaces/sensrnet/mongodb-sensors/datastore.xml)
- ${MONGO_HOST}
  - For example: "mongo"
- ${MONGO_PORT}
  - For example: "27017"
- ${MONGO_DATABASE}
  - For example: "sensrnet"

# Launching

Start:

```bash
$ docker-compose up
```

Stop:

```bash
$ docker-compose stop
```
