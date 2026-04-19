# MediSense – AI Healthcare App

# Description

AI-based app for disease prediction, diabetes analysis, and stress detection

# Features

Disease prediction from symptoms
Diabetes risk prediction
Mental stress analysis
Medicine identification
AI chatbot

# Installation

Download APK from Releases
Install on Android device

# Tech Stack

FlutterFlow (Frontend)
FastAPI (Backend)
TensorFlow / Scikit-learn (ML Models)
Firebase (Database)

## Backend Setup (FastAPI)

Follow these steps to run the MediSense backend locally and connect it to the app.

### 1. Install Requirements

Make sure Python is installed, then install dependencies:

pip install -r requirements.txt

---

### 2. Run FastAPI Server

Start the backend server using Uvicorn:

uvicorn main:app --reload

* This will start the API at:
  http://127.0.0.1:8000

---

### 3. Start ngrok Tunnel

To make your local server accessible from your mobile app, use ngrok:

ngrok http 8000

* You will get a public URL like:
  https://abcd1234.ngrok.io

---

### 4. Update API URL in App

* Open your FlutterFlow / frontend project
* Replace the base API URL with your ngrok URL

Example:

https://abcd1234.ngrok.io

---

### 5. Test the API

* Open browser:
  https://abcd1234.ngrok.io/docs

* This shows FastAPI Swagger UI where you can test all endpoints

---

### Important Notes

* ngrok URL changes every time you restart it
* Always update the new URL in your app
* Keep backend running while using the app

---

### Tech Stack

* FastAPI (Backend API)
* Uvicorn (ASGI Server)
* ngrok (Public URL tunneling)

---

### Troubleshooting

* If API not working → check if Uvicorn is running
* If app not connecting → verify ngrok URL is updated
* If port error → make sure port 8000 is free




