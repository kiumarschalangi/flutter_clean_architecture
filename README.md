
# Flutter Clean architecture

## Overview

This Flutter project serves as a clean architecture boilerplate with a modular structure. It is designed to help you kickstart your Flutter projects with a solid architecture foundation. The project follows a module-based structure, where each module is a self-contained folder that contains domain logic, data sources, and presentation components. Additionally, each module includes a configuration folder and a constants folder for easier organization.

## Modules

- **User info**: Contains user email and user name .



## Getting Started

1. **Clone the Repository**: Clone this repository to your local machine using Git.

```bash
git clone < repository_url >
```

2. **Install Dependencies**: Navigate to the project's root directory and install the required dependencies using Flutter's package manager.

```bash
flutter pub get
```

3. **Run the App**: Launch the app on your preferred emulator or physical device.

```bash
flutter run
```
***Dependencies used 
  flutter_bloc: as state manager
  equatable: to compare objects 
  hive: as local storage 
  http: for communication with remote apis 
  hive_flutter: local storage 


***folder structure 

  - **domain**: contains entities ,useCases and repository interface.
  - **data**: contains data sources (remote ,local) , repository implementation and models.
  - **presentation**: contains UI components in the widget folder , screen , bloc.
  - **config**: contains configurations like router, themes , … 
  - **constants**: contains our constants values like strings, api path , …
