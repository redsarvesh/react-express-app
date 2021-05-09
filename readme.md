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

## Important Notes To run Scripts
- Make sure you have required credentials of IAM user on the given path or edit accordingly.
- Make changes according to your requirement in the script like what kind of instance you want to launch.
- Modify security groups.
- Make Autoscaling subnet private and Load Balancer subnet public and modify accordingly the script.
