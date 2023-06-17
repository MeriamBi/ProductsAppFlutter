# ProductsAppFlutter
This repository contains a Flutter project that aims to demonstrate how to display a dynamic list retrieved from an API. The project showcases browsing a list of cars and viewing their details. Additionally, it provides a dynamic search feature that allows users to search for a car by its name.

## Setup and Run
To run this project on your local machine, follow the steps below:

- Clone the repository to your local machine using the following command:  
   `git clone https://github.com/your-username/flutter-car-app.git`
   
- Ensure that you have Docker installed on your machine.  
   If not, you can download and install Docker from the official website: [Docker Website](https://www.docker.com/)
   
- Pull the Docker image required for running the app by executing the following command:  
   `docker pull meriambi/productapp:v1.0`

- Once the Docker image is downloaded, run the container using the following command:  
   `docker run -p 9090:9090 meriambi/productapp:v1.0`  
This will start the backend server required for the app.

- Ensure that you have Flutter and the necessary dependencies installed.  
   If not, you can follow the official Flutter installation guide: [Flutter Installation](https://flutter.dev/docs/get-started/install)

- Connect an emulator to your development machine.

- Navigate to the project directory and run the app using the following command:  
   `flutter run`  
   This will launch the app on the connected emulator.

## Features
- Browse a list of cars  
- View detailed information about a selected car  
- Search for a car by its name  

## Project Structure  
The project structure is organized as follows:

- lib: Contains the main Flutter code files
- models: Contains the data models used in the app
- views: Contains the different UIs of the app
- viewmodels: Contains the services used to fetch car data
- widgets: Contains reusable widgets used in the app
