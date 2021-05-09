# Typescript, Express and React

This repository holds a barebones Typescript + Express + React app.

## Backend commands
Run these commands from the root folder.
- `yarn` installs all dependencies for server
- `yarn run start` Starts the backend development server.
- `yarn run build` Builds the backend app to the `build` directory.


## Frontend commands
Run these commands from the `frontend` folder.
- `yarn` installs all dependencies for frontend
- `yarn run start` Starts the frontend development server.
- `yarn run build` Builds the frontend app to the `build/frontend` directory.

## Automated Deployment

This repository contains scripts which will help to deploy the code in one go.
- `aws_autoscale.sh` Main Script which will be used to deploy the code along with preparation of instance.
- `my_script.txt`  It contains the user data.
- `aws_deployment.sh` One command deployment script if there is any change in the code then in that case just run this script.
- `Dockerfile` Create image for containerization of application.
