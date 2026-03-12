# DPR Mobile App (Flutter)

## Overview

This project is a simple Flutter mobile application developed as part of the Mobile App Developer Intern selection task. The app allows users to log in, view projects, and submit a Daily Progress Report (DPR).

## Features

* Login Screen with mock authentication
* Project List Screen with static project data
* DPR Form Screen for submitting daily progress
* Image upload (1–3 images)
* Input validation
* Clean UI using Flutter widgets

## Tech Stack

* Flutter
* Dart
* intl package (for date formatting)
* image_picker package (for photo upload)

## Project Structure

lib/
screens/
login_screen.dart
project_list_screen.dart
dpr_form_screen.dart

models/
project_model.dart

data/
project_data.dart

widgets/
project_card.dart

services/
auth_service.dart

## Mock Login Credentials

Email: [test@test.com](mailto:test@test.com)
Password: 123456

## How to Run the Project

1. Ensure Flutter is installed:
   ```bash
    flutter doctor
   ```

2. Clone the repository:
   ```bash
    git clone https://github.com/Sami0402/Memorica.git
   ```

3. Install dependencies:
   ```bash
    flutter pub get
   ```

4. Run the app:
   ```bash
    flutter run
   ```

## Implemented Features

* Login authentication (mock)
* Project list display
* DPR submission form
* Date picker
* Weather dropdown
* Image upload
* Form validation

## Known Limitations

* Authentication is mocked
* DPR data is not stored permanently
* No backend integration

## Author

Sami Khan

